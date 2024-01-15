<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    bolum_id = Session("bolum_id")
    ogrenci_id=request.querystring("ogrenci_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs= conn.Execute("select ders_ad,ders_kodu,ders_kredi,ders_id from ders where bolum_id="&bolum_id)
    
    Set conn1 = Server.CreateObject("ADODB.Connection")
    conn1.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
   Set rs1= conn1.Execute("SELECT ders.ders_id,ders_ad,ders.ders_id, ders_kodu, ders_kredi FROM ders LEFT JOIN ogrenciders ON ders.ders_id = ogrenciders.ders_id WHERE ogrenci_id ="&ogrenci_id)
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
        .error-message{
            color: red;
            text-align: center;
        }
        
    </style>
</head>
<body>
    <h1>ALINABİLİR DERSLER</h1>
    <table>
        <tr>
            <th>Ders Kodu</th>
            <th>Ders Adı</th>
            <th>Kredi</th>
            <th>Ekle</th>
        </tr>
        <% do while not rs.eof %>
        <tr>
            <td><%= rs("ders_kodu") %></td>
            <td><%= rs("ders_ad") %></td>
            <td><%= rs("ders_kredi") %></td>
            <td><a href="ders_new1.asp?ders_id=<%= rs("ders_id") %>&ogrenci_id=<%= ogrenci_id %>">Ekle</a></td>
        </tr>
        <% rs.movenext %>
        <% loop %>
    </table>
    <%
    Dim errorMessage
    errorMessage = Request.QueryString("error")
    
    ' Hata mesajını kontrol et ve göster
    If errorMessage <> "" Then
        Response.Write "<div class=""error-message"">" & errorMessage & "</div>"
    End If
    %>
    
    <h1>MEVCUT DERSLER</h1>
    <table>
        <tr>
            <th>Ders Kodu</th>
            <th>Ders Adı</th>
            <th>Kredi</th>
            <th>Sil</th>
        </tr>
        <% do while not rs1.eof %>
        <tr>
            <td><%= rs1("ders_kodu") %></td>
            <td><%= rs1("ders_ad") %></td>
            <td><%= rs1("ders_kredi") %></td>
            <td><a href="ders_delete.asp?ders_id=<%= rs1("ders_id") %>&ogrenci_id=<%= ogrenci_id %>">Sil</a></td>
        </tr>
        <% rs1.movenext %>
        <% loop %>
    </table>
</body>
</html>