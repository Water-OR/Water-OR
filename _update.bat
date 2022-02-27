@echo off

call:auto-add
cls
call:auto-commit
cls
call:auto-push
cls

set /p talk=End<nul
set talk=
pause > nul && exit
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:auto-add
git add -A
set /p talk=End of adding<nul
set talk=
pause > nul && goto :eof
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:auto-commit

:setcommit
set /p ask=Your commit:
if "%ask%" == "" (
  cls
  echo [31mError:Commit cannot be space![0m
  goto setcommit
)

set datewithoutweek=%date:~0,10%
set commit_inp=%datewithoutweek:/=.%_%time:~0,5%_Update=%ask%
echo Your commit is %commit_inp%

set /p ask=Continue?(y/n):
if /I "%ask%" == "n" (
  cls
  echo set your commit again :]
  goto setcommit
)

git commit -m "%commit_inp%"
set datewithoutweek=
set ask=

set /p talk=End of committing<nul
set talk=
pause > nul && goto :eof
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:auto-push
set pushcommand= -u origin main:main
echo Auto pushing now.
echo Command:git push%pushcommand%
goto pushnow

:BadAction
echo I'm sorry, but the pushing failed :[
pause > nul
cls

set /p aks=Break?(y/n):
if /I "!aks!" == "y" (
  goto Ending
)
set aks=
set /p aks=Auto push?(y/n):
if /I "%aks%" == "n" (
  set aks=
  cls
  echo Push By yourself :]
  set /p pushcommand=Command:git push
  goto pushnow
) else (
  set ask=
  set pushcommand= -u origin main:main
  echo Auto pushing now.
  echo Command:git push%pushcommand%
  goto pushnow
)


:GoodGame
set /p talk=[41mThat's Amazine. Your Pushing is Successful![0m<nul
set talk=
pause > nul

:Ending
set aks=
goto :eof

:pushnow
echo ------------------------------------------------------------
git push%pushcommand%
echo ------------------------------------------------------------
if "%errorlevel%" == "0" ( goto GoodGame ) else ( goto BadAction )
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::