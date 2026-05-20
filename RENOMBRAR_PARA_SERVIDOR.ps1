# ═══════════════════════════════════════════════════════════════════
#  2CR — Script de renombrado para deployment en servidor Linux
#  Ejecutar UNA SOLA VEZ antes de subir los archivos al servidor.
#  Doble-click → "Ejecutar con PowerShell"
#  Si pide permisos: clic derecho → "Ejecutar con PowerShell como admin"
# ═══════════════════════════════════════════════════════════════════

$base = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $base

$errores = 0
$ok = 0

function Renombrar($desde, $hasta) {
    $origen  = Join-Path $base $desde
    $destino = Join-Path $base $hasta
    if (Test-Path $origen) {
        if (Test-Path $destino) {
            Write-Host "  [SKIP] Ya existe: $hasta" -ForegroundColor Yellow
        } else {
            Rename-Item -Path $origen -NewName (Split-Path -Leaf $hasta) -ErrorAction SilentlyContinue
            if (Test-Path $destino) {
                Write-Host "  [OK]   $desde → $hasta" -ForegroundColor Green
                $script:ok++
            } else {
                Write-Host "  [ERR]  No se pudo renombrar: $desde" -ForegroundColor Red
                $script:errores++
            }
        }
    } else {
        Write-Host "  [N/A]  No encontrado: $desde" -ForegroundColor DarkGray
    }
}

Write-Host ""
Write-Host "══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  2CR — Renombrado para servidor Linux" -ForegroundColor Cyan
Write-Host "══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# ── 1. CARPETAS DE PROYECTOS ────────────────────────────────────────
Write-Host "[ Carpetas de proyectos ]" -ForegroundColor White

Renombrar "00 Centro Control Carretera, DET – Codelco"                           "00-c3-codelco-det"
Renombrar "02 Casa Ica"                                                           "02-casa-ica"
Renombrar "03 Instalación de Fibra Óptica, Fundición Talleres, Rancagua"         "03-fibra-optica-fundicion"
Renombrar "04 Cierre Expedición Cartocor"                                         "04-expedicion-cartocor"
Renombrar "05 Casa Fachada Ica"                                                   "05-casa-fachada-ica"
Renombrar "06 2CR Perú SAC"                                                       "06-2cr-peru-sac"
Renombrar "07 Fachada English Now - Ica"                                          "07-english-now-ica"
Renombrar "08 Reparación y Pintura Fachada Maestranza FTL"                       "08-reparacion-fachada-ftl"
Renombrar "09 Mantención de Calderas, Fundición Talleres, Rancagua"              "09-mantencion-calderas"
Renombrar "10 Salas Multimedia Talleres, Rancagua"                                "10-salas-multimedia"

# ── 2. ARCHIVOS DENTRO DE CARPETAS (con espacios) ──────────────────
Write-Host ""
Write-Host "[ Archivos en subcarpetas ]" -ForegroundColor White

# 02-casa-ica
Renombrar "02-casa-ica\Render 01.jpg"  "02-casa-ica\render-01.jpg"
Renombrar "02-casa-ica\Render 02.jpg"  "02-casa-ica\render-02.jpg"
Renombrar "02-casa-ica\Render 03.jpg"  "02-casa-ica\render-03.jpg"
Renombrar "02-casa-ica\Render 04.jpg"  "02-casa-ica\render-04.jpg"
Renombrar "02-casa-ica\Render 05.jpg"  "02-casa-ica\render-05.jpg"
Renombrar "02-casa-ica\Plantas.pdf"    "02-casa-ica\plantas.pdf"

# 05-casa-fachada-ica
Renombrar "05-casa-fachada-ica\Foto Fachada 01.jpg"  "05-casa-fachada-ica\foto-fachada-01.jpg"
Renombrar "05-casa-fachada-ica\Foto Fachada 02.jpg"  "05-casa-fachada-ica\foto-fachada-02.jpg"

