Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oShell = CreateObject("WScript.Shell")

sDest = oFSO.GetParentFolderName(WScript.ScriptFullName) & "\logo-10-anios.webp"
sArchivoEncontrado = ""

' Buscar en AppData\Local y AppData\Roaming
sLocalAppData = oShell.ExpandEnvironmentStrings("%LOCALAPPDATA%")
sRoaming = oShell.ExpandEnvironmentStrings("%APPDATA%")

Sub BuscarEnCarpeta(sRuta)
    If sArchivoEncontrado <> "" Then Exit Sub
    On Error Resume Next
    Set oCarpeta = oFSO.GetFolder(sRuta)
    If Err.Number <> 0 Then Exit Sub
    On Error GoTo 0
    For Each oArchivo In oCarpeta.Files
        If Left(LCase(oArchivo.Name), 7) = "grafica" Then
            sArchivoEncontrado = oArchivo.Path
            Exit For
        End If
    Next
    If sArchivoEncontrado <> "" Then Exit Sub
    For Each oSub In oCarpeta.SubFolders
        BuscarEnCarpeta oSub.Path
        If sArchivoEncontrado <> "" Then Exit For
    Next
End Sub

' Probar AppData\Local\Claude primero
sLocalClaude = sLocalAppData & "\Claude"
sRoamingClaude = sRoaming & "\Claude"

If oFSO.FolderExists(sLocalClaude) Then
    BuscarEnCarpeta sLocalClaude
End If

If sArchivoEncontrado = "" And oFSO.FolderExists(sRoamingClaude) Then
    BuscarEnCarpeta sRoamingClaude
End If

' Si aun no encontrado, buscar en todo AppData
If sArchivoEncontrado = "" Then
    BuscarEnCarpeta sLocalAppData
End If

If sArchivoEncontrado <> "" Then
    oFSO.CopyFile sArchivoEncontrado, sDest, True
    MsgBox "LISTO. Logo copiado desde:" & Chr(13) & sArchivoEncontrado, 64, "OK"
Else
    MsgBox "Archivo no encontrado. Intenta subir el archivo al chat nuevamente.", 16, "No encontrado"
End If
