#Include WebView2.ahk
; DllCall("AllocConsole")
; class Print { 
;     static stdout:=FileOpen("CONOUT$", "w") 
;     static Call(str:="") {
;         this.stdout.Write(str)
;         this.stdout.Read(0) 
;     }
; }
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
            ; ps:=ComObject("Photoshop.Application")
            ; ps.bringToFront()
            ; ps.DoJavaScriptFile("c:\\users\\username\\desktop\\placeLogo.jsx", filePath)
			; this above com approach didnt work either to pass arguments.
			
            ; Run("c:\\users\\username\\desktop\\placeLogo.jsx" filePath "") ; doesnt work
            ; Run("c:\\users\\username\\desktop\\runjavascript.vbs c:\\users\\username\\desktop\\placeLogo.jsx " filePath "") ;works, but its slow
            ; FileDelete("c:\users\username\desktop\placeLogoBaked.jsx") ; results in almost exact same delay as the above by creating the file, but not using vbs wrapper
			
			; this requires elevation, or allowing that folder, both less than ideal, however, it is immediate, and saved in the scripts folder on photoshop startup:
            FileDelete("C:\Program Files\Adobe\Adobe Photoshop 2024\Presets\Scripts\placeLogoBaked.jsx")
            Loop read, "c:\users\username\desktop\placeLogo.jsx", "C:\Program Files\Adobe\Adobe Photoshop 2024\Presets\Scripts\placeLogoBaked.jsx"
            {
                ; MsgBox "Field number " A_Index " is " A_LoopReadLine "."
                if(A_Index = 36)
                    {
                        FileAppend("desc40.putPath( idnull, new File( `"" filePath "`" ) );`n")
                    }
                    else {
                        FileAppend(A_LoopReadLine "`n")
                    }
            }
            WinActivate("ahk_class Photoshop ahk_exe Photoshop.exe")
            Send("!{F2}") ;this is hotkeyed in photoshop to run the script to place the file
            ; print("Run returns by: " A_TickCount " ms`n")
        case "Illustrator":
            filePath:=StrReplace(filePath,"file:///","")
            filePath:=StrReplace(filePath,"/","\\") ;not sure if we need either of these but its working
            Run("c:\\users\\username\\desktop\\runjavascriptAI.vbs c:\\users\\username\\desktop\\Ai_placeLogo.jsx " filePath "")
            WinActivate("ahk_class illustrator ahk_exe Illustrator.exe")
        case "Copy":
            global pathFromCopy:=filePath
            tooltip("Path was added to #v")
            sleep(1200)
            tooltip("")
    }
    main.hide()
    global shown:=0
    MouseMove(curMousePos.x,curMousePos.y)     ;move back to former mouse position
}
main := Gui('+Resize')
main.OnEvent('Close', (*) => (wvc:=wv:=0))
main.Show("x1912 w1920 h1080")
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
    global curMousePos,x,y
    MouseGetPos(&x, &y)
    curMousePos:={}
    curMousePos.x:=x
    curMousePos.y:=y
    main.Show("x1912 y-32 w1920 h1080")
    ; main.maximize()
    global shown:=1
    WinActivate("ahk_class AutoHotkeyGUI ahk_exe AutoHotkey64.exe")
    CoordMode("Mouse","Screen")
    Click(1992, 25)
}
#v::
{
    Send(pathFromCopy)
}
