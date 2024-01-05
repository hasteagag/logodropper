#Include WebView2.ahk
; DllCall("AllocConsole") ;uncomment this line to see command line output (cout)
shown:=0
;we cannot easily do this on teh AHK side bc the funciton callback is passed to the JS side with no knowledge of the initial time
wrapRun(arg) {
    Run("c:\\users\\asmith\\desktop\\runjavascript.vbs c:\\users\\asmith\\desktop\\placeLogo.jsx " . arg . "")
    main.Show(Format('w{} h{}', 0, 0))
    shown:=0
    ; activate window
    WinActivate("ahk_class Photoshop ahk_exe Photoshop.exe")
}
main := Gui('+Resize')
main.OnEvent('Close', (*) => (wvc := wv := 0))
main.Show(Format('w{} h{}', A_ScreenWidth, A_ScreenHeight))
shown:=1

wvc := WebView2.create(main.Hwnd)
wv := wvc.CoreWebView2
wv.Navigate('c:/tmp/logos/index.html') ;about:blank

wv.AddHostObjectToScript('ahk', {str:'str from ahk',func:wrapRun})
; wv.OpenDevToolsWindow()
^+F2::
{
    main.Show(Format('w{} h{}', A_ScreenWidth, A_ScreenHeight))
    main.Maximize()
    ; "ahk_class AutoHotkeyGUI ahk_exe AutoHotkey64.exe"
    shown:=1
}
; class Print { 
;     static stdout:=FileOpen("CONOUT$", "w") 
;     static Call(str:="") {
;         this.stdout.Write(str)
;         this.stdout.Read(0) 
;     }
; }
