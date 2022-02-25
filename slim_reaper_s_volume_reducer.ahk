#MaxThreadsPerHotkey, 2
CoordMode, ToolTip, Screen
Toggle = 0
x := ((A_ScreenWidth // 2)-65)
y := ((A_ScreenHeight // 2)+400)
^p:: 
    {
        ; suspend, toggle
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
        ; suspend, toggle
        Return
    }

~LButton::
    If (Toggle = 1)
    {
        GetKeyState(LButton, P)
        Send, {F7}
        KeyWait, LButton
        Send, {F7}
        Return
    }
Return

~CapsLock::
    {
        SetCapsLockState, off
        return
    }

+esc::exitApp