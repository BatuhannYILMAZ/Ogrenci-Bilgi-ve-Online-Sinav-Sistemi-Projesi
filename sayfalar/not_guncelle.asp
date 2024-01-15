<%
    ders_id = request.querystring("ders_id")
    ogrenci_id = request.querystring("ogrenci_id")
    
    vize = request.querystring("vize")
    final = request.querystring("final")

  
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")


    conn.Execute("UPDATE ogrenciders SET vize=" & vize & ", final=" & final & " WHERE ders_id=" & ders_id & " AND ogrenci_id=" & ogrenci_id)

 

 
%>
<script>
window.location="not_giris.asp"

</script>