:: This batch file trees C: drive, run sfc and dism scan.
:: DO NOT EDIT
@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

title Repair Tool

echo This program runs tree in C drive followed by SFC and DISM scan and reboots automatically
echo+
echo Close all the program, please wait and do not run anything during the process
echo This could take a while
echo DO NOT POWER OFF THE COMPUTER DURING THE PROCESS
echo+
pause
cls

tree C://
cls

echo Now running: System File Checker tool
sfc /scannow
cls

echo Now running: Deployment Image Servicing and Management
dism /online /Cleanup-image /restorehealth
cls

echo Now running: Scheduled Disk Checkup
echo Y|chkdsk C: /r

shutdown /r