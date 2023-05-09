:: install chocolatey
@powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

:: All chocolatey packages gonna be here (wip)

choco install curl -Y

:: Donwload Scripts from github
(link here)

:: Execute the scripts 
(shortcut here)

:: pause the cmd 

pause