@echo off
title MiniBatch
SETLOCAL EnableDelayedExpansion
cd %~dp0
echo Bienvenido devuelta a MiniBatch Alpha v0.1.9!
echo Esta version arregla todos los bugs de la version anterior, v0.1.3, para darte la mejor experiencia posible!
echo Espada: %swordtype%
echo Pico: %picktype%
echo Hacha: %axetype%
echo Vida: %health%
timeout /t 2 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
goto main

:main
color 07
cls
echo 1. Ir a minar
echo 2. Ir a pelear
echo 3. Ir a talar
choice /c 123 /m "Que quieres hacer?"
if %errorlevel% equ 1 (
    goto mine
)
if %errorlevel% equ 2 (
    goto fight
)
if %errorlevel% equ 3 (
    goto chop
)

:mine
if %mine% equ 1 (
    set /a minelootiron=%random% %%26
)
if %mine% equ 2 (
    set /a minelootdiamond=%random% %%51
)
if %mine% equ 3 (
    set /a minelootdiamond=%random% %%101
)
cls
echo Minando.
timeout /t 1 /nobreak >nul
cls
echo Minando..
timeout /t 1 /nobreak >nul
cls
echo Minando...
timeout /t 1 /nobreak >nul
cls
if %mine% equ 1 (
    echo Has minado %minelootiron% Menas de hierro con tu %picktype%
)
if %mine% equ 2 (
    echo Has minado %minelootdiamond% Menas de diamante con tu %picktype%
)
if %mine% equ 3 (
    echo Has minado %minelootdiamond% Menas de diamante con tu %picktype%
)
timeout /t 2 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
set /a currentallminelootiron=%allminelootiron%+%minelootiron%
set /a allminelootiron=%currentallminelootiron%
set /a currentallminelootdiamond=%allminelootdiamond%+%minelootdiamond%
set /a allminelootdiamond=%currentallminelootdiamond%
set /a currentallminelootdiamond=%allminelootdiamond%+%minelootdiamond%
set /a allminelootdiamond=%currentallminelootdiamond%
goto save

:fight
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
cls
echo Peleando.
timeout /t 1 /nobreak >nul
cls
echo Peleando..
timeout /t 1 /nobreak >nul
cls
echo Peleando...
timeout /t 1 /nobreak >nul
cls
echo Peleaste contra algunos monstruos con tu %swordtype% y obtuvistes:
echo %fightlootskeleton% huesos de un esqueleto
echo %fightlootzombie% carne podrida de un zombi
echo %fightlootspider% hilo de un aracnido
timeout /t 1 /nobreak >nul
echo Y tu vida a bajado %damage%
set /a currenthealth=%health%-%damage%
echo Tu vida esta a %currenthealth%
set /a health=%currenthealth%
timeout /t 1 /nobreak >nul
if %health% lss 1 (
    cls
    timeout /t 1 /nobreak >nul
    echo ::    ::   ::::::::   ::::::::       ::      ::   ::      ::   ::::::   ::::::   ::::::     ::::::
    echo ::    ::   ::    ::   ::             ::::  ::::   ::      ::   ::       ::  ::     ::     ::      ::
    echo ::::::::   ::::::::   ::::::::       ::  ::  ::   ::      ::   ::::::   ::::::     ::     ::      ::
    echo ::    ::   ::    ::         ::       ::      ::   ::      ::   ::       ::  ::     ::     ::      ::
    echo ::    ::   ::    ::   ::::::::       ::      ::     ::::::     ::::::   ::    ::   ::       ::::::
    timeout /t 3 /nobreak >nul
    echo En esta version Alpha, nada pasara si mueres y tu vida volvera a ser 20
    set /a health=20
)
if !health! lss 10 (
    if !health! gtr 0 (
        choice /m "Curarte con una manzana?"
        if !errorlevel! equ 1 (
            set /a "currentallchoplootapple=!allchoplootapple!-1" && (
                if defined currentallchoplootapple (
                    if !currentallchoplootapple! lss 0 (
                        set tempvar=1
                        echo No tienes suficientes manzanas mara curarte
                        set /a "currentallchoplootapple=!allchoplootapple!+1" >nul
                        timeout /t 1 /nobreak >nul
                        echo Pulsa cualquier tecla para continuar
                        pause >nul
                    ) else (
                        set /a "allchoplootapple=!currentallchoplootapple!" >nul
                        set /a "currenthealth=!health!+4"
                        set /a "health=!currenthealth!"
                        echo Tu vida esta a !health!
                    )
                    cd "%~dp0"
                    cd "userinv"
                    (
                        echo allminelootiron=!allminelootiron!
                        echo allminelootdiamond=!allminelootdiamond!
                        echo allfightlootzombie=!allfightlootzombie!
                        echo allfightlootskeleton=!allfightlootskeleton!
                        echo allfightlootspider=!allfightlootspider!
                        echo allchoplootwood=!allchoplootwood!
                        echo allchoplootapple=!allchoplootapple!
                        echo health=!health!
                    ) > file.txt
                    for /f "usebackqdelims=" %%A in ("file.txt") do (
                        set "%%A"
                    )
                    cd ""..""
                )
            )
        )
    )
)
if not !tempvar! equ 1 (
    set tempvar=
    timeout /t 2 /nobreak >nul
    echo Pulsa cualquier tecla para continuar
    pause >nul
)
set /a currentallfightlootskeleton=%allfightlootskeleton%+%fightlootskeleton%
set /a currentallfightlootzombie=%allfightlootzombie%+%fightlootzombie%
set /a currentallfightlootspider=%allfightlootspider%+%fightlootspider%
set /a allfightlootskeleton=%currentallfightlootskeleton%
set /a allfightlootzombie=%currentallfightlootzombie%
set /a allfightlootspider=%currentallfightlootspider%
goto save

:chop
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
cls
echo Talando.
timeout /t 1 /nobreak >nul
cls
echo Talando..
timeout /t 1 /nobreak >nul
cls
echo Talando...
timeout /t 1 /nobreak >nul
cls
echo Has talado %choplootwood% Tablas de madera y %choplootapple% Manzanas con tu %axetype%.
timeout /t 2 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
set /a currentallchoplootwood=%allchoplootwood%+%choplootwood%
set /a currentallchoplootapple=%allchoplootapple%+%choplootapple%
set /a allchoplootwood=%currentallchoplootwood%
set /a allchoplootapple=%currentallchoplootapple%
goto save

:save
cd userinv
(
    echo allminelootiron=%allminelootiron%
    echo allminelootdiamond=%allminelootdiamond%
    echo allfightlootzombie=%allfightlootzombie%
    echo allfightlootskeleton=%allfightlootskeleton%
    echo allfightlootspider=%allfightlootspider%
    echo allchoplootwood=%allchoplootwood%
    echo allchoplootapple=%allchoplootapple%
    echo health=%health%
) > file.txt
for /f "delims=" %%A in (file.txt) do set "%%A"
cd ..
goto main
