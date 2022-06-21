@echo off
cd %~dp0
title MiniBatch Alpha Tutorial
echo Bienvenido a MiniBatch Alpha!
echo Esta es una version de prueba, y algunas cosas vistas aqui podrian no estar en el juego final
echo Y todo podria cambiar
timeout /t 2 /nobreak >nul
echo Pulsa cualquier tecla para iniciar MiniBatch
pause >nul
cls
echo Te encuentras perdido en una isla, que recuerdas?
timeout /t 2 /nobreak >nul
echo.
echo Nada...
timeout /t 2 /nobreak >nul
echo.
echo De verdad no recuerdas nada? Recuerdas como llegastes aqui?
timeout /t 3 /nobreak >nul
echo.
echo No
echo Ni siquiera recuerdo quien eres
timeout /t 3 /nobreak >nul
echo Oye?
echo estas ahi?
timeout /t 2 /nobreak >nul
echo ...
timeout /t 1 /nobreak >nul
echo Uh, ojala esto hubiera sido mi imaginacion...
timeout /t 1 /nobreak >nul
echo Que es lo que tengo? debo sobrevivir
echo Tengo
timeout /t 2 /nobreak >nul
cls
echo Te encuentras perdido en una isla, que recuerdas?
echo.
echo Nada...
echo.
echo De verdad no recuerdas nada? Recuerdas como llegastes aqui?
echo.
echo No
echo Ni siquiera recuerdo quien eres
echo Oye?
echo Estas ahi?
echo ...
echo Uh, ojala todo esto hubiera sido mi imaginacion...
echo Que es lo que tengo? debo sobrevivir
echo Tengo...
timeout /t 1 /nobreak >nul
cls
echo ?
echo.
echo Nada...
echo.
echo De verdad no recuerdas nada? Recuerdas como llegastes aqui?
echo.
echo No
echo Ni siquiera recuerdo quien eres
echo Oye?
echo Estas ahi?
echo ...
echo Uh, ojala hubiera sido mi imaginacion...
echo Que es lo que tengo? debo sobrevivir
echo Tengo un %picktype%, una %swordtype% y un %axetype%
timeout /t 1 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
cls
goto tutorial

:tutorial
set /a tempvar=0
cls
echo En la version alpha, no puedes pelear, talar y minar por ti mismo, pero el programa lo hace, aleatoriamente, dependiendo
echo en tu herramienta, cuando todo lo que se deba hacer se haya hecho, podras talar madera, pelear contra enemigos
echo y minar en una cueva, por ahora, tendras un "lobby" donde elegiras que hacer.
timeout /t 5 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
goto aftertutorialtext

:aftertutorialtext
cls
if %tempvar% equ 3 (
    cls
    echo Tutorial terminado!
    timeout /t 1 /nobreak >nul
    echo.
    echo Seras enviado en un ratito al MiniBatch normal
    echo Disfruta!
    timeout /t 2 /nobreak >nul
    echo.
    echo Comenzando MiniBatch...
    set tempvar=
    if not defined tempvar (
        cd stats
        echo no > firstrun.txt
        cd ..
        start autoexec.bat
        exit
    ) else (
        set /a tempvar=
        goto aftertutorialtext
    )
)
echo 1. Ir a minar
echo 2. Ir a pelear
echo 3. Ir a talar
choice /c 123 /m "What do you want to do?"
if %errorlevel% equ 1 (
    goto minetutorial
)
if %errorlevel% equ 2 (
    goto fighttutorial
)
if %errorlevel% equ 3 (
    goto choptutorial
)

:minetutorial
cls
echo El botin va a cambiar dependiendo en tu herramienta (y tu suerte)
echo Pulsa cualquier tecla para continuar
pause >nul
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
echo Has minado %mineloot% Menas de hierro con tu %picktype%.
timeout /t 2 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
set /a tempvar=1
goto aftertutorialtext

:fighttutorial
cls
echo El botin de los monstruos va a cambiar dependiendo en tu herramienta (Y tu suerte)
echo Pulsa cualquier tecla para continuar
pause >nul
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
echo Tu vida a bajado %damage%
set /a currenthealth=%health%-%damage%
echo Tu vida esta a %currenthealth%
set /a health=%currenthealth%
if %health% lss 1 (
    timeout /t 1 /nobreak >nul
    cls
    echo ::    ::   ::::::::   ::::::::       ::      ::   ::      ::   ::::::   ::::::   ::::::     ::::::
    echo ::    ::   ::    ::   ::             ::::  ::::   ::      ::   ::       ::  ::     ::     ::      ::
    echo ::::::::   ::::::::   ::::::::       ::  ::  ::   ::      ::   ::::::   ::::::     ::     ::      ::
    echo ::    ::   ::    ::         ::       ::      ::   ::      ::   ::       ::  ::     ::     ::      ::
    echo ::    ::   ::    ::   ::::::::       ::      ::     ::::::     ::::::   ::    ::   ::       ::::::
    timeout /t 3 /nobreak >nul
    echo En esta version Alpha, nada pasara si mueres y tu vida volvera a ser 20
    set /a health=20
)
timeout /t 2 /nobreak >nul
echo Pulsa cualquier tecla para continuar
pause >nul
set /a tempvar=%tempvar%+1
goto aftertutorialtext

:choptutorial
cls
echo El botin de la madera dependera en tu herramienta (y tu suerte)
echo Pulsa cualquier tecla para continuar
pause >nul
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
set /a tempvar=%tempvar%+1
goto aftertutorialtext
