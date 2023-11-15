

*Space::
    If SpacePressed ; AutoRepeat defense
        Return
    SpacePressed:=true
    SetTimer ModActivate, % "-" 100
    Return
*Space Up::
    SpacePressed:=false
    SetTimer ModActivate, Off
    If ((A_PriorKey = "Space") OR !ModActive)
        Send {Blind}{Space}
    ModActive := false
    SetCapsLockState, Off
    Return
ModActivate:
    ModActive := true
    SetCapsLockState, On
    Return

#If (GetKeyState("Space", "P") && ModActive)
    Left::WinMinimize A
    Up::WinMaximize A
    SendInput, {LShift up}
    SC01E::send {Blind}1
    SC01F::send {Blind}2
    SC020::send {Blind}3
    SC021::send {Blind}4 


Esc::ExitApp