#NoTrayIcon
#SingleInstance force

StoredFocus := WinExist("A")

^`:: ; ctrl + `
DetectHiddenWindows, on
if WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") 
{
	if WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
	{
			WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
			; restore previously focused
			WinActivate ahk_id %StoredFocus%
	}
	else
	{
		StoredFocus := WinExist("A")
		; StoredControlFocus := 
	    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
	    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
	}
}
else 
{
	Run, %USERPROFILE%\scoop\apps\windows-terminal\current\WindowsTerminal.exe
    ; Run shell:AppsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App
}


DetectHiddenWindows, off
return
