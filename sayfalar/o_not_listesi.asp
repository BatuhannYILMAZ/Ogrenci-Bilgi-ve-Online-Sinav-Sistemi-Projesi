<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Grades</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 14px;
            line-height: 1.5;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            padding: 8px;
            text-align: left;
            vertical-align: top;
        }
        th {
            background-color: #555;
            color: #fff;
        }
        tr:nth-child(odd) {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #fff;
        }
        .pass {
            color: green;
        }
        .fail {
            color: red;
        }
    </style>
</head>

<body>
    <%
    ogrenci_id=session("ogrenci_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("SELECT ders_kodu,ders.ders_ad,vize,final FROM ogrenciders left join ders on ogrenciders.ders_id=ders.ders_id WHERE ogrenci_id ="&ogrenci_id)
    %>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Ders Kodu</th>
                    <th>Ders Adı</th>
                    <th>Vize</th>
                    <th>Final</th>
                    <th>Ort</th>
                    <th>Durum</th>
                </tr>
            </thead>
            <tbody>
                <%do while not rs.eof
                    vize = rs("vize")
                    final = rs("final")
                    ort = (vize * 0.4)+ (final * 0.6) %>
                    <tr class="<% If ort > 60 And final > 50 Then Response.Write("pass") Else Response.Write("fail") End If %>">
                        <td><%=rs("ders_kodu")%></td>
                        <td><%=rs("ders_ad")%></td>
                        <td ><%=vize%></td>
                        <td><%=final%></td>
                        <td><%=ort%></td>
                        <td><% If ort > 60 And final > 50 Then Response.Write("Geçti") Else Response.Write("Kaldı") End If %></td>
                    </tr>
                <%rs.movenext%>
                <%loop%>
            </tbody>
        </table>
    </div>

</body>
</html>