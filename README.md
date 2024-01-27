# logodropper
proof of concept for logo multi search (visual, text, filename, category), uses Thqby's AHK v2 WebView2 wrapper for modern web, then basic HTML, CSS, JS to display and search the logos (files/ assets)

Requires each of the following:

For webview2:
https://github.com/thqby/ahk2_lib

For the Excel File macro to work:
https://github.com/VBA-tools/VBA-JSON

and even though it gives you an error, I believe you not only need to import the https://github.com/VBA-tools/VBA-JSON/blob/master/JsonConverter.bas, but I think you also need to Tools>Reference it (which will error, ignore it as otherwise I couldnt get it to run on two machines)

**Rundown**
Thyqby Library example modified to show index.html, which loads long json (saved to a .js file in a javascript varaible) and then displays images from a directory, allowing categorization and other search terms, as well as a multi file visual display.  Requires SVG or other somewhat normalized images (automation scripts /steps may be provided at a later date for adobe suite).

Excel file generates the JSON in VBA using VBA-JSON's JsonConverter, splitting the string if needed (in that instance, you need to copy and assemble the string manually).  I believe the excel VBA requires "Microsoft Scripting Runtime" reference.

You will need to check paths yourself, but presently index.html is expected to be saved in c:\tmp\logos\ along with imageSourcesCategoriesMeta.js (and ofc in a general solution, this could be renamed to something less horrid).  For performance reasons, its possibly advantageous to keep the images in the same directory.  Have fun and do something cooler with the images, or add features to logodropper!

You will need to set the path to the JSX files as well as the vbs file.

Here is an example of what the interface looks like:
![logodropperexample](https://github.com/hasteagag/logodropper/assets/49802378/89912989-a9fa-4d99-9f2b-0cf5ce020707)
