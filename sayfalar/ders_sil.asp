<%

    Dim ders_id
    ders_id = Request.QueryString("sil")
    ogrenci_id = Session("ogrenci_id")
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    conn.Execute("DELETE FROM ogrenciders WHERE    ogrenci_id = " & ogrenci_id & " And ders_id = " & ders_id & "")
    conn.Close
    Response.Redirect "derskayit.asp" 
    Set conn = Nothing

%>
