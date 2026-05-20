@echo off
copy "%AppData%\Claude\local-agent-mode-sessions\fde6d149-6d63-4128-a770-8730708bd679\26ad82a8-df13-4a6b-b01c-a89854c9edf6\local_e20ce56b-437f-41c4-ab89-61e564016c37\uploads\Resumen Ejecutivo SOMNI_Peru.pdf" "%~dp0Resumen-Ejecutivo-SOMNI.pdf" 2>nul
copy "%AppData%\Claude\local-agent-mode-sessions\fde6d149-6d63-4128-a770-8730708bd679\26ad82a8-df13-4a6b-b01c-a89854c9edf6\local_e20ce56b-437f-41c4-ab89-61e564016c37\uploads\Resumen Ejecutivo SOMNI_Per??.pdf" "%~dp0Resumen-Ejecutivo-SOMNI.pdf" 2>nul
if exist "%~dp0Resumen-Ejecutivo-SOMNI.pdf" (echo PDF copiado OK) else (echo No encontrado, renombrar manualmente)
pause
