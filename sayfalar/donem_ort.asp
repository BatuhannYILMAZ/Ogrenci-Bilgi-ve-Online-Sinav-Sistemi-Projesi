<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    ogrenci_id=session("ogrenci_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("SELECT count(ders_ad) as sayi,sum(ders_kredi) as toplam,sum(ders_kredi)+2 as akts, round(avg(ogrenciders.vize*0.4+ogrenciders.final*0.6),2) as ort FROM  ders left join ogrenciders on ders.ders_id= ogrenciders.ders_id  where ogrenci_id ="&ogrenci_id)


	%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		
		body {
			font-family: Arial, sans-serif;
			background-color: #f5f5f5;
		}

		.card {
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			padding: 20px;
			margin: 20px auto;
			max-width: 600px;
		}

		table {
			width: 100%;
			border-collapse: collapse;
		}

		td {
			padding: 10px;
		}

		tr:nth-child(even) {
			background-color: #f9f9f9;
		}

		td:first-child {
			font-weight: bold;
		}

		td:nth-child(2),
		td:nth-child(3),
		td:nth-child(4) {
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="card">
    	<table>
    		<tr>
    			<td>Aldığı Ders Sayısı</td>
    			<td>Toplam Kredi</td>
    			<td>Toplam AKTS</td>
    			<td>Genel Not Ortalaması</td>
    		</tr>
            <tr>
                <td><%=rs("sayi")%></td>
                <td><%=rs("toplam")%></td>
                <td><%=rs("akts")%></td>
                <td><%=rs("ort") %></td>
            </tr>
    	</table>
	</div>
</body>
</html>
