@echo off
:splash
cls
echo Welcome to Bub Pets Version 1.1!
echo (:) -Hi
echo Please press enter to begin a new save
echo Please type F and then press enter for a save file
set /p holder=

if %holder% == F goto loadsave

:chonamu
cls
echo Please type in a nick name for your pet to call you.
set /p uname=
goto chonamp

:chonamp
cls
echo Please pick a name for your Bub.
set /p pname
goto namconf

:namconf
cls
echo (:) -Hey %uname%! You have named me %pname%. Is this correct?
echo Chose either (Y/N)
set /p yn=

if %yn% == y goto mm
if %yn% == n goto chonamu
if not %yn% == y goto namconf
if not %yn% == n goto namconf

:mm
cls
echo WORK IN PROGRESS! PRESS ENTER!
set /p holder=
exit

:loadsave
set "uname="
for /F "skip=1 delims=" %%i in (savefile.txt) do if not defined uname set "uname=%%i"
set "pname="
for /F "skip=2 delims=" %%i in (savefile.txt) do if not defined pname set "pname=%%i"
goto namconf
