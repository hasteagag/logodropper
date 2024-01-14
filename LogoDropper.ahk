#Include WebView2.ahk
shown:=0
pathFromCopy:=0
MouseGetPos(&x, &y)
curMousePos:={}
curMousePos.x:=x
curMousePos.y:=y
wrapRun(filePath,application:="Photoshop") {
    switch (application)
    {
        case "Photoshop":
            Run("c:\\users\\username\\desktop\\runjavascript.vbs c:\\users\\asmith\\desktop\\placeLogo.jsx " filePath "")
            WinActivate("ahk_class Photoshop ahk_exe Photoshop.exe")
        case "Illustrator":
            filePath:=StrReplace(filePath,"file:///","")
            filePath:=StrReplace(filePath,"/","\\") ;not sure if we need either of these but its working
            Run("c:\\users\\username\\desktop\\runjavascriptAI.vbs c:\\users\\asmith\\desktop\\Ai_placeLogo.jsx " filePath "")
            WinActivate("ahk_class illustrator ahk_exe Illustrator.exe")
        case "Copy":
            global pathFromCopy:=filePath
            tooltip("Path was added to #v")
            sleep 1200
            tooltip("")
    }
    main.hide()
    global shown:=0
    MouseMove(curMousePos.x,curMousePos.y)     ;move back to former mouse position
}
main := Gui('+Resize')
main.OnEvent('Close', (*) => (wvc:=wv:=0))
main.Show("x1920 w1920 h1080")
shown:=1

wvc := WebView2.create(main.Hwnd)
wv := wvc.CoreWebView2
wv.Navigate('c:/tmp/logos/index.html')
wv.AddHostObjectToScript('ahk', {str:'str from ahk',func:wrapRun})
WinActivate("ahk_class AutoHotkeyGUI ahk_exe AutoHotkey64.exe")
CoordMode("Mouse","Screen")
Click(1992, 25)
^+F2::
{
    main.Show("x1920 w1920 h1080")
    global shown:=1
    WinActivate("ahk_class AutoHotkeyGUI ahk_exe AutoHotkey64.exe")
    CoordMode("Mouse","Screen")
    Click(1992, 25)
}
#v::
{
    Send(pathFromCopy)
}
