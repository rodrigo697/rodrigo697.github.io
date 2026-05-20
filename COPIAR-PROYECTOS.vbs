Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oShell = CreateObject("WScript.Shell")

sDesktop = oShell.SpecialFolders("Desktop")

' Buscar la carpeta en varias ubicaciones posibles
Dim sPosibles(4)
sPosibles(0) = sDesktop & "\Proyectos destacados 2CR"
sPosibles(1) = sDesktop & "\Sitio Web 2CR nuevo\Proyectos destacados 2CR"
sPosibles(2) = sDesktop & "\Sitio Web 2CR nuevo\Web 2CR\Proyectos destacados 2CR"
sPosibles(3) = oShell.SpecialFolders("MyDocuments") & "\Proyectos destacados 2CR"
sPosibles(4) = "C:\Users\Rodrigo\Desktop\Sitio Web 2CR nuevo\Proyectos destacados 2CR"

sOrigen = ""
Dim i
For i = 0 To 4
    If oFSO.FolderExists(sPosibles(i)) Then
        sOrigen = sPosibles(i)
        Exit For
    End If
Next

If sOrigen = "" Then
    MsgBox "No se encontro 'Proyectos destacados 2CR'." & Chr(13) & Chr(13) & _
           "Ubicaciones buscadas:" & Chr(13) & _
           sPosibles(0) & Chr(13) & _
           sPosibles(1) & Chr(13) & _
           sPosibles(2) & Chr(13) & Chr(13) & _
           "Por favor copia la carpeta manualmente a:" & Chr(13) & _
           sDesktop & "\Sitio Web 2CR nuevo\", 16, "No encontrado"
    WScript.Quit
End If

sDest = oFSO.GetParentFolderName(WScript.ScriptFullName) & "\proyectos\"
sLog = "Carpeta origen: " & sOrigen & Chr(13) & Chr(13)

If Not oFSO.FolderExists(sDest) Then oFSO.CreateFolder(sDest)

Set oCarpetaBase = oFSO.GetFolder(sOrigen)
Dim nProyecto
nProyecto = 1

For Each oSubCarpeta In oCarpetaBase.SubFolders
    sNombreProyecto = oSubCarpeta.Name
    sKey = "proyecto-" & nProyecto
    sDestProyecto = sDest & sKey & "\"

    If Not oFSO.FolderExists(sDestProyecto) Then oFSO.CreateFolder(sDestProyecto)

    Dim nFoto
    nFoto = 1
    For Each oArchivo In oSubCarpeta.Files
        sExt = LCase(Right(oArchivo.Name, 4))
        If sExt = ".jpg" Or sExt = ".png" Or sExt = "jpeg" Or sExt = "webp" Then
            sNuevoNombre = "foto-" & nFoto & sExt
            oFSO.CopyFile oArchivo.Path, sDestProyecto & sNuevoNombre, True
            nFoto = nFoto + 1
        End If
    Next

    ' Guardar nombre del proyecto en un archivo txt
    Set oTxt = oFSO.CreateTextFile(sDestProyecto & "nombre.txt", True)
    oTxt.Write sNombreProyecto
    oTxt.Close

    sLog = sLog & nProyecto & ". " & sNombreProyecto & " — " & (nFoto-1) & " foto(s)" & Chr(13)
    nProyecto = nProyecto + 1
Next

If nProyecto = 1 Then
    ' No hubo subcarpetas, buscar fotos directo en la carpeta raiz
    sLog = sLog & "AVISO: No hay subcarpetas. Copiando fotos directamente..." & Chr(13)
    Dim nFotoRaiz
    nFotoRaiz = 1
    For Each oArchivo In oCarpetaBase.Files
        sExt = LCase(Right(oArchivo.Name, 4))
        If sExt = ".jpg" Or sExt = ".png" Then
            oFSO.CopyFile oArchivo.Path, sDest & "foto-" & nFotoRaiz & sExt, True
            nFotoRaiz = nFotoRaiz + 1
        End If
    Next
    sLog = sLog & nFotoRaiz - 1 & " fotos copiadas a la raiz."
End If

MsgBox sLog & Chr(13) & "LISTO. Ahora puedes continuar.", 64, "Proyectos copiados"
