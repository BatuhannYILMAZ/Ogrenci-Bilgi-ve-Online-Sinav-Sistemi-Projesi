<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Sınav Sistemi</title>
</head>
<body>
<%

Response.CodePage = 65001
Response.Charset = "UTF-8" 

soruSayisi = Request.Form("soruSayisi")
Session("soruSayisi") = soruSayisi
Session("soruSayisi1") = 0

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")

sinav_ad = Request.Form("sinav_ad")
sinav_aciklama = Request.Form("sinav_aciklama")
sinav_suresi = Request.Form("sinav_suresi")
sinav_tarihi = Request.Form("sinav_tarihi")
sinav_tur=Request.form("sinav_tur")


Session("sinav_ad") = sinav_ad
Session("sinav_aciklama") = sinav_aciklama
Session("sinav_suresi") = sinav_suresi
Session("sinav_tarihi") = sinav_tarihi
session("sinav_tur")=sinav_tur
ders_kodu = Request.Form("Ders")
Session("ders_kodu") = ders_kodu

Dim createTableSQL
createTableSQL = "CREATE TABLE [" & ders_kodu & "] (" & _
"id INT IDENTITY(1,1) PRIMARY KEY, " & _
"sinavad Memo, " & _
"sinavaciklama Memo, " & _
"sinavsuresi Memo, " & _
"sinavtarihi Memo, " & _
"sinav_tur Memo, " & _
"Soru Memo, " & _
"SecenekA Memo, " & _
"SecenekB Memo, " & _
"SecenekC Memo, " & _
"SecenekD Memo, " & _
"Cevap Memo" & _
")"

On Error Resume Next
conn.Execute createTableSQL 

If Err.Number <> 0 Then
    If Err.Description Like "'CREATE TABLE' işlemiolamaz çünkü bir tabloaynı isimde mevcuttur" Then
        response.write "<script>alert('Hata: " & ders_kodu & " adında bir tablo zaten mevcut.')</script>"
        response.write "<script>window.location='sinav-olustur.asp'</script>"
    Else
        Response.Write "Hata oluştu: " & Err.Description
    End If
else

End If

On Error GoTo 0
response.write "<script>window.location='soruEkle.asp'</script>"
%>

</body>
</html>