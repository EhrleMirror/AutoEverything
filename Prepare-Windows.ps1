#disable LUA
Set-Itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -value '0'

#
#----Powerplan, if Laptop----
#

#Copy Power Plan to %temp% 
Copy-Item -Path ".\data\optimal.pow" -Destination %temp%\optimal.pow

#Import Power Plan from %temp%
powercfg -import %temp%\optimal.pow 9a20c019-ced8-4383-9912-e20211e86c59

#Set newly importet Plan as active
powercfg -setactive 9a20c019-ced8-4383-9912-e20211e86c59

#delete File from %temp%
$currentplan = powercfg /GetActiveScheme
if($currentplan -like "*9a20c019-ced8-4383-9912-e20211e86c59*") {
    Remove-Item -Path "%temp%\optimal.pow"}
    else {Write-Host -ForegroundColor DarkRed  ERROR: Power Plan could not be applied}

#Edit Manufacturer Information
cmd.exe /c reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v "Manufacturer" /t REG_SZ /d "Ingenieurbuero Kottmann" /f
cmd.exe /c reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v "SupportHours" /t REG_SZ /d "Mo-Do 09:00-18:00Uhr" /f
cmd.exe /c reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v "SupportPhone" /t REG_SZ /d "0711 - 79 43 120" /f
cmd.exe /c reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v "SupportURL" /t REG_SZ /d "http://www.ib-kottmann.de/" /f



#Programme installieren

#check if winget is installed 



#winget install -e --id Lenovo.SystemUpdate
winget install -e --id 7zip.7zip
winget install -e --id Adobe.Acrobat.Reader.64-bit
winget install -e --id AdoptOpenJDK.OpenJDK.11
winget install -e --id AdoptOpenJDK.OpenJDK.16
winget install -e --id Mozilla.Firefox
winget install -e --id Google.Chrome
winget install -e --id IrfanSkiljan.IrfanView
winget install -e --id Notepad++.Notepad++
winget install -e --id VideoLAN.VLC



#Clear "Recent Files"
cmd.exe /c del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
cmd.exe /c del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
cmd.exe /c del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

#Windows Updates


#$manufacturer = Get-WmiObject win32_baseboard | Format-List Manufacturer

#TODO
#Popups with checkmarks to select Programs to be installed
