<%
    ders_id = Request.QueryString("ders_id")
    ogrenci_id = Request.QueryString("ogrenci_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    conn.Execute("DELETE FROM ogrenciders WHERE ogrenci_id = " & ogrenci_id & " And ders_id = " & ders_id )
    conn.Close
    Response.Redirect "ders_new.asp?ogrenci_id="+ogrenci_id
%>
