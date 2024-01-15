<%

    Response.CodePage = 65001
    Response.Charset = "UTF-8"

akademik_id = Session("akademik_id")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
Set rs = conn.Execute("SELECT ders.ders_ad, ders.ders_kodu as ders_kodu FROM ders LEFT JOIN akademik_ders ON ders.ders_id = akademik_ders.ders_id WHERE akademik_id = " & akademik_id)



%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        tr:hover {
            background-color: #e9e9e9;
        }

        a {
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Ders Adı</th>
                    
                </tr>
            </thead>
            <tbody>

                <% Do While Not rs.EOF %>
                
            
                
                    <tr>
                        <td><a href="akademik_sinav_kontrol.asp?ders_kodu=<%= rs("ders_kodu") %>"><%= rs("ders_ad") %></a></td>
                        
                    </tr>
                    <% rs.MoveNext %>
                <% Loop %>
            </tbody>
        </table>
    </div>
</body>
</html>
