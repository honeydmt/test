@echo off

echo Moving for rigth folder
echo .

:: Moving for Default folder
cd "C:\Users\Daniel Honey\Downloads\scripts"

echo Creating drivers folder
echo .

:: Folder to drivers
mkdir drivers
cd drivers

echo Download all stuff
echo .

:: Donwload drivers and 7zip
curl -O https://raw.githubusercontent.com/honeydmt/test/master/drivers/PHDGD_Skylake_2.9.7z
curl -O https://raw.githubusercontent.com/honeydmt/test/master/drivers/7347_Chipset_Driver_WFF6P_WN_9.4.0.1027_A00.EXE
curl -O https://raw.githubusercontent.com/honeydmt/test/master/drivers/Chipset_Driver_8HX85_WN32_8.1.10605.221_A01.EXE
curl -O https://www.7-zip.org/a/7zr.exe

echo Run chipset drivers
echo .

:: Run chipset drivers first 
"C:\Users\Daniel Honey\Downloads\scripts\drivers\7347_Chipset_Driver_WFF6P_WN_9.4.0.1027_A00.EXE"
"C:\Users\Daniel Honey\Downloads\scripts\drivers\Chipset_Driver_8HX85_WN32_8.1.10605.221_A01.EXE"

echo Extract PHDGD driver
echo .

:: Extract the driver
7zr x "PHDGD_Skylake_2.9.7z"

echo Now run the driver
echo .

:: Run Setup.exe
cd "C:\Users\Daniel Honey\Downloads\scripts\drivers\PHDGD Skylake 2.9"
"C:\Users\Daniel Honey\Downloads\scripts\drivers\PHDGD Skylake 2.9\Setup.exe"

echo Now self-destruct
echo .

:: Delete Folders 
cd ../..
rmdir /s /q "C:\Users\Daniel Honey\Downloads\scripts\drivers"

echo Delete Task
echo .

:: Delete Task from Task Scheduler
schtasks /delete /tn "post-restart"

echo Install ReviOS post-install
echo .

:: Download with curl
mkdir post-install
cd post-install
curl -O https://raw.githubusercontent.com/abbodi1406/KMS_VL_ALL_AIO/master/KMS_VL_ALL_AIO.cmd
curl -O https://us6-dl.techpowerup.com/files/XdJd_TAsQm61wzILr9Xkng/1683876667/Visual-C-Runtimes-All-in-One-Feb-2023.zip
curl -O https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe

:: for install i gonna do it for myself 

echo Disable safe mode
echo .

:: Enable Integrity Checks
bcdedit -set loadoptions ENABLE_INTEGRITY_CHECKS
bcdedit -set TESTSIGNING OFF

echo Now restart the computer
echo .
pause

:: Restart
shutdown /r /t 0