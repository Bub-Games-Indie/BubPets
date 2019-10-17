@echo off
:splash
cls
echo Welcome to Bub Pets Version NT1.8!
echo ☺-Hi
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
echo ☺-Hey %uname%! You have named me %pname%. Is this correct?
echo Chose either (Y/N)
set /p yn=

if %yn% == y goto mm
if %yn% == n goto chonamu
if not %yn% == y goto namconf
if not %yn% == n goto namconf

:mm
cls
echo ☺-Hello %uname%. What do you want to do?
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
echo ☺-Once upon a time...
echo There were two little turtles. One of the turtles said to the other,
echo "Why do we have shells?"
echo To that, the other turtle told the first turtle
echo "To help us keep safe from the seagulls and other mean animals."
echo "Why do the other animals want to eat us?" The first turtle asked.
echo "Because," The second turtle said. "They will die if they don't eat."
echo "Well, to that I have to say one thing." Said the first turtle.
echo "What's that?" Said the second turtle.
echo "WEED EATER"
echo The end
set /p holder=
goto mm

:sto2
echo ☺-Once upon a time...
echo There was a dude who ate farts for breakfast. He died one day for fart related internal bleeding
echo The docter said to the guy's mother one thing.
echo "WEED EATER"
echo The end
set /p holder=
goto mm

:feed
cls
echo ☺><((((`>
echo nom nom nom
set /p holder=
goto mm

:play
cls
echo ☺-Welcome to the gambling game!
echo Press enter to begin.
set /p holder=
goto play1

:play1
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
