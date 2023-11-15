; Transcrollacy !

;[VxE]'s scrollable transparency, holding down the scrolllock key enables it.

~*WheelUp::

~*WheelDown::

MouseGetPos, , , aWin

If GetKeyState("ScrollLock", "p")

{

	Direction := (0 < InStr( A_ThisHotkey, "lup")) * 2 - 1 ; 1 for up (more trans), -1 for down (less trans)

	WinGet, Transparent, Transparent, ahk_id %aWin%

	Transparent := Direction * 8 + ( !Transparent ? 256 : Transparent )

	If ( Transparent > 255 )

		Transparent = off

	Else If ( Transparent < 64 )

		Transparent = 64

	WinSet, Transparent, %Transparent%, ahk_id %awin%

}

return