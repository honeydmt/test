:: Create Folder
cd scripts
mkdir drivers
cd drivers

:: Donwload driver and 7zip
curl -O https://raw.githubusercontent.com/honeydmt/personal_scripts/master/drivers/PHDGD%20Skylake%202.9.7z
curl -O https://raw.githubusercontent.com/honeydmt/personal_scripts/master/drivers/7347_Chipset_Driver_WFF6P_WN_9.4.0.1027_A00.EXE
curl -O https://raw.githubusercontent.com/honeydmt/personal_scripts/master/drivers/Chipset_Driver_8HX85_WN32_8.1.10605.221_A01.EXE
curl -O https://www.7-zip.org/a/7zr.exe

:: Run chipset drivers first 
"C:\Users\Daniel Honey\scripts\drivers\7347_Chipset_Driver_WFF6P_WN_9.4.0.1027_A00.EXE"
"C:\Users\Daniel Honey\scripts\drivers\Chipset_Driver_8HX85_WN32_8.1.10605.221_A01.EXE"

:: Extract the driver
7zr x "PHDGD+Skylake+2.9.7z"

:: Run Setup.exe
cd "C:\Users\Daniel Honey\scripts\drivers\PHDGD Skylake 2.9"
"C:\Users\Daniel Honey\scripts\drivers\PHDGD Skylake 2.9\Setup.exe"

:: Delete Folders 
cd ../..
rmdir /s /q "C:\Users\Daniel Honey\scripts\drivers"

:: Enable Integrity Checks
bcdedit -set loadoptions ENABLE_INTEGRITY_CHECKS ‘Press ENTER’
bcdedit -set TESTSIGNING OFF

:: Restart
shutdown /r /t 0