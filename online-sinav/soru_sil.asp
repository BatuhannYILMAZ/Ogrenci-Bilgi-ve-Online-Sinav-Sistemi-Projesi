<%

    Response.CodePage = 65001
    Response.Charset = "UTF-8"


Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")
ders_kodu=Request.QueryString("ders_kodu")
id=Request.QueryString("id")
Response.write(ders_id)
Set rs = conn.Execute("delete from [" & ders_kodu & "] where id="&id)

%>

<script>
	window.location = 'sinavlarim.asp'
</script>