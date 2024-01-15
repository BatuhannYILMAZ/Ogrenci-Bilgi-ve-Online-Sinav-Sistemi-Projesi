<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    akademik_id=session("akademik_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("SELECT ogrenci_no,ders_ad,ogrenci_ad,ogrenci_soyad from (ders left join akademik_ders on ders.ders_id=akademik_ders.ders_id) left join ogrenci on ogrenci.bolum_id=ders.bolum_id where akademik_id="&akademik_id&" order by ogrenci_id")
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sınıfım</title>
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
                <td>Ögrenci Numarası </td>
    			<td>Ögrenci Adı </td>
    			<td>Ögrenci Soyadı</td>
    			<td>Ders Adı</td>
    			
    		</tr>
            <% Do While Not rs.EOF %>
						<tr>
							<td><%= rs("ogrenci_no") %></td>
							<td><%= rs("ogrenci_ad") %></td>
							<td><%= rs("ogrenci_soyad") %></td>
							<td><%= rs("ders_ad") %></td>
						</tr>
					<% rs.MoveNext%>
					<%loop%>
					
    	</table>
	</div>
</body>
</html>
