@echo off
color 1f
cd %~dp0
cd stats
>nul find "sword1" sword.txt && (
  set fight=1 >nul
  set swordtype=Espada de madera
) || (
  >nul find "sword2" sword.txt && (
  set fight=2 >nul
  set swordtype=Espada de hierro
) || (
    >nul find "sword3" sword.txt && (
  set fight=3 >nul
  set swordtype=Espada de diamante
)
)
)
>nul find "pick1" pick.txt && (
  set mine=1 >nul
  set picktype=Pico de madera
) || (
  >nul find "pick2" pick.txt && (
  set mine=2 >nul
  set picktype=Pico de hierro
) || (
    >nul find "pick3" pick.txt && (
  set mine=3 >nul
  set picktype=Pico de diamante
)
)
)
>nul find "axe1" axe.txt && (
  set chop=1 >nul
  set axetype=Hacha de madera
) || (
  >nul find "axe2" axe.txt && (
  set chop=2 >nul
  set axetype=Hacha de hierro
) || (
    >nul find "axe3" axe.txt && (
  set chop=3 >nul
  set axetype=Hacha de diamante
)
)
)
>nul find "yes" house.txt && (
  set house=1 >nul
) || (
    set house=0 >nul
)
if %house% equ 1 (
  set safe=1 >nul 
)
>nul find "yes" firstrun.txt && (
  set firstrun=1 >nul
)
>nul find "no" firstrun.txt && (
  set firstrun=0 >nul
)
cd ..
cd userinv
for /f "delims=" %%A in (file.txt) do set "%%A"
if %mine% equ 1 (
    set /a mineloot=%random% %%26
)
if %mine% equ 2 (
    set /a mineloot=%random% %%51
)
if %mine% equ 3 (
    set /a mineloot=%random% %%101
)
if %fight% equ 1 (
    set /a fightlootzombie=%random% %%9
    set /a fightlootskeleton=%random% %%4
    set /a fightlootspider=%random% %%7
    set /a damage=%random% %%7
)
if %fight% equ 2 (
    set /a fightlootzombie=%random% %%14
    set /a fightlootskeleton=%random% %%7
    set /a fightlootspider=%random% %%11
    set /a damage=%random% %%5
)
if %fight% equ 3 (
    set /a fightlootzombie=%random% %%27
    set /a fightlootskeleton=%random% %%15
    set /a fightlootspider=%random% %%26
    set /a damage=%random% %%3
)
if %chop% equ 1 (
    set /a choplootwood=%random% %%16
    set /a choplootapple=%random% %%3
)
if %chop% equ 2 (
    set /a choplootwood=%random% %%25
    set /a choplootapple=%random% %%5
)
if %chop% equ 3 (
    set /a choplootwood=%random% %%33
    set /a choplootapple=%random% %%9
)
cd ..
if %firstrun% equ 1 (
  start tutorial.bat
)
if %firstrun% equ 0 (
  cd stats
  echo no > firstrun.txt
  cd ..
  start minibatch.bat
)
exit
