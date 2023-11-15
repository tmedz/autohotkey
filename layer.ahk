Alt::
	KeyWait, Alt
	If (A_PriorKey="Alt")
		SetAltState, % GetKeyState("Alt","T") ? "Off" : "On"
Return
#If, GetKeyState("Alt", "P") ;Your RAlt hotkeys go below

n::Up
r::Left
h::Down
t::Right
v::Send % (A_PriorHotKey = A_ThisHotkey && A_TimeSincePriorHotkey < 200) ? "{Blind}^{Home}" : "{Blind}{PGUP}"
x::Send % (A_PriorHotKey = A_ThisHotkey && A_TimeSincePriorHotkey < 200) ? "{Blind}^{End}" : "{Blind}{PGDN}"