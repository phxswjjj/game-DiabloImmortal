AppTitle := "Diablo Immortal"
UniqueID := WinExist(AppTitle)
if not UniqueID {
    OutputDebug, "[%AppTitle%] not found"
    Return
}

FormatTime, CurrentDateTime,, HH:mm:ss


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

    If (Key2ElcapedSec >= 10) {
        Key2ElcapedSec := 0
        Sleep, 64
        Send 2
        Sleep, 64
        Send 2
    }
    else If (Key3ElcapedSec >= 4) {
        Key3ElcapedSec := 0
        Sleep, 64
        Send 3
        Sleep, 64
        Send 3
    }
    else If (Key4ElcapedSec >= 16) {
        Key4ElcapedSec := 0
        Sleep, 150
        Send 4
        Sleep, 150
        Send 4
    }
    If (Key1ElcapedSec <= 5)
    {
        SetTimer, MaMa, OFF
    }

    Return

Counter:
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
    If ErrorLevel {
        ; OutputDebug, 100`% is not black
        Return
    }
    
    PixelSearch, Px, Py, 110, 130, 115, 135, 0x000000, 3, Fast
    If !ErrorLevel {
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
    SetTimer, MaMa, 100

    Return

MaMa:
    IfWinNotActive, ahk_id %UniqueID%
    {
        Return
    }

    If (GetKeyState("``", "P"))
    {
        Send, {Space}
    }
    If (Key1ElcapedSec >= 5)
    {
        SetTimer, MaMa, OFF
    }

    Return

^!z::  ; Control+Alt+Z hotkey.
    OutputDebug, "Z pressed"
    OutputDebug, [%CurrentDateTime%] Stopped
    ExitApp