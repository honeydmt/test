:: install chocolatey
@powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

:: All chocolatey packages gonna be here (wip)
choco install curl -Y

:: Create folder for scripts
mkdir scripts 
cd scripts 

:: Donwload Scripts from github
curl -O blob:https://github.com/552ef5a1-3d70-42af-82df-9f554b3a17d5
curl -O blob:https://github.com/fc586bca-a989-45c9-8c3c-54f071923c57

:: Execute the script
"C:\Users\Daniel Honey\scripts\All-in-One.bat"