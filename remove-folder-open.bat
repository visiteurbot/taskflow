@echo off
rem TaskFlow: removes the "taskflow-open:" link type registered by setup-folder-open.bat
reg delete "HKCU\Software\Classes\taskflow-open" /f >nul 2>nul
echo Removed.
pause
