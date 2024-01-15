<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
   
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        tr:nth-child(even) {
            background-color: #ffffff;
        }
        
        input[type="text"] {
            width: 80px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            text-align: center;
        }
        
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%
    ders_id = request.querystring("ders_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("SELECT ogrenci_ad,ogrenci_soyad,ogrenci.ogrenci_no,vize,final,(vize*0.4+final*0.6) as ort ,ogrenci.ogrenci_id from ogrenci left join ogrenciders on ogrenci.ogrenci_id=ogrenciders.ogrenci_id where ders_id="&ders_id )
%>
<table>
    <tr>
        <th>Öğrenci Numarası</th>
        <th>Öğrenci Adı</th>
        <th>Öğrenci Soyadı</th>
        <th>Vize</th>
        <th>Final</th>
        <th>Ortalaması</th>
        <th>İşlem</th>
    </tr>
    <% Do While Not rs.EOF %>
    <tr>
        <td><%= rs("ogrenci_no") %></td>
        <td><%= rs("ogrenci_ad") %></td>
        <td><%= rs("ogrenci_soyad") %></td>
        <td>
            <form action="not_guncelle.asp" method="get">
                <input type="hidden" name="ders_id" value="<%= ders_id %>">
                <input type="hidden" name="ogrenci_id" value="<%= rs("ogrenci_id") %>">
                <input type="text" name="vize" value="<%= rs("vize") %>">
            
        </td>
        <td>
                <input type="text" name="final" value="<%= rs("final") %>">
        </td>
        <td>
            <%= rs("ort") %>
               
        </td>
        <td><button type="submit">Güncelle</button></td>
            </form>
            
        
    </tr>
    <% rs.MoveNext %>
    <% Loop %>
</table>

</body>
</html>