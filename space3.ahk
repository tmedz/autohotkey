#MaxHotkeysPerInterval 200
ModActivateDelay := 100

*Space::
    If SpacePressed ; AutoRepeat defense
        Return
    SpacePressed:=true
    SetTimer ModActivate, % "-" ModActivateDelay
    Return
*Space Up::
    SpacePressed:=false
    SetTimer ModActivate, Off
    If ((A_PriorKey = "Space") OR !ModActive)
        Send {Blind}{Space}
    ModActive := false
    Return
ModActivate:
    ModActive := true
    Return

#If (GetKeyState("Space", "P") && ModActive)
    Left::WinMinimize A
    Up::WinMaximize A
    *vk45::SendRemap() ; e
    *vk44::SendRemap() ; d
    *vk53::SendRemap() ; s
    *vk46::SendRemap() ; f
#If

SendRemap() {
    Static SendRemapArr:={e: "{Up}", d: "{Down}", s: "{Left}", f: "{Right}"}
    Send % "{Blind}" SendRemapArr[GetKeyName(SubStr(A_ThisHotkey, 2))]
}
Esc::ExitApp