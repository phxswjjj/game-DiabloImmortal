AppTitle := "Diablo Immortal"
UniqueID := WinExist(AppTitle)
if not UniqueID {
    OutputDebug, "[%AppTitle%] not found"
    Return
}

FormatTime, CurrentDateTime, , HH:mm:ss

Key1ElcapedSec := 99
Key2ElcapedSec := 99
Key3ElcapedSec := 99
Key4ElcapedSec := 99
SetTimer, Counter, 1000

SetTimer, LifeMonitor, 1000

Return

~Space::
    IfWinNotActive, ahk_id %UniqueID%
    {
        Return
    }

    if (Key2ElcapedSec >= 13) {
        Key2ElcapedSec := 0
        ; Sleep, 64
        ; Send 2
        ; Sleep, 64
        ; Send 2
    }else If (Key3ElcapedSec >= 7) {
        Key3ElcapedSec := 0
        Sleep, 64
        Send 3
        Sleep, 64
        Send 3
    }else If (Key4ElcapedSec >= 13) {
        Key4ElcapedSec := 0
        Sleep, 150
        Send 4
        Sleep, 150
        Send 4
    }

Return

Counter:
    IfWinNotExist, ahk_id %UniqueID%
    {
        OutputDebug, [%CurrentDateTime%] Stopped
        ExitApp
    }
    Key1ElcapedSec := Min(Key1ElcapedSec + 1, 100)
    Key2ElcapedSec := Min(Key2ElcapedSec + 1, 100)
    Key3ElcapedSec := Min(Key3ElcapedSec + 1, 100)
    Key4ElcapedSec := Min(Key4ElcapedSec + 1, 100)
Return

LifeMonitor:
    IfWinNotActive, ahk_id %UniqueID%
    {
        Return
    }

    PixelSearch, Px, Py, 160, 130, 165, 135, 0x000000, 3, Fast
    if ErrorLevel {
        ; OutputDebug, 100`% is not black
        Return
    }

    PixelSearch, Px, Py, 110, 130, 115, 135, 0x000000, 3, Fast
    if !ErrorLevel {
        ; OutputDebug, Life Less Than 50`%
        Send Q
        Sleep, 8000
    }

Return

~`::
    IfWinNotActive, ahk_id %UniqueID%
    {
        Return
    }

Return

~1::
    IfWinNotActive, ahk_id %UniqueID%
    {
        Return
    }

    Key1ElcapedSec := 0

Return

^!z:: ; Control+Alt+Z hotkey.
    OutputDebug, "Z pressed"
    OutputDebug, [%CurrentDateTime%] Stopped
ExitApp