checksuppfiles = {"*.bib"}
testfiledir = "test/biblatex"
supportdir = testfiledir

checkfiles = {"*.tex"}
lvtext = ".tex"
test_types.log.test = ".tex"
checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    return "biber " .. name
  else
    return ""
  end
end
