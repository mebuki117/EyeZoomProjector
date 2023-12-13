#SingleInstance force
#NoEnv

; Settings
global hotkey := "*J"
global projectorName := "Windowed Projector (Scene) - Zoom"
global x := 0 ; projector position
global y := 0
global width := 640 ; projector width

; Function
Zoom() {
    WinGetPos, dx, dy, dw, dh, %projectorName%
    height := A_ScreenHeight / (A_ScreenWidth / width) ; calc height from screen height, width
    if (height <> dh) {
        WinGet, state, MinMax, %projectorName%
        if (state == -1)
            WinRestore, %projectorName%
        WinSet, Style, -0xC40000, %projectorName%
        WinSet, AlwaysOnTop, On, %projectorName%
        DllCall("SetWindowPos", "Ptr", WinExist(projectorName), "UInt", 0, "Int", x, "Int", y, "Int", width, "Int", height, "UInt", 0x0400)
    }
    else
        DllCall("SetWindowPos", "Ptr", WinExist(projectorName), "UInt", 0, "Int", 0, "Int", -A_ScreenHeight, "Int", 1, "Int", 1, "UInt", 0x0400)
}

; Hotkey
#If (WinActive("Minecraft") && (WinActive("ahk_exe javaw.exe")) || WinActive(projectorName))
    Hotkey, %hotkey%, Zoom