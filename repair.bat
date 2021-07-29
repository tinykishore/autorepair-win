:: This batch file trees C: drive, run sfc and dism scan.

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

title Repair Tool

echo This program runs DISM and SFC only then reboots
pause

tree C://
cls

echo Now running: System File Checker tool
sfc /scannow
pause
cls

echo Now running: Deployment Image Servicing and Management
pause
dism /online /Cleanup-image /restorehealth
cls

echo Reboot PC?
pause
shutdown /r