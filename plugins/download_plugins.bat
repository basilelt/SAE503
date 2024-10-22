@echo off

REM Define the directories where mods will be downloaded
set PLUGINS_DIR=test_server\plugins
set SERVER_DIR=test_server

REM Create the directories if they don't exist
if not exist "%PLUGINS_DIR%" mkdir "%PLUGINS_DIR%"
if not exist "%SERVER_DIR%" mkdir "%SERVER_DIR%"

REM Enable delayed expansion to use variables inside the loop
setlocal enabledelayedexpansion

REM Read the list of mod URLs from the plugins_list.txt file
for /f "usebackq delims=" %%i in ("plugins_list.txt") do (
    set "url=%%i"
    REM Check if the URL is for the paper jar
    echo %%i | findstr /r /c:"paper-.*\.jar" >nul
    if !errorlevel! equ 0 (
        REM Download the paper jar to the server directory
        powershell -Command "Invoke-WebRequest -Uri !url! -OutFile %SERVER_DIR%\%%~nxi"
    ) else (
        REM Download other mods to the plugins directory
        powershell -Command "Invoke-WebRequest -Uri !url! -OutFile %PLUGINS_DIR%\%%~nxi"
    )
)

endlocal

echo Plugins have been downloaded to %PLUGINS_DIR% and Paper to %SERVER_DIR%