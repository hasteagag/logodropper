# logodropper
proof of concept for logo multi search (visual, text, filename, category), uses Thqby's AHK v2 WebView2 wrapper for modern web, then basic HTML, CSS, JS to display and search the logos (files/ assets)

Requires each of the following:

For webview2:
https://github.com/thqby/ahk2_lib

For the Excel File macro to work:
https://github.com/VBA-tools/VBA-JSON

Note regarding the above, even though it gives you an error, I believe you not only need to import the https://github.com/VBA-tools/VBA-JSON/blob/master/JsonConverter.bas, but I think you also need to Tools>Reference it (which will error, ignore it as otherwise I couldn't get it to run on two different machines).  I believe the excel VBA requires "Microsoft Scripting Runtime" reference also.

**Rundown**
Thyqby Library example modified to show index.html, which loads long json (saved to a .js file in a javascript varaible) and then displays images, allowing categorization and metadata search terms other than filename, as well as visual display.  Requires somewhat normalized images (some automation scripts /steps I used may be provided at a later date).

Excel file generates the JSON in VBA using VBA-JSON's JsonConverter, splitting the string if needed (in that instance, you need to copy and assemble the string manually, but for me its only 4 cells so i just copy them into notepad++ and run a find replace regex for \R w/ "").  I then copy that into the variable saved in the .js file labeleed imageSourcesCategoriesMeta.js but you could certainly find replace this w/ something less daft.

You will need to check paths everywhere, as the desktop and other folders are not going to be dynamically updated for your system, but it should be pretty obvious.  The AHK file has absolute path with \\username\\ in several places but you can put these files wherever, or maybe swap for %USERNAME% but I havent tested that.  Also presently index.html is expected to be saved in c:\tmp\logos\ along with imageSourcesCategoriesMeta.js (and ofc in a general solution, feel free to adapt).  For performance reasons, its possibly advantageous to keep the images in the same directory.

Have fun and do something cooler with the images, or add features to logodropper!

Reach goals / wish list:
- tighten up the timeframe
- UXP method, rework web tech so its comaptible
- prevent requiring elevation of the AHK wrapper

Here is an example of what the interface looks like:
![logodropperexample](https://github.com/hasteagag/logodropper/assets/49802378/89912989-a9fa-4d99-9f2b-0cf5ce020707)

And a brief example video with what I hope are open icons from wikipedia (although my use case is much more broad):
https://youtu.be/tfXBqEfG1ic
