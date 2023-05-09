:: Set Test Mode

bcdedit -set loadoptions DISABLE_INTEGRITY_CHECKS Press ENTER
bcdedit -set TESTSIGNING ON

:: Create a Task 
schtasks /create /tn "Setup-Script" /tr "C:\test\test.bat" /sc onlogon

:: Restart

shutdown /r /t 0
