@echo off
rem TaskFlow launcher: opens index.html in Google Chrome app window (falls back to Edge, then default browser)
setlocal
set "HTML=%~dp0index.html"
set "URL=file:///%HTML:\=/%"

if not exist "%HTML%" (
  echo index.html was not found next to this file.
  pause
  exit /b 1
)

set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"
set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

if exist "%CHROME%" (
  start "" "%CHROME%" --app="%URL%"
  exit /b 0
)
if exist "%EDGE%" (
  start "" "%EDGE%" --app="%URL%"
  exit /b 0
)
start "" "%HTML%"
exit /b 0
