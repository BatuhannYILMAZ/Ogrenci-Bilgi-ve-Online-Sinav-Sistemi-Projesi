<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    bolum_id = Session("bolum_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs= conn.Execute("select ogrenci_id,ogrenci_no,ogrenci_ad,ogrenci_soyad,ogrenci.bolum_id from ogrenci where bolum_id="&bolum_id)
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
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e6e6e6;
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
<body>
    <h1>DERS KAYIT</h1>
    <table>
        <tr>
            <th>Öğrenci No</th>
            <th>Öğrenci Ad</th>
            <th>Öğrenci Soyad</th>
            <th>Ekle</th>
        </tr>
        <% do while not rs.eof %>
        <tr>
            <td><%= rs("ogrenci_no") %></td>
            <td><%= rs("ogrenci_ad") %></td>
            <td><%= rs("ogrenci_soyad") %></td>
            <td><a href="ders_new.asp?ogrenci_id=<%= rs("ogrenci_id") %>">Ekle</a></td>
        </tr>
        <% rs.movenext %>
        <% loop %>
    </table>
</body>
</html>
