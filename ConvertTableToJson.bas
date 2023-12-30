Attribute VB_Name = "Module5"
Sub ConvertTableToJson()
    Dim ws As Worksheet
    Set ws = Worksheets("JSONOutput") ' Change to your output sheet
    'ThisWorkbook.Worksheets
    
    ' Define JSON object and array
    Dim json As Object
    Set json = CreateObject("Scripting.Dictionary")
    
    Dim jsonArray As Collection
    Set jsonArray = New Collection
    
    Dim tbl As ListObject
    Set tbl = Worksheets("Sheet1").ListObjects("Table1") ' Change to your table name and sheet name
    
    ' Loop through each row in the table
    Dim row As ListRow
    For Each row In tbl.ListRows
        Dim item As Object
        Set item = CreateObject("Scripting.Dictionary")
        
        ' Add "src" key and value
        item("src") = row.Range.Cells(1, 1).Value
        
        ' Add "metadata" key and sub-dictionary
        Dim metadata As Object
        Set metadata = CreateObject("Scripting.Dictionary")
        metadata("search") = row.Range.Cells(1, 2).Value
        metadata("categories") = row.Range.Cells(1, 3).Value
        metadata("affiliated_file") = row.Range.Cells(1, 4).Value
        
        ' Add "metadata" sub-dictionary to the item
        item.Add "metadata", metadata
        
        ' Add the item to the JSON array
        jsonArray.Add item
    Next row
    
    ' Add the JSON array to the main JSON object
    json.Add "data", jsonArray
    
    ' Convert the JSON object to a string
    Dim jsonStr As String
    jsonStr = JsonConverter.ConvertToJson(json)
    'Debug.Print JsonConverter.ConvertToJson(json, Whitespace:=2)
    'Debug.Print (Len(jsonStr))

    ' Output the JSON string to the worksheet
    'ws.Range("A1").Value = jsonStr

    ' Split the JSON string into chunks and output them to separate cells
    Dim chunkLength As Long
    chunkLength = 30000 ' Change this value as needed
    
    Dim startChar As Long
    Dim endChar As Long
    Dim currentCell As Range
    Dim chunkCounter As Long
    chunkCounter = 1
    startChar = 1
    
    Do While startChar <= Len(jsonStr)
        endChar = startChar + chunkLength - 1
        
        ' Make sure endChar does not go beyond the length of the JSON string
        If endChar > Len(jsonStr) Then
            endChar = Len(jsonStr)
        End If
        
        ' Output each chunk to a separate cell in the worksheet
        Set currentCell = ws.Cells(chunkCounter, 1)
        currentCell.Value = Mid(jsonStr, startChar, endChar - startChar + 1)
        
        chunkCounter = chunkCounter + 1
        startChar = endChar + 1
    Loop

End Sub
