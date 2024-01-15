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
			margin: 20px auto;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
			border-radius: 5px;
			max-width: 800px;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
		}
		th, td {
			padding: 10px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		th {
			background-color: #f2f2f2;
		}
		a{
			
			border: 1px solid gray ;
			border-radius: 5px;
			padding: 4px  8px 4px 8px;
			text-decoration: none;
			color: black;
		}
		a:hover {
			background-color: #555;
			color: #ccc;
		}
	</style>
</head>
<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    akademik_id=session("akademik_id")
    Set conn = Server.CreateObject("ADODB.Connection")
   conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("SELECT ders_kodu,ders_ad,ders.ders_id from ders left join akademik_ders on ders.ders_id=akademik_ders.ders_id where akademik_id="&akademik_id&" ")
%>
<body>
	<div class="card">
    	<table>
    		<tr>
				<th>Ders Kodu</th>
    			<th colspan="2">Ders Adı</th>
    		</tr>
            <% Do While Not rs.EOF %>
						<tr>
							<td><%= rs("ders_kodu") %></td>
							<td><%= rs("ders_ad") %></td>
							<td> <a href="not_listesi.asp?ders_id=<%= rs("ders_id") %>"> Not Duzenle</a></td>
						</tr>
					<% rs.MoveNext%>
					<%loop%>
    	</table>
	</div>
</body>
</html>