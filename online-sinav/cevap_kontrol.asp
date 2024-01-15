<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    Session("puan") = CInt(Session("puan")) ' Convert "puan" to integer
    ders_kodu = Request.Form("ders_kodu")
    soru_id = Request.Form("soru_id")
    gelen_cevap = Request.Form("secenek")

    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")
    Set rs2 = conn.Execute("SELECT count(*) as soru_sayisi FROM " & ders_kodu  )
    Set rs = conn.Execute("SELECT cevap FROM " & ders_kodu & " WHERE id = " & soru_id)
    arti=100/rs2("soru_sayisi")
    If gelen_cevap = rs("cevap") Then
        Session("puan") = Session("puan") +arti
        Response.Write "<script>window.location='ogrenci-sinav-gir.asp?ders_kodu=" & ders_kodu & "'</script>"
    Else
        Response.Write "<script>window.location='ogrenci-sinav-gir.asp?ders_kodu=" & ders_kodu & "'</script>"
        End If
        %>
