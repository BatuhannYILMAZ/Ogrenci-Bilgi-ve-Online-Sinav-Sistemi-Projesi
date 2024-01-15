<style>
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
    .submit-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            width: 5%;
        }
    .submit-button:hover {
        background-color: #45a049;
    }
</style>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"

ders_kodu = Request.QueryString("ders_kodu")

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
    <%Set rsKontrol = conn.Execute("SELECT * FROM sinav_kontrol WHERE ogrenci_id=" & Session("ogrenci_id") & " AND ders_kodu='" & ders_kodu & "'")
        If Not rsKontrol.EOF Then %>
            <p>Sınava Girildi</p>
        <% Else %>
            <a class="submit-button" href="ogrenci-sinav-gir.asp?ders_kodu=<%=ders_kodu%>">Sınava Gir</a>
        <% End If %>
<%Else
    %>
    <p>Sınav Oluşturulmadı</p>
    <%
End If
rs.Close
conn.Close
%>
