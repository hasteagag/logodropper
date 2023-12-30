// var I =  1;
// alert("hello" + I);
// var o = arguments.length();
// alert(o);
#target photoshop
// for( n = 0 ; n < arguments.length; n++ ){ 
	// alert("argument("+ n+")= " + arguments[n]); 
// } 


// =======================================================
var idPlc = charIDToTypeID( "Plc " );
    var desc40 = new ActionDescriptor();
    var idAs = charIDToTypeID( "As  " );
        var desc41 = new ActionDescriptor();
        var idfsel = charIDToTypeID( "fsel" );
        var idpdfSelection = stringIDToTypeID( "pdfSelection" );
        var idpage = stringIDToTypeID( "page" );
        desc41.putEnumerated( idfsel, idpdfSelection, idpage );
        var idPgNm = charIDToTypeID( "PgNm" );
        desc41.putInteger( idPgNm, 1 );
        var idCrop = charIDToTypeID( "Crop" );
        var idcropTo = stringIDToTypeID( "cropTo" );
        var idboundingBox = stringIDToTypeID( "boundingBox" );
        desc41.putEnumerated( idCrop, idcropTo, idboundingBox );
        var idsuppressWarnings = stringIDToTypeID( "suppressWarnings" );
        desc41.putBoolean( idsuppressWarnings, false );
        var idAntA = charIDToTypeID( "AntA" );
        desc41.putBoolean( idAntA, true );
        var idClPt = charIDToTypeID( "ClPt" );
        desc41.putBoolean( idClPt, true );
    var idPDFG = charIDToTypeID( "PDFG" );
    desc40.putObject( idAs, idPDFG, desc41 );
    var idIdnt = charIDToTypeID( "Idnt" );
    desc40.putInteger( idIdnt, 8 );
    var idnull = charIDToTypeID( "null" );
    desc40.putPath( idnull, new File( arguments[0] ) );
    var idFTcs = charIDToTypeID( "FTcs" );
    var idQCSt = charIDToTypeID( "QCSt" );
    var idQcsa = charIDToTypeID( "Qcsa" );
    desc40.putEnumerated( idFTcs, idQCSt, idQcsa );
    var idOfst = charIDToTypeID( "Ofst" );
        var desc42 = new ActionDescriptor();
        var idHrzn = charIDToTypeID( "Hrzn" );
        var idRlt = charIDToTypeID( "#Rlt" );
        desc42.putUnitDouble( idHrzn, idRlt, 0.000000 );
        var idVrtc = charIDToTypeID( "Vrtc" );
        var idRlt = charIDToTypeID( "#Rlt" );
        desc42.putUnitDouble( idVrtc, idRlt, 0.000000 );
    var idOfst = charIDToTypeID( "Ofst" );
    desc40.putObject( idOfst, idOfst, desc42 );
    var idAntA = charIDToTypeID( "AntA" );
    desc40.putBoolean( idAntA, true );
executeAction( idPlc, desc40, DialogModes.NO );

    //desc40.putPath( idnull, new File( "D:\\scanned pics\\Logos\\Family Dollar Vector Logo Best.ai" ) );
