; Settings
global name := "Fullscreen Projector (Scene) - Eye Zoom"
global px_min := -1920 ; projector min, position X
global py_min := 0 ; position Y
global pw_min := 96 ; window Widht
global ph_min := 54 ; window Height
global px_max := -1280 ; projector max, position X
global py_max := 0 ; position Y
global pw_max := 1280 ; window Widht
global ph_max := 720 ; window Height

; Main
#If WinActive("Minecraft") || WinActive(name)
{
    J::
        WinGetPos, X, Y, Width, Height, %name%
        If (Width = pw_min and Height = ph_min) {
            WinMove, % name,, px_max, py_max, pw_max, ph_max
            WinSet, AlwaysOnTop, On, %name%
        }
        Else
            WinMove, % name,, px_min, py_min, pw_min, ph_min
            WinSet, AlwaysOnTop, Off, %name%
    Return
}
