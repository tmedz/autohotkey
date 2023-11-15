*LShift::
    If LShiftPressed ; AutoRepeat defense
        Return
    LShiftPressed:=true
    SetTimer ModActivate2, % "-" 100
    SetTimer ModActivate3, % "-" 400
    Return
*LShift Up::
    LShiftPressed:=false
    SetTimer ModActivate2, Off
    SetTimer ModActivate3, Off
    sendInput, {blind}{LShift up}
    If ((A_PriorKey = "LShift") && !ModActive3 OR !ModActive2)
    send j
    ModActive2 := false
    ModActive3 := false
    Return
ModActivate2:
    ModActive2 := true
    sendInput, {blind}{LShift down}
    Return
ModActivate3:
    ModActive3 := true
    Return