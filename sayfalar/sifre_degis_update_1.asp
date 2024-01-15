<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    yeni_sifre = Request.form("yeni_sifre")
    ogrenci_no = Request.form("ogrenci_no")
    Response.write(ogrenci_no)
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    conn.Execute("UPDATE ogrenci set ogrenci_sifre='"&yeni_sifre&"' where ogrenci_no="&ogrenci_no )%>
    <script>
        alert("Şifre Değişti");
        window.location = "sifre_degis_1.asp";
    </script>
</body>
</html>



