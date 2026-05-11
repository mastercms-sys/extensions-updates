@echo off
echo Updating MasterCMS...

:: Step 1: Github se direct naya MasterCMS_Setup.exe download kar raha hai
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mastercms-sys/extensions-updates/main/MasterCMS_Setup.exe' -OutFile 'C:\MasterCMS\MasterCMS_Update.exe'"

:: Step 2: Setup ko Silent mode mein chala raha hai (Screen par kuch show nahi hoga)
start /wait "" "C:\MasterCMS\MasterCMS_Update.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART

:: Step 3: Update mukammal hone k baad kachra (Setup exe file) delete kar raha hai
del /q "C:\MasterCMS\MasterCMS_Update.exe"

exit