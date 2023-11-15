~CapsLock::
Input, var, L1 V ; waits for you to type 1 visible character; I don't know if BackSpace or Delete or NumLock being pressed would trigger this, probably not, so it may not be perfect
SetCapsLockState, Off



; SetCapsLockState, Off
; or   ; use either of these for restoring CapsLock to off state if you wanted it turned on with ~ modifier
; Send {CapsLock}
return