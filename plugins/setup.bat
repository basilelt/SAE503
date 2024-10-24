@echo off

REM Define the directories and files
set SERVER_DIR=test_server
set EULA_FILE=%SERVER_DIR%\eula.txt
set CONFIG_FILE=%SERVER_DIR%\plugins\Plan\config.yml
set BLUEMAP_CONFIG_FILE=%SERVER_DIR%\plugins\BlueMap\core.conf
set PROMETHEUS_YML=%SERVER_DIR%\plugins\UnifiedMetrics\driver\prometheus.yml

setlocal enabledelayedexpansion

REM Define the new port number
set NEW_PORT=9300

REM Path to the prometheus.yml file


REM Use PowerShell to update the port in prometheus.yml
powershell -Command "((Get-Content -path !PROMETHEUS_YML! -Raw) -replace 'port: \d+', 'port: !NEW_PORT!') | Set-Content -Path !PROMETHEUS_YML!"

echo Port updated to !NEW_PORT! in !PROMETHEUS_YML!
REM Get the current date and time
for /f "tokens=1-5 delims=/-. " %%d in ("%date% %time%") do (
    set curdate=%%d-%%e-%%f
    set curtime=%%g:%%h:%%i
)

REM Create or update eula.txt and set eula to true
echo #By changing the setting below to TRUE you are indicating your agreement to our EULA (https://aka.ms/MinecraftEULA). > %EULA_FILE%
echo # %curdate% %curtime% >> %EULA_FILE%
echo eula=true>> %EULA_FILE%
echo Created or updated eula.txt and set eula to true.

REM Ensure GeoLite2 EULA is accepted in config.yml
if exist %CONFIG_FILE% (
    powershell -Command "(Get-Content %CONFIG_FILE%) -replace 'Accept_GeoLite2_EULA: false', 'Accept_GeoLite2_EULA: true' | Set-Content %CONFIG_FILE%"
    echo Updated config.yml to accept GeoLite2 EULA.
) else (
    echo config.yml not found. Please ensure the file exists and try again.
)

REM Ensure required file download is accepted for BlueMap
if exist %BLUEMAP_CONFIG_FILE% (
    powershell -Command "(Get-Content %BLUEMAP_CONFIG_FILE%) -replace 'accept-download: false', 'accept-download: true' | Set-Content %BLUEMAP_CONFIG_FILE%"
    echo Updated core.conf to accept required file download for BlueMap.
) else (
    echo core.conf not found. Please ensure the file exists and try again.
)