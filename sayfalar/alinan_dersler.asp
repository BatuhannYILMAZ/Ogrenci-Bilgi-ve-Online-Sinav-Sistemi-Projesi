<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    bolum_id=session("bolum_id")
    ogrenci_id=session("ogrenci_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs= conn.Execute("SELECT ders_ad,ders.ders_id, ders_kodu, ders_kredi FROM ders LEFT JOIN ogrenciders ON ders.ders_id = ogrenciders.ders_id WHERE ogrenci_id ="&ogrenci_id&"")
        
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <title>Alınan Dersler</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
        }

        th {
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Alınan Dersler</h1>
        <table>
            <tr>
                <th>Ders Kodu</th>
                <th>Ders Adı</th>
                <th>Kredi</th>
            </tr>
            <%do while not rs.eof%>
            <tr>
                <td><%=rs("ders_kodu")%></td>
                <td><%=rs("ders_ad")%></td>
                <td><%=rs("ders_kredi")%></td>
            </tr>
            <%rs.movenext%>
            <%loop%>
        </table>
    </div>
</body>
</html>
