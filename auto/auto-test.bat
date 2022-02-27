@echo off
chcp 65001 && cls
echo 配色方案如下：
echo i=0 [0mHello-world[0m
echo i=1 [1mHello-world[0m
echo i=4 [4mHello-world[0m
echo i=7 [7mHello-world[0m
for /L %%i in (30, 1, 37) do ( echo i=%%i [%%imHello-world[0m )
for /L %%i in (40, 1, 47) do ( echo i=%%i [%%imHello-world[0m )
for /L %%i in (90, 1, 97) do ( echo i=%%i [%%imHello-world[0m )
for /L %%i in (100, 1, 107) do ( echo i=%%i [%%imHello-world[0m )

echo For example ESC[31mESC[46m is [31m[46mHello-world[0m

pause > nul && exit