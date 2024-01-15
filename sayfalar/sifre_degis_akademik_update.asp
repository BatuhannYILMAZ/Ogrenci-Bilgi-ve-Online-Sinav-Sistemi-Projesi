<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<body>
    <%
    yeni_sifre = Request.form("yeni_sifre")
    akademik_id = Session("akademik_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    conn.Execute("UPDATE akademik set akademik_sifre='"&yeni_sifre&"' where akademik_id="&akademik_id )%>
    <script>
        alert("Şifre Değişti");
        window.location = "sifre_degis_akademik.asp";
    </script>
</body>
</html>



