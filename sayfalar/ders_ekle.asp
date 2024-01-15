<%
If Request.QueryString("ders") <> "" Then
    Dim ders_id
    ders_id = Request.QueryString("ders")
    
    ogrenci_id = Session("ogrenci_id")
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    conn.Execute("INSERT INTO ogrenciders (ders_id, ogrenci_id) VALUES ('" & ders_id & "','" & ogrenci_id & "')")
    conn.Close
    
    Response.Redirect "derskayit.asp" '
    
    Set conn = Nothing
End If
%>


