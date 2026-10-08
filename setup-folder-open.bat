@echo off
rem TaskFlow: one-time setup so that folder/file links can open in Explorer.
rem Registers the "taskflow-open:" link type for the current user only (no admin rights needed).
rem Do not move this folder after running the setup. If you move it, run this setup again.
setlocal
set "DIR=%~dp0"
reg add "HKCU\Software\Classes\taskflow-open" /ve /d "URL:TaskFlow Open" /f >nul
reg add "HKCU\Software\Classes\taskflow-open" /v "URL Protocol" /d "" /f >nul
reg add "HKCU\Software\Classes\taskflow-open\shell\open\command" /ve /d "wscript.exe \"%DIR%open-path.vbs\" \"%%1\"" /f >nul
if errorlevel 1 (
  echo Setup failed. Registry changes may be blocked on this PC.
  pause
  exit /b 1
)
echo Setup finished.
echo The first time you click a folder link, Chrome asks for permission. Tick "always allow" and press Open.
pause
