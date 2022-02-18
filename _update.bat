@echo off

cls && echo git-add
git add -A
echo End of adding && pause > nul

cls && echo git-commit

:setcommit
set /p ask=Your commit at now:
if "%ask%" == "" (
  cls
  echo git-commit
  echo Commit cannot be space
  goto setcommit
)
set datewithoutweek=%date:~0,10%
echo Your commit is %datewithoutweek:/=.%_%time:~0,5%:%ask%

set /p ask=Continue?(y/n):
if /I "%ask%" EQU "n" (
  cls
  echo git-commit
  echo set your commit again :]
  goto setcommit
)

set datewithoutweek=%date:~0,10%
git commit -m "%datewithoutweek:/=.%-%time:~0,5%:%ask%"
set datewithoutweek=

echo End of committing && pause > nul

cls && echo git-push
start /HIGH /WAIT /B "auto-push" .\auto\auto-push.bat

:EndinG
set ask=
exit && exit