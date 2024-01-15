<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
%>
<%
Dim connVT, connOBS
Set connVT = Server.CreateObject("ADODB.Connection")
Set connOBS = Server.CreateObject("ADODB.Connection")

connVT.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")
connOBS.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")

Dim ders_kodu
ders_kodu = Request.QueryString("ders_kodu")

Dim rs0, rs1
Set rs0 = Server.CreateObject("ADODB.Recordset")
Set rs1 = Server.CreateObject("ADODB.Recordset")

rs0.Open "SELECT * FROM " & ders_kodu, connVT
rs1.Open "SELECT ders.ders_id FROM ders LEFT JOIN ogrenciders ON ders.ders_id = ogrenciders.ders_id WHERE ders_kodu='" & ders_kodu & "'", connOBS

Dim puan
puan = CInt(Session("puan"))

If rs0("sinav_tur") = "final" Then
    connOBS.Execute "UPDATE ogrenciders SET final=" & puan & " WHERE ogrenci_id=" & Session("ogrenci_id") & " AND ders_id=" & rs1("ders_id")
Else
    connOBS.Execute "UPDATE ogrenciders SET vize=" & puan & " WHERE ogrenci_id=" & Session("ogrenci_id") & " AND ders_id=" & rs1("ders_id")
End If

connVT.Execute("INSERT INTO sinav_kontrol VALUES ("&Session("ogrenci_id")&",'"&ders_kodu&"') ")




Response.Write "Puanınız OBS Sistemine  eklendi" 
%>