@echo off

echo Installing chocolatey, grab a coffee
echo .

:: chocolatey
@powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

echo Installing chocolatey packages (personal)
echo .

:: chocolatey packages
choco install curl -Y

echo Download Progams 
echo .

:: MemoryCleaner and ThrottleStop
curl -O https://raw.githubusercontent.com/honeydmt/test/master/progams/ThrottleStop.exe
curl -O https://raw.githubusercontent.com/honeydmt/test/master/progams/MemoryCleaner.exe

echo Move the applications 
echo .

:: Move stuff to Windows folder
move ThrottleStop.exe "C:\Windows"
move MemoryCleaner.exe "C:\Windows"

echo Create Task for progams
echo .

:: Tasks
schtasks /create /tn "MemoryCleaner" /tr "C:\Windows\MemoryCleaner.exe" /sc onlogon
schtasks /create /tn "ThrottleStop" /tr "C:\Windows\ThrottleStop.exe" /sc onlogon

echo Ceating folder for scripts
echo .

:: script folder
mkdir scripts 
cd scripts 

echo Downloading the script for github
echo .

:: Script link
:: (wip for now)

echo Now setting gonna activate windows safe mode for drivers install
echo .

:: Set Test Mode
bcdedit -set loadoptions DISABLE_INTEGRITY_CHECKS Press ENTER
bcdedit -set TESTSIGNING ON

echo creating a task for post-restart script
echo .

:: Create a Task 
schtasks /create /tn "post-restart" /tr "C:\Users\Daniel Honey\Downloads\scripts\post-restart.bat" /sc onlogon

echo Now lets restart the computer
echo .
pause

:: Restart
shutdown /r /t 0