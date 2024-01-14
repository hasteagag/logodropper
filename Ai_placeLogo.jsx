//arguments[0]; //this will be logo
//arguments[1]; //this will be the of document scale
//#target Illustrator
// placedItem.file = new File("d:\\scanned pics\\logos\\Costco Logo.ai");
// placedItem.file = new File(arguments[0],arguments[1]);
// placedItem.file = new File("C:\\tmp\\logos\\rasterout\\eastern mountain sports.jpg");
// placedItem.file = new File("C:\\tmp\\logos\\SVG\\Aldi Rectangular.svg");

var doc = app.activeDocument;
//need to check if the file is a vector or raster:
var filename = arguments[0];
var extension = filename.split('.').pop();
var maxWidthPercentage = 0.25; // 25% of the document width

if (extension = 'svg') 
{
    var svgFile = File(filename);  
    newGroup=doc.groupItems.createFromFile(svgFile);
    newGroup.position = [ 0 , 0 ];
    //* arguments[1];
    var aspectRatio = newGroup.width / newGroup.height;
    
    if (newGroup.width > doc.width * maxWidthPercentage) {
        newGroup.width = doc.width * maxWidthPercentage;
        newGroup.height = newGroup.width / aspectRatio;
    } else {
        newGroup.height = doc.height * aspectRatio * maxWidthPercentage;
        newGroup.width = newGroup.height * aspectRatio;
    }
}
else {
    var placedItem = doc.placedItems.add();
    placedItem.file = new File(filename);
    var aspectRatio = placedItem.height / placedItem.width;
    if (placedItem.width > doc.width * maxWidthPercentage) {
        placedItem.width = doc.width * maxWidthPercentage;
        placedItem.height = placedItem.width / aspectRatio;
    } else {
        placedItem.height = doc.height * aspectRatio * maxWidthPercentage;
        placedItem.width = placedItem.height * aspectRatio;
    }
}


// placedItem.file = doc.groupItems.createFromFile(svgFile); //maybe

//new File("",arguments[0]);
//alert("height of placed item is: " + placedItem.height + " pts x width of: "  + placedItem.width + " pts");


// 792/2=396 pt is half height of letter
// 612/2=306 pt is half width of letter