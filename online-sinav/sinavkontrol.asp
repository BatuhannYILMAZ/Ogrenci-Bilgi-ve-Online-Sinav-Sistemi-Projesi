<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
%>
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
</style>
<%
ders_kodu = Request.QueryString("ders_kodu")

akademik_id = Session("akademik_id")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")

Dim tableExists
tableExists = False

On Error Resume Next
Set rsCheckTable = conn.OpenSchema(20, Array(Empty, Empty, Empty, "TABLE"))
Do Until rsCheckTable.EOF
    If rsCheckTable.Fields("TABLE_NAME").Value = ders_kodu Then
        tableExists = True
        Exit Do
    End If
    rsCheckTable.MoveNext
Loop
rsCheckTable.Close

If tableExists Then
    Set rs = conn.Execute("SELECT * FROM " & ders_kodu)
%>
<div class="container">
    <table>
        <tr> 
            <th>Sınav Adı</th>
            <th>Sınav Açıklama</th>
            <th>Sınav Süresi</th>
        </tr>
        <tr>
            <td><%= rs("sinavad") %></td>
            <td><%= rs("sinavaciklama") %></td>
            <td><%= rs("sinavsuresi") %></td> 
        </tr> 
    </table>

    <table>
        <tr> 
            <th>Soru</th>
            <th>Seçenek A</th>
            <th>Seçenek B</th>
            <th>Seçenek C</th>
            <th>Seçenek D</th>
            <th>Cevap</th>
        </tr>
        <% While Not rs.EOF %>
            <tr>
                <td><%= rs("soru") %></td>
                <td><%= rs("secenekA") %></td>
                <td><%= rs("secenekB") %></td>
                <td><%= rs("secenekC") %></td>
                <td><%= rs("secenekD") %></td>
                <td><%= rs("cevap") %></td>
            </tr>
            <% rs.MoveNext %>
        <% Wend %>
    </table>
<% 
Else
%>
    <p>Sınav Oluşturulmadı</p>

<%
End If

rs.Close
conn.Close
%>
</div>