# 07-english-now-ica
Renombrar "07-english-now-ica\ENGLISH NOW 01.png"  "07-english-now-ica\english-now-01.png"

# 09-mantencion-calderas
Renombrar "09-mantencion-calderas\Calderas Talleres 01.jpg"  "09-mantencion-calderas\calderas-01.jpg"
Renombrar "09-mantencion-calderas\Anual 12.jpg"              "09-mantencion-calderas\anual-12.jpg"
Renombrar "09-mantencion-calderas\Anual 13.jpg"              "09-mantencion-calderas\anual-13.jpg"

# ── 3. CARPETA CLIENTES ─────────────────────────────────────────────
Write-Host ""
Write-Host "[ Clientes — logos ]" -ForegroundColor White

Renombrar "Clientes"                              "clientes"
Renombrar "clientes\Hotel Belle Sand.png"         "clientes\hotel-belle-sand.png"
Renombrar "clientes\EL TENIENTE.png"              "clientes\el-teniente.png"
Renombrar "clientes\ME Elecmetal Rgua 032.png"    "clientes\me-elecmetal.png"
Renombrar "clientes\Cartocor.png"                 "clientes\cartocor.png"
Renombrar "clientes\FUSAT.png"                    "clientes\fusat.png"

# ── 4. ARCHIVOS RAÍZ ────────────────────────────────────────────────
Write-Host ""
Write-Host "[ Archivos raíz ]" -ForegroundColor White

Renombrar "Logo HERO_2CR.png"                             "logo-hero-2cr.png"
Renombrar "Logo 2CR_PRO.png"                              "logo-2cr-pro.png"
Renombrar "Logo 2CR_PRO blanco full.png"                  "logo-2cr-blanco.png"
Renombrar "Logo 2CR_PRO naranja full.png"                 "logo-2cr-naranja.png"
Renombrar "Logo 2CR_PRO gris full.png"                    "logo-2cr-gris.png"
Renombrar "Logo 2CR_PRO negro full.png"                   "logo-2cr-negro.png"
Renombrar "Logo 10 años 2CR_naranja y blanco.png"         "logo-10anos-naranja-blanco.png"
Renombrar "Logo 10 años 2CR_naranja.png"                  "logo-10anos-naranja.png"
Renombrar "Logo 10 años 2CR_v0.png"                       "logo-10anos-v0.png"
Renombrar "Logo naranja-blanco_2CR.LETAL.png"             "logo-naranja-blanco-2cr.png"
Renombrar "Icono SIG_2CR.png"                             "icono-sig-2cr.png"
Renombrar "Icono SIG_2CR-naranja.png"                     "icono-sig-2cr-naranja.png"
Renombrar "Reunion planificacion 2CR.png"                 "reunion-planificacion-2cr.png"
Renombrar "reunion 2CR.jpg"                               "reunion-2cr.jpg"
Renombrar "Web Gral 2CR.jpg"                              "web-gral-2cr.jpg"
Renombrar "Imagen de WhatsApp 2025-07-05 a las 13.12.31_3bab0813.jpg"  "whatsapp-c3-exterior.jpg"
Renombrar "Imagen de WhatsApp 2025-07-05 a las 13.12.30_ad851d2d.jpg"  "whatsapp-c3-operador.jpg"
Renombrar "Dialogo 04_feb.2024.jpg"                       "dialogo-feb2024.jpg"

# ── RESUMEN ─────────────────────────────────────────────────────────
Write-Host ""
Write-Host "══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Completado: $ok renombrados  |  $errores errores" -ForegroundColor Cyan
Write-Host "══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
if ($errores -eq 0) {
    Write-Host "  Listo para subir al servidor." -ForegroundColor Green
} else {
    Write-Host "  Revisa los errores antes de subir." -ForegroundColor Red
}
Write-Host ""
Read-Host "  Presiona ENTER para cerrar"
