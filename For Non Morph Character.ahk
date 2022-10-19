#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Press the hotkey when you already in water, if you pressed it on land the game will register it as a single dodge

#InstallKeybdHook
#SingleInstance, force
#IfWinActive, ahk_exe GenshinImpact.exe ;this doesnt work for some reason

^F11:: ;Edit this with your desired hotkey(s)
Dodge:=!Dodge
SetTimer, Stopper
if Dodge
    Send {RButton Down}
else
    Send {RButton Up}
Return

^F12:: ;Edit this one too if you wish
Moonwalk:=!Moonwalk
Loop
{
  Send w
If (GetKeyState("End")){  ;Edit this one too
  Break
  }
Sleep 1100
SetTimer, Stopper  ;This also doesnt work, better end the loop first before alt tab-ing or quit genshin
}
Return

Stopper:
 WinGet, app, ProcessName, A
 if app = GenshinImpact.exe
 {
  Suspend, off
 }
 else
 {
  Suspend, on
 }
return
