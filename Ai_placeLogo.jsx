//arguments[0]; //this will be logo
// placedItem.file = new File("C:\\tmp\\logos\\rasterout\\eastern mountain.jpg");
// placedItem.file = new File("C:\\tmp\\logos\\SVG\\SomethingRectangular.svg");

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
