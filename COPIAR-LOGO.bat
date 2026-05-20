@echo off
echo Copiando logo 10 años...
copy "%AppData%\Claude\local-agent-mode-sessions\fde6d149-6d63-4128-a770-8730708bd679\26ad82a8-df13-4a6b-b01c-a89854c9edf6\local_e20ce56b-437f-41c4-ab89-61e564016c37\uploads\Grafica 10 años-84b53472.30 PM" "%~dp0logo-10-anios.webp"
if exist "%~dp0logo-10-anios.webp" (
    echo.
    echo ✓ Logo copiado correctamente como logo-10-anios.webp
    echo   Ya puedes cerrar esta ventana y abrir index.html
) else (
    echo.
    echo ✗ No se pudo copiar. Intenta con el archivo anterior:
    copy "%AppData%\Claude\local-agent-mode-sessions\fde6d149-6d63-4128-a770-8730708bd679\26ad82a8-df13-4a6b-b01c-a89854c9edf6\local_e20ce56b-437f-41c4-ab89-61e564016c37\uploads\Grafica 10 años.30 PM" "%~dp0logo-10-anios.webp"
    if exist "%~dp0logo-10-anios.webp" (
        echo ✓ Copiado desde archivo alternativo. OK.
    ) else (
        echo ✗ Archivo no encontrado. Sube el archivo nuevamente al chat.
    )
)
echo.
pause
