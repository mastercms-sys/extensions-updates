@echo off
echo Updating MasterCMS...

:: Step 1: Github se direct MasterCMS.zip file download kar ke Windows ke khufiya Temp folder mein rakh raha hai
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mastercms-sys/extensions-updates/main/MasterCMS.zip' -OutFile '%TEMP%\MasterCMS_update.zip' -UseBasicParsing"

:: Step 2: Purana kachra agar hai tou delete karna aur Nayi zip file ko Temp folder mein extract (unzip) karna
if exist "%TEMP%\MasterCMS_Extract" rd /s /q "%TEMP%\MasterCMS_Extract"
powershell -Command "Expand-Archive -Path '%TEMP%\MasterCMS_update.zip' -DestinationPath '%TEMP%\MasterCMS_Extract' -Force"

:: Step 3: Nayi files ko C:\MasterCMS mein automatically Copy aur Overwrite (Replace) kar raha hai
if exist "%TEMP%\MasterCMS_Extract\MasterCMS" (
    xcopy "%TEMP%\MasterCMS_Extract\MasterCMS\*" "C:\MasterCMS\" /E /Y /C /Q /H
) else (
    xcopy "%TEMP%\MasterCMS_Extract\*" "C:\MasterCMS\" /E /Y /C /Q /H
)

:: Step 4: Faltu (Kachra) Temp files aur folder ko delete kar raha hai (Safai)
del /q "%TEMP%\MasterCMS_update.zip"
rd /s /q "%TEMP%\MasterCMS_Extract"

exit