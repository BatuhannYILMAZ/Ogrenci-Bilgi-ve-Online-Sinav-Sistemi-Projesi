<%
ders_id = Request.QueryString("ders_id")
ogrenci_id = Request.QueryString("ogrenci_id")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")

' Aynı dersin öğrenciye daha önce eklenip eklenmediğini kontrol et
checkQuery = "SELECT COUNT(*) FROM ogrenciders WHERE ogrenci_id = " & ogrenci_id & " AND ders_id = " & ders_id
Set checkResult = conn.Execute(checkQuery)
alreadyExists = CInt(checkResult.Fields(0).Value) > 0
checkResult.Close

If alreadyExists Then
    ' Hata mesajını yer tutucuya aktar
    errorMessage = "Bu ders zaten öğrenciye eklenmiş."
    Response.Redirect "ders_new.asp?ogrenci_id=" & ogrenci_id & "&error=" & Server.URLEncode(errorMessage)
Else
    ' Dersi ekleyerek işlem yap
    insertQuery = "INSERT INTO ogrenciders (ogrenci_id, ders_id) VALUES (" & ogrenci_id & ", " & ders_id & ")"
    conn.Execute insertQuery
    ' Hata mesajını boşalt
    errorMessage = ""
    Response.Redirect "ders_new.asp?ogrenci_id=" & ogrenci_id & "&error=" & Server.URLEncode(errorMessage)
End If

conn.Close
%>
