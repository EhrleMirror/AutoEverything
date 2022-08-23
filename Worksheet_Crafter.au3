#RequireAdmin
;Worksheet Crafter Silent Install (German, Single User Login)
Run('"Worksheet_Crafter_Setup_Full.exe" /VERYSILENT  /SUPPRESSMSGBOXES /LANG=de /LOGINMETHOD=single')
Sleep(20000)
;Run for the First time & Focus Window
Local $iPID = Run("C:\Program Files (x86)\Worksheet Crafter\WorksheetCrafter.exe")
WinWait("Worksheet Crafter")
WinActivate("Worksheet Crafter")
MouseMove(1600, 400)
;Enter E-Mail
Send("user@mail.com")
Send ("{tab}")
;Enter License
Send("1111-2222-3333-4444")
;Confirm
Send ("{tab}")
Send ("{enter}")
;Wait .5 seconds and close PopUp
Sleep(500)
ProcessClose($iPID)
;Wait 1 Second and then run the Installation for AddOns
Sleep(1000)
Run('"SchoolCraft_Premium_Content_Setup.exe.exe" /VERYSILENT  /SUPPRESSMSGBOXES /LANG=de /LOGINMETHOD=single')
Sleep(9000)
Exit