<!DOCTYPE html>
<html>
<head>
	<title>Ders Kayıt</title>
	
	
	
</head>
<body>
    <% id=request.querystring("id")
    dersid=request.querystring("dersid")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs = conn.Execute(" SELECT ogrenci_ad,ogrenci_soyad,ogrenci.ogrenci_no,vize,final,(vize*0.4+final*0.6) as ort from ogrenci left join ogrenciders on ogrenci.ogrenci_id=ogrenciders.ogrenci_id where ogrenci.ogrenci_id="&id&" and ders_id="&dersid)
    %>

    <table>
        <tr>
            <td>Ögrenci Adı </td>   
            <td>Ögrenci Soyadı</td>
            <td>ogrenci Numarası</td>
            <td> Vize   </td>
            <td>Final</td>
            <td>Ortalama</td>   
            
        </tr>
    
                    <tr> 
                        <td><%= rs("ogrenci_ad")%></td>
                        <td><%= rs("ogrenci_soyad") %></td>
                        <td><%= rs("ogrenci_no") %></td>
                        <td><%= rs("vize") %></td>
                        <td><%= rs("final") %></td>
                        <td><%= rs("ort") %></td>
                    </tr>
            
                
    </table>
	
</body>
</html>
