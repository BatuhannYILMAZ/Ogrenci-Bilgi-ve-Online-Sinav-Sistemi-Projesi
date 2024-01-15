<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Program Dersleri</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
        }

        th {
            font-weight: bold;
            background-color: #f9f9f9;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e9e9e9;
        }

        td {
            text-align: center;
        }
    </style>
</head>

<body>
    <%
    bolum_id = session("bolum_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("SELECT * FROM ders WHERE bolum_id =" & bolum_id & "")
    %>
    <div class="card">
        <table>
            <tr>
                <td colspan="3" align="center"> <b> PROGRAM DERSLERİ</b></td>
            </tr>
            <tr>
                <th>Ders Adı</th>
                <th>Ders Kodu</th>
                <th>Ders Kredisi</th>
            </tr>
            <%do while not rs.eof%>
            <tr>
                <td><%=rs("ders_ad")%></td>
                <td><%=rs("ders_kodu")%></td>
                <td><%=rs("ders_kredi")%></td>
            </tr>
            <%rs.movenext%>
            <%loop%>
        </table>
    </div>
</body>
</html>
