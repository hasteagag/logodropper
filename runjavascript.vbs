Set vbsArguments = WScript.Arguments 

If vbsArguments.Length = 0 Then 
	'WScript.Echo "Argument(0) is `your script to execute" 
	'WScript.Echo "Arguments(0+n) are passed to your script as argument(0) to argument(n-1)" 
	Else 
		ReDim jsxArguments(vbsArguments.length-2) 

	for i = 1 to vbsArguments.length - 1 
		jsxArguments(i-1) = vbsArguments(i) 
	Next 

	Set photoshop = CreateObject( "Photoshop.Application" ) 
	photoshop.BringToFront
	

	'DoJavaScript has 3 parameters 
	' syntax DoJavaScript(arg[0], arg[1], arg[2]] 
	'arg[0] == javascript file to execute, full pathname 
	'arg[1] == an array of arguments to past to the javascript 
	'arg[2] == AiJavaScriptExecutionMode: aiNeverShowDebugger = 1,, aiDebuggerOnError = 2 aiBeforeRunning = 3 
	' only use 1 

	Call photoshop.DoJavaScriptFile( vbsArguments(0), jsxArguments, 1)
End IF 