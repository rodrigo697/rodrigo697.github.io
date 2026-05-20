Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oShell = CreateObject("WScript.Shell")
sDest = oFSO.GetParentFolderName(WScript.ScriptFullName) & "\"

' Buscar en toda la carpeta Claude las fotos subidas recientemente
sBase = oShell.ExpandEnvironmentStrings("%APPDATA%") & "\Claude"
sBase2 = oShell.ExpandEnvironmentStrings("%LOCALAPPDATA%") & "\Claude"

Dim aArchivos(2)
aArchivos(0) = "linea-tec.jpg"
aArchivos(1) = "arquitectura.jpg"
aArchivos(2) = "bim.jpg"

' Mostrar instrucción
MsgBox "Por favor:" & Chr(13) & Chr(13) & _
       "Guarda las 3 fotos en la carpeta Web 2CR con estos nombres:" & Chr(13) & Chr(13) & _
       "1. Foto del ejecutivo con iconos tecnologicos: 'linea-tec.jpg'" & Chr(13) & _
       "2. Foto del arquitecto dibujando planos: 'arquitectura.jpg'" & Chr(13) & _
       "3. Foto del modelo BIM 3D azul: 'bim.jpg'" & Chr(13) & Chr(13) & _
       "Carpeta: " & sDest, 64, "Instrucciones fotos servicios"
