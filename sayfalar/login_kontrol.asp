<%Response.CodePage = 65001
Response.Charset = "UTF-8"
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
secim=request.form("secim")
email=Request.Form("email")
sifre=Request.Form("sifre")
if secim=1 then
    Set rs= conn.Execute("select * from ogrenci where ogrenci_mail='" & email & "' and ogrenci_sifre='" & sifre &"'")
    if rs.EOF then
        response.write("<script>alert('Mail veya Sifre Hatalidir.')</script>")
        response.write("<script>window.location = 'login.asp'</script>")
    else
            session("ogrenci_id")=rs("ogrenci_id")
            session("ogrenci_ad")=rs("ogrenci_ad")
            session("ogrenci_soyad")=rs("ogrenci_soyad")
            session("email")=rs("ogrenci_mail")
            session("ogrenci_no")=rs("ogrenci_no")
            session("ogrenci_tc")=rs("ogrenci_tc")
            session("bolum_id")=rs("bolum_id")
            session("login_durum")="Evet"
            %>
        <script type="text/javascript">
            window.location = "obs.asp";
        </script><%
     end if
else
    Set rs= conn.Execute("select * from akademik where akademik_mail='" & email & "' and akademik_sifre='" & sifre &"'")
    if rs.EOF then
        response.write("<script>alert('Mail veya Sifre Hatalidir.')</script>")
        response.write("<script>window.location = 'login.asp'</script>")
    else
        session("akademik_id")=rs("akademik_id")
        session("aad")=rs("akademik_ad")
        session("asoyad")=rs("akademik_soyad")
        session("aemail")=rs("akademik_mail")
        session("bolum_id")=rs("bolum_id")
        session("login_durum")="Evet"
        %>
        <script type="text/javascript">
            window.location = "ogretmenobs.asp";
        </script><%
      end if
 end if%>