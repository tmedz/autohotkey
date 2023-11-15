#MaxHotkeysPerInterval 200
ModActivateDelay := 100

*Space::
    If SpacePressed ; AutoRepeat defense
        Return
    SpacePressed:=true
    SetTimer ModActivate, % "-" ModActivateDelay
    SetCapsLockState, On
    Return
*Space Up::
    SpacePressed:=false
    SetTimer ModActivate, Off
    If ((A_PriorKey = "Space") OR !ModActive)
        Send {Blind}{Space}
    ModActive := false
    SetCapsLockState, Off
    Return
