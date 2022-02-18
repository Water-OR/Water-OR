@echo off

echo git push -u origin main:main
git push -u origin main:main

if "%errorlevel%" == "0" ( goto GoodGame )

:BadAction
echo End of this round
pause > nul
cls
echo git-push
echo I'm sorry, but the pushing failed :[

set /p aks=Stop pushing?(y/n):
if /I "%aks%" EQU "y" (
  echo Break
  goto Ending
)

set /p aks=Auto push again(y/n):
if /I "%aks%" EQU "n" (
  cls
  echo Push By yourself :]
  set /p kas=git push
  git push%kas%
  set kas=
  if "%errorlevel%" == "0" ( cls && goto GoodGame ) else ( goto BadAction )
) else (
  echo git push -u origin main:main
  git push -u origin main:main
  if "%errorlevel%" == "0" ( cls && goto GoodGame ) else ( goto BadAction )
)


:GoodGame
echo Pushing Successful!

:Ending
pause > nul
set aks=
exit