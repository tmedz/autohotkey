CapsLock::              ;;Toggle CapsLock on double press, do nothing for a short or long press
{
    KeyWait, CapsLock, T0.2
    if (ErrorLevel) {               ;received a long press -
	send 1
    }
    else {
        KeyWait, CapsLock, D T0.1
        If (ErrorLEvel) {               ;received a short press -
	send 2
        }
        else {                          ;received a double press -
            SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On" ; Toggle the state of CapsLock LED
        }
    }
}