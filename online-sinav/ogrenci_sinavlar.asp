<%
Response.CodePage = 65001
Response.Charset = "UTF-8"
%>
<% 
ders_kodu = Session("ders_kodu")
ogrenci_id = Session("ogrenci_id")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")

Set rs = conn.Execute("SELECT ders.ders_ad, ders.ders_kodu FROM ders LEFT JOIN ogrenciders ON ders.ders_id = ogrenciders.ders_id WHERE ogrenci_id = " & ogrenci_id)


%>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
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

<table>
    <% Do While Not rs.EOF %>
        <tr>
            <td><a href="ogrenci_sinav_kontrol.asp?ders_kodu=<%= rs("ders_kodu") %>"><%= rs("ders_ad") %></a></td>
        </tr>
        <% rs.MoveNext %>
    <% Loop %>
</table>
