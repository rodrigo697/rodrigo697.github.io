@echo off
echo Copiando ZIP del logo animado...

set "SRC=C:\Users\Rodrigo\AppData\Roaming\Claude\local-agent-mode-sessions\fde6d149-6d63-4128-a770-8730708bd679\26ad82a8-df13-4a6b-b01c-a89854c9edf6\local_e20ce56b-437f-41c4-ab89-61e564016c37\uploads\files.zip"
set "DST=%~dp0files.zip"

copy "%SRC%" "%DST%"

if not exist "%DST%" (
    echo ERROR: No se pudo copiar el archivo.
    echo Intenta copiar manualmente files.zip a esta carpeta.
    pause
    exit
)

echo Extrayendo archivos...
powershell -command "Expand-Archive -Path '%DST%' -DestinationPath '%~dp0' -Force"

echo.
echo === Archivos extraidos ===
dir /b "%~dp0*.gif" "%~dp0*.webp" "%~dp0*.png" 2>nul
echo.
echo LISTO - Abre index.html y presiona F5
pause
