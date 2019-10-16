@echo off
:splash
cls
echo Welcome to Bub Pets Version 1.5!
echo (:) -Hi
echo Please press enter to begin a new save
echo Please type F and then press enter for a save file
echo Press E for the experimental save a new file feature.
set /p holder=

if %holder% == F goto loadsave
if %holder% == E goto save

:chonamu
cls
echo Please type in a nick name for your pet to call you.
set /p uname=
goto chonamp

:chonamp
cls
echo Please pick a name for your Bub.
set /p pname=
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
echo (:) -Hello %uname%. What do you want to do?
echo (1) Feed
echo (2) Play
echo (3) Story
set /p mmcho=

if %mmcho% == 1 goto feed
if %mmcho% == 2 goto play
if %mmcho% == 3 goto read

:read
set /a num=%random% %% 1
if %num% equ 0 (goto sto1) else (goto sto2)

:sto1
exit

:sto2
exit

:feed
cls
echo (:) nom nom nom
set /p holder=
goto mm

:play
exit

:loadsave
set "uname="
for /F "skip=1 delims=" %%i in (savefile.txt) do if not defined uname set "uname=%%i"
set "pname="
for /F "skip=2 delims=" %%i in (savefile.txt) do if not defined pname set "pname=%%i"
goto namconf

:save
setlocal enabledelayedexpansion
set count=0
for /f %%i in (savefile.txt) do (
   call set /a count=%%count%%+1
   if !count!==1 (set line=%%i testusername) else (set line=%%i)
   echo !line!>>savefile.txt
  )
  setlocal enabledelayedexpansion
set count=0
for /f %%i in (savefile.txt) do (
   call set /a count=%%count%%+1
   if !count!==2 (set line=%%i testpetname) else (set line=%%i)
   echo !line!>>savefile.txt
  )
  goto splash
