#disable LUA
Set-Itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -value '0'

#
#----Powerplan, if Laptop----
#

#Copy Power Plan to %temp% 
Copy-Item -Path ".\data\optimal.pow" -Destination "%temp%\optimal.pow"

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


#Programme installieren
winget install -e --id Lenovo.SystemUpdate
winget install -e --id 7zip.7zip
winget install -e --id Adobe.Acrobat.Reader.64-bit
winget install -e --id AdoptOpenJDK.OpenJDK.11
winget install -e --id AdoptOpenJDK.OpenJDK.16
winget install -e --id Mozilla.Firefox
winget install -e --id Google.Chrome
winget install -e --id IrfanSkiljan.IrfanView
winget install -e --id Notepad++.Notepad++
winget install -e --id VideoLAN.VLC



$manufacturer = Get-WmiObject win32_baseboard | Format-List Manufacturer