#MaxHotkeysPerInterval 200

; Always on Top
^SPACE:: Winset, Alwaysontop, , A ; ctrl + spac
Return

F12::
    Suspend, permit
    if (A_IsSuspended = "0")
    {
         TrayTip, Suspended, %A_ScriptName%, , 1
         SoundPlay *-1
    }
    Else
    {
         TrayTip, UnSuspended, %A_ScriptName%, , 1
         SoundPlay, %A_WinDir%\Media\ding.wav
    }
    Suspend, Toggle
    Return


^!d::Run "D:\Downloads" ; ctrl+shift+d
^!SC032::Run, "C:\Program Files\Calc\calc1.exe"

^SC02B::
 {
   count++
   settimer, actions, 300
 }
return
actions:
 {
   if (count = 1)
    {
      Reload
    }
    else if (count = 2)
    {
      send Mugen925
    }
   else if (count = 3)
    {
      send Rhtlng@34
    }
   else if (count = 4)
    {
      send @ng2ht&ou7ae
    }
   count := 0
 }
return

;SC002::1
;SC003::2
;SC004::3
;SC005::4
;SC006::5
SC007::6
SC008::7
SC009::8
SC00a::9
SC00b::0
;SC00c::-
SC00d::=

SC010::v
SC011::l
SC012::n
SC013::g
SC014::k
SC015::z
SC016::y
SC017::o
SC018::u
SC019::'
SC01A::[
SC01B::]

SC01E::s
SC01F::r
SC020::h
SC021::t
SC022::f
SC023::p
SC024::d
SC025::a
SC026::e
SC027::/
SC028::i

SC02A::x
SC02c::j
SC02d::b
SC02e::m
SC02f::q
+SC030::up
SC030::left
SC031::w
SC032::c
SC033::,
SC034::.
+SC035::down
SC035::right
SC11D::Lwin ;rctrl
;sc00E::send {Delete} ; set backspace to delete key
SC15B::shiftUp("LWin")
*$SC136::shiftUp("Shift")
*$SC15D::RAlt   
SC03A::capsOffBspc()

!.::spaceQt(".")      ;auto space after period
!/::spaceQt("?")      ;auto space after ?
!SC028::send I'

spaceQt(key) {
      send %key%
      send {Space} 
      capsOnDisplay(3)
      capsOffDisplay()  
}
return
;================Shift Modifier======================

capsOnDisplay(timeOn) {
    state := GetKeyState("Capslock", "T")  ; 1 if CapsLock is ON, 0 otherwise.
    if state = 1 
    {
        capsOffDisplay() 
    } 
    else 
    {   
        SetCapsLockState, On
        Screen_Y = % A_ScreenHeight-100
        Progress,y%Screen_Y% B W75 H17 ZH0 FS6 WS8000 CT800080, CAPS LOCK
        if (timeOn < 4) {
        Input, SingleKey, T%timeOn% L1 V,{CapsLock}{LShift}{RShift}{Enter}
        capsOffDisplay()
        } else {
        SetTimer, capsOffDisplay, %timeOn%
        }
    }
}
capsOn() {
        SetCapsLockState, On
        Screen_Y = % A_ScreenHeight-100
        Progress,y%Screen_Y% B W75 H17 ZH0 FS6 WS8000 CT800080, CAPS LOCK
}

capsOffDisplay() {
    SetCapsLockState, Off
    Progress, off
}
shiftUp(mykey) {
     state := GetKeyState("Capslock", "T")  ; 1 if CapsLock is ON, 0 otherwise.
    if state = 1 
    {
        capsOffDisplay() 
    } 
    else 
    {   
       Send {LShift down}
       KeyWait, %mykey%, T0.2
       if (ErrorLevel) {
            ; hold
       }
       else if (A_PriorKey = mykey) {
            Send {LShift up}
            capsOnDisplay(2)
       }
    }
   KeyWait, %mykey%
   Send {LShift up}
return
}

capsOffBspc() {
    state := GetKeyState("Capslock", "T")  ; 1 if CapsLock is ON, 0 otherwise.
    if state = 1 
    {
        capsOffDisplay() 
    } else {
        send {Backspace}
    }
return
}

altMod(mykey) {
   KeyWait, %mykey%, T0.2
   if (ErrorLevel) {
         ;long press
   }
   else if (A_PriorKey = mykey) {
         capsOnDisplay(2)
   }
   KeyWait, %mykey%
   return
}

;================Alt Modifier=====================

*$SC138::altMod("RAlt")
*$SC038::
If WinActive("Dota 2")
    Send {LAlt down}
else
    altMod("LAlt")
KeyWait, SC038
Send {LAlt up}
return

#If, (GetKeyState("LAlt", "P") and !WinActive("Dota 2")) 
      SC00d::highlight.case.upper() ; =
      SC00c::highlight.case.lower() ; -
      SC01B::highlight.case.sentence() ; ;
      SC01A::highlight.case.title() ; q
      sc01e::send {blind}^a
      sc010::send {blind}^v
      sc011::send {blind}^c
      sc02e::send {blind}^c
      sc02d::send {blind}^x
      sc02c::send {blind}^z
      sc012::up
      sc01f::left
      sc020::down
      sc021::right
      sc00E::send {blind}{Delete} ; set backspace to delete key
      SC015::+
      SC016::7
      SC017::8
      SC018::9
      SC019::"
      SC023::-
      SC024::4
      SC025::5
      SC026::6
      SC028::spaceQt("?")
      SC031::=
      SC032::1
      SC033::2
      SC034::3
      SC138::send 0
      SC15D::.
      SC11D::WinMaximize A
      SC002::F1
      SC003::F2
      SC004::F3
      SC005::F4
      SC006::F5
      SC007::F6
      SC008::F7
      SC009::F8
      SC00a::F9
      SC00b::F10
      SC03A::capsOn()
      SC030::up
      SC035::down
      return


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
return

#If GetKeyState("RAlt", "P")  ;Your Layer hotkeys go below 
    SC010::1
    SC011::2
    SC012::3
    SC013::4
    SC014::5
    SC015::6
    SC016::7
    SC017::8
    SC018::9
    SC019::0
    SC01E::!
    SC01F::@
    SC020::#
    SC021::$
    SC022::send `%
    SC023::^
    SC024::&
    SC025::*
    SC026::-
    SC027::`
    SC028::_
    SC02c::(
    SC02d::)
    SC02e::{
    SC02f::}
    SC030::up
    SC035::down
    SC031::[
    SC032::]
    SC033::;
    SC034:::
    SC00E::delete
    SC00d::Send {Volume_Up}
    SC00c::Send {Volume_Down}
    Esc::~
    SC002::F1
    SC003::F2
    SC004::F3
    SC005::F4
    SC006::F5
    SC007::F6
    SC008::F7
    SC009::F8
    SC00A::F9
    SC00B::F10
    SC01A::F11
    SC01B::F12
    SC02B::Send #{PrintScreen}
    SC03A::send ^{Backspace}
    SC15D::capsOnDisplay(60000) ;rshift
    return