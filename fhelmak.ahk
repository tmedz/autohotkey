; fhelmak Mod-DH wide mapping for ANSI boards
>^SC02B::Suspend 
^!SC033::Run, "C:\Program Files\Calc\calc1.exe"
;SC002::1
;SC003::2
;SC004::3
;SC005::4
;SC006::5
SC007::[
SC008::]
SC009::6
SC00a::7
SC00b::8
SC00c::9
SC00d::0

SC010::v
SC011::l
SC012::n
SC013::g
SC014::k
SC015::=
SC016::z
SC017::y
SC018::o
SC019::u
SC01A::'
SC01B::/

SC01E::s
SC01F::r
SC020::h
SC021::t
SC022::f
SC023::-
SC024::p
SC025::d
SC026::a
SC027::e
SC028::i

SC02c::x
SC02d::j
SC02e::b
SC02f::m
SC030::q
SC031::;
SC032::w
SC033::c
SC034::,
SC035::.


CapsLock::
   KeyWait, CapsLock                      ; wait for Capslock to be released
   KeyWait, CapsLock, D T0.1              ; and pressed again within 0.2 seconds
   if ErrorLevel
      send {Backspace}
   else if (A_PriorKey = "CapsLock")
      SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
   return


*CapsLock:: return                        ; This forces capslock into a modifying key.





;======================Capslock modifier================
#if, getkeystate("capslock", "p") ;your capslock hotkeys go below
sc026::         highlight.case.lower()
sc025::         highlight.case.upper()
sc027::         highlight.case.sentence()
sc028::         highlight.case.title()
sc01e::^a
sc010::^v
sc011::^c
sc02e::^c
sc012::up
sc01f::left
sc020::down
sc021::right
; set backspace to delete key
sc00E::delete
sc039::sc00E

#If

class Highlight {

   Copy() {
      AutoTrim Off
      c := ClipboardAll
      Clipboard := ""             ; Must start off blank for detection to work.
      Send, ^c
      ClipWait 0.5
      if ErrorLevel
         return
      t := Clipboard
      Clipboard := c
      VarSetCapacity(c, 0)
      return t
   }

   Paste(t) {
      c := ClipboardAll
      Clipboard := t
      Send, ^v
      Sleep 50                    ; Don't change clipboard while it is pasted! (Sleep > 0)
      Clipboard := c
      VarSetCapacity(c, 0)        ; Free memory
      AutoTrim On
   }

   class Case {

      Lower(data := "") {
         text := (data == "") ? Highlight.copy() : data
         StringLower, lower, text
         return (data == "") ? Highlight.paste(lower) : lower
      }

      Upper(data := "") {
         text := (data == "") ? Highlight.copy() : data
         StringUpper, upper, text
         return (data == "") ? Highlight.paste(upper) : upper
      }

      Title(data := "") {
         text := (data == "") ? Highlight.copy() : data
         StringUpper, title, text, T
         return (data == "") ? Highlight.paste(title) : title
      }

      Sentence(data := "") {
         text := (data == "") ? Highlight.copy() : data
         X := "I,LOL"
         S := ""
         T := RegExReplace(text, "[\.\!\?]\s+|\R+|\t+", "$0þ")
         Loop Parse, T, þ
         {
            StringLower L, A_LoopField
            I := Chr(Asc(A_LoopField))
            StringUpper I, I
            S .= I SubStr(L,2)
         }
         Loop Parse, X, `,
            S := RegExReplace(S, "i)\b" A_LoopField "\b", A_LoopField)
         return (data == "") ? Highlight.paste(S) : S
      }
   }
}


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






NumLock::
	KeyWait, NumLock
	If (A_PriorKey="NumLock")
		SetNumLockState, % GetKeyState("NumLock","T") ? "Off" : "On"
Return

#If, GetKeyState("NumLock", "P") ;Your NumLock hotkeys go below
SC010::!
SC011::@
SC012::#
SC013::$
SC014::send `%
SC015::+
SC016::^
SC017::&
SC018::*
SC019::-
SC01A::+
SC01B::`

SC01E::1
SC01F::2
SC020::3
SC021::4
SC022::5
SC023::_
SC024::6
SC025::7
SC026::8
SC027::9
SC028::0

SC02c::(
SC02d::)
SC02e::{
SC02f::}
SC030::=
SC031:::
SC032::[
SC033::]
SC034::;
SC035:::

; set Backspace to delete key

sc00E::delete