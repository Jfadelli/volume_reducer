; gerneral optimizations
; ---------------------------
#MaxThreadsPerHotkey, 2    ; |
CoordMode, ToolTip, Screen ; |
; ---------------------------

; global variables
; ----------------------------------  |
Toggle = 0                          ; |
Toggle2 = 0                         ; |
x := ((A_ScreenWidth // 2)-65)      ; |
y := ((A_ScreenHeight // 2)+400)    ; |
; ----------------------------------  |

; Hotkeys
; ctrl + p | Toggle in-game volume reducer
^p:: 
    {
        Toggle := !Toggle
        if (Toggle = 1)
        {
            ToolTip, Volume Reducer On, x,y
        }
        Else
        {
            ToolTip, Volume Reducer Off, x,y
        }
        Sleep, 1000
        ToolTip
        Return
    }

; Left Click | If volume reducer is active, Left Mouse enables in game volume reducer
~LButton::
    IfWinActive, ahk_exe TslGame.exe
        If (Toggle = 1)
        {
            GetKeyState(LButton, P)
            Send, {F7}
            KeyWait, LButton
            Send, {F7}
            Return
        }
Return

; Caps Lock | Equip smoke grenade 
; This allows caps to reset to the off state
~CapsLock::
    {
        IfWinActive, ahk_exe TslGame.exe
        SetCapsLockState, off
        return
    }



; Ctrl + o | enable disble escape key
^o:: 
    {
        Toggle2 := !Toggle2
        if (Toggle2 = 1)
        {
            ToolTip, Escape Menu On, x,y
        }
        Else
        {
            ToolTip, Escape Menu Off, x,y
        }
        Sleep, 1000
        ToolTip
        Return
    }

; if ctrl o is active, escape works as normal
$Esc::
    IfWinActive, ahk_exe TslGame.exe
        If (Toggle2 = 1)
        {
            send {Esc}
            Return
        }
    Return

; alt esc
!Esc::
    {
        send {Esc}
        return
    }
