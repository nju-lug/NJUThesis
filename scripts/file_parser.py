# https://github.com/stone-zeng/tl-depend-analysis/

import os
import re
import sys
from typing import TextIO


LUA_MODULE_PATTERN = re.compile(r'''
    \brequire\s*
    \(?\s*["'](.+?)["']
''', re.VERBOSE)
LUALIBS_MODULE_PATTERN = re.compile(r'''
    loadmodule\s*
    \(*\s*["'](.+\.lua)["']
''', re.VERBOSE)
CLASS_PATTERN = re.compile(r'''
    \\(?:LoadClass|LoadClassWithOptions|documentclass)\s*
    (?:\[.*\]\s*)?
    \{\s*(.+?)\s*\}
''', re.VERBOSE)
PACKAGE_PATTERN = re.compile(r'''
    \\(?:RequirePackage|RequirePackageWithOptions|usepackage)\s*
    (?:\[.*\]\s*)?
    \{\s*(.+?)\s*\}
''', re.VERBOSE)
USEFONT_PATTERN = re.compile(r'''
    \\usefont\s*
    \{\s*(.+?)\s*\}\s*
    \{\s*(.+?)\s*\}
''', re.VERBOSE)


class Parser:

    def __init__(self, path: str):
        self.path = path
        self.state = State()
        self.depend: set[str] = set()

    def parse(self):
        try:
            with open(self.path, 'r', encoding='utf-8', errors='replace') as fp:
                match os.path.splitext(self.path)[1]:
                    case '.tex' | '.ltx' | '.cls' | '.sty' | '.def' | '.clo':
                        self._parse_tex(fp)
                    case '.lua':
                        self._parse_lua(fp)
                    case _:
                        print('Unknown file type:', self.path, file=sys.stderr)
        except FileNotFoundError:
            print('File not found:', self.path, file=sys.stderr)

    def _parse_lua(self, fp: TextIO):
        comment_flag = False
        for line in fp:
            line = line.strip()
            if line.startswith('--[['):
                comment_flag = True
                continue
            if line.endswith(']]') or line.endswith(']]--'):
                comment_flag = False
                continue
            if not comment_flag and not line.startswith('--'):
                self.depend.update(self._parse_lua_line(line))

    def _parse_lua_line(self, line: str) -> list[str]:
        if match := LUA_MODULE_PATTERN.findall(line):
            return [match[0] + '.lua']
        if match := LUALIBS_MODULE_PATTERN.findall(line):
            return [match[0]]
        return []

    def _parse_tex(self, fp: TextIO):
        for line in fp:
            if line.rstrip() == '\\endinput':
                return
            if not line.strip().startswith('%'):
                self.depend.update(self._parse_tex_line(line))

    def _parse_tex_line(self, line: str) -> list[str]:
        if self.state.stack == '':
            # Classes (single line)
            # - \LoadClass[...]{class}
            # - \documentclass[...]{class}
            if match := CLASS_PATTERN.findall(line):
                return self._parse_cls_sty_match(match, suffix='.cls')

            # Packages (single line)
            # - \RequirePackage[...]{package}
            # - \usepackage[...]{package}
            if match := PACKAGE_PATTERN.findall(line):
                return self._parse_cls_sty_match(match, suffix='.sty')

            # Packages (multiple line)
            if '\\RequirePackage' in line or '\\usepackage' in line:
                self.state.update(line.split('%')[0].strip())

            if match := USEFONT_PATTERN.findall(line):
                return self._parse_font_match(match)

            return []

        self.state.update(line.split('%')[0].strip())

        if self.state.is_braces_closed():
            match = PACKAGE_PATTERN.findall(self.state.stack)
            self.state.reset()
            return self._parse_cls_sty_match(match, suffix='.sty')

        return []

    @staticmethod
    def _parse_cls_sty_match(match: list[str], suffix: str) -> list[str]:
        res = []
        for m in match:
            for s in map(str.strip, m.split(',')):
                if Parser._is_valid_name(s):
                    res.append(s + suffix)
        return res

    @staticmethod
    def _parse_font_match(match: list[str]) -> list[str]:
        res = []
        for m in match:
            encoding, family = m
            if Parser._is_valid_name(encoding) and Parser._is_valid_name(family):
                res.append(f'{encoding.strip()}{family.strip()}.fd'.lower())
        return res

    @staticmethod
    def _is_valid_name(name: str) -> bool:
        return (
            name != ''
            and '\\' not in name and '#' not in name
            and not name.startswith('.')
        )


class State:
    def __init__(self):
        self.stack = ''
        self.braces_count = 0
        self.braces_open = False
        self.brackets_count = 0
        self.brackets_open = False

    def __repr__(self) -> str:
        return ', '.join([
            f'stack = "{self.stack}"',
            f'braces_count = {self.braces_count}',
            f'braces_open = {self.braces_open}',
            f'brackets_count = {self.brackets_count}',
            f'brackets_open = {self.brackets_open}',
        ])

    def update(self, line: str):
        self.stack += line
        for c in line:
            match c:
                case '{':
                    self.braces_count += 1
                    self.braces_open = True
                case '}':
                    self.braces_count -= 1
                case '[':
                    self.brackets_count += 1
                    self.brackets_open = True
                case ']':
                    self.brackets_count -= 1
                    self.brackets_open = False

    def is_braces_closed(self):
        return self.braces_count == 0 and self.braces_open and not self.brackets_open

    def reset(self):
        self.stack = ''
        self.braces_count = 0
        self.braces_open = False
        self.brackets_count = 0
        self.brackets_open = False


def _main():
    if len(sys.argv) < 2:
        print('Usage: python file_parser.py <file>', file=sys.stderr)
        sys.exit(1)

    parser = Parser(sys.argv[1])
    parser.parse()
    for d in sorted(parser.depend):
        print(d)


if __name__ == '__main__':
    _main()
