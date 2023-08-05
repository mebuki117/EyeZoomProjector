global name := "Fullscreen Projector (Scene) - Eye Zoom"

#If WinActive("Minecraft") || WinActive("Fullscreen Projector (Scene) - Eye Zoom") ; must change projector name
{
    Shift & J::
        WinGetPos, X, Y, Width, Height, %name%
        If (Width = 192 and Height = 108) {
            WinMove, %name%,, -1920, 0, 1920, 1080
            WinSet, AlwaysOnTop, On, %name%
        }
        Else
            WinMove, %name%,, 0, 0, 192, 108
            WinSet, AlwaysOnTop, Off, %name%
    Return
}
