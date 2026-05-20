# Script para copiar el logo animado 10 años
$carpeta = "$env:APPDATA\Claude\local-agent-mode-sessions\fde6d149-6d63-4128-a770-8730708bd679\26ad82a8-df13-4a6b-b01c-a89854c9edf6\local_e20ce56b-437f-41c4-ab89-61e564016c37\uploads"
$destino = "$PSScriptRoot\logo-10-anios.webp"

# Buscar el archivo (cualquier variante del nombre)
$archivo = Get-ChildItem -Path $carpeta -Filter "Grafica*" | Select-Object -First 1

if ($archivo) {
    Copy-Item -Path $archivo.FullName -Destination $destino -Force
    Write-Host ""
    Write-Host "LISTO - Logo copiado correctamente!" -ForegroundColor Green
    Write-Host "Ahora abre index.html para ver el logo animado." -ForegroundColor Cyan
} else {
    Write-Host "Archivo no encontrado en la carpeta uploads." -ForegroundColor Red
}
Start-Sleep -Seconds 3
