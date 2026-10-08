' TaskFlow helper: runs open-path.ps1 without showing a console window.
Dim sh, fso, dir, arg
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
dir = fso.GetParentFolderName(WScript.ScriptFullName)
If WScript.Arguments.Count = 0 Then WScript.Quit
arg = WScript.Arguments(0)
sh.Run "powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & dir & "\open-path.ps1"" """ & arg & """", 0, False
