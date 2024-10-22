@echo off

REM Define the directory where the server jar is located
set SERVER_DIR=test_server

REM Define the name of the server jar file
set SERVER_JAR=paper-*.jar

REM Change to the server directory
cd %SERVER_DIR%

REM Find the server jar file
for %%f in (%SERVER_JAR%) do set SERVER_JAR=%%f

REM Start the server
java -Xms1G -Xmx2G -jar %SERVER_JAR% nogui

REM Return to the original directory
cd ..