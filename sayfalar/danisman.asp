<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <title>Document</title>

    <style>
        body {
            overflow: hidden;
            margin: 0;
            background-color: #888;
            color: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        .card {
            background-color: #555;
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
        }

        .image {
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .image img {
            width: 150px;
            border-radius: 50%;
        }

        .contents {
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #999;
        }

        th {
            color: #999;
        }
    </style>
</head>

<body>
    <% 
    bolum_id=session("bolum_id")
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute("select * from akademik left join bolum on akademik.bolum_id=bolum.bolum_id where bolum.bolum_id="&bolum_id&"")%>
    <div class="card">
        <div class="image">
            <img src="../img/pp.jpg" alt="">
        </div>
        <div class="contents">
            <table>
                <tr>
                    <th>Adı Soyadı</th>
                    <td><%=rs("akademik_ad")%>&nbsp;<%=rs("akademik_soyad")%></td>
                </tr>
                <tr>
                    <th>Fakülte</th>
                    <td>Erbaa Meslek Yüksekokulu</td>
                </tr>
                <tr>
                    <th>Bölüm</th>
                    <td><%=rs("bolum_ad")%></td>
                </tr>
                <tr>
                    <th>Telefon</th>
                    <td><%=rs("akademik_tel")%></td>
                </tr>
                <tr>
                    <th>E-Posta</th>
                    <td><%=rs("akademik_mail")%></td>
                </tr>
            </table>
        </div>
    </div>

</body>

</html>
