@echo off
echo Updating MasterCMS Extensions from GitHub...

:: Step 1: Github se direct extensions.zip download kar raha hai
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mastercms-sys/extensions-updates/main/extensions.zip' -OutFile 'C:\MasterCMS\update_temp.zip'"

:: Step 2: Download ki hui Zip file ko direct C:\MasterCMS\MasterCMSBundle mein extract (unzip) aur Overwrite kar raha hai
powershell -Command "Expand-Archive -Path 'C:\MasterCMS\update_temp.zip' -DestinationPath 'C:\MasterCMS\MasterCMSBundle' -Force"

:: Step 3: Faltu (Kachra) Zip file ko delete kar raha hai
del /q "C:\MasterCMS\update_temp.zip"

exit