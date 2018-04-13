@echo off
SET THEFILE=d:\facu\fod2017\scr\practica2\p2e3\p2e3.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o d:\facu\fod2017\scr\practica2\p2e3\p2e3.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
