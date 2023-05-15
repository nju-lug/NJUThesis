# https://github.com/stone-zeng/tl-depend-analysis/

if [ -z "$1" ]; then
    MIRROR=https://mirror.ctan.org
else
    MIRROR=$1
fi

curl -o texlive.tlpdb        $MIRROR/systems/texlive/tlnet/tlpkg/texlive.tlpdb
curl -o texlive.tlpdb.sha512 $MIRROR/systems/texlive/tlnet/tlpkg/texlive.tlpdb.sha512
sha512sum -c texlive.tlpdb.sha512
rm texlive.tlpdb.sha512

if [ ! -d data ]; then
    mkdir data
fi

mv texlive.tlpdb data/
