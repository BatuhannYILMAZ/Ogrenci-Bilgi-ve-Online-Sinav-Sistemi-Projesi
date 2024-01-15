<%  
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
    akademik_id = Session("akademik_id")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
    Set rs= conn.Execute("select ders_ad,ders_kodu from ders left join akademik_ders on ders.ders_id=akademik_ders.ders_id where akademik_id="&akademik_id&"")
%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Sınav Sistemi</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    h1 {
      text-align: center;
    }

    form label {
      display: block;
      margin-top: 10px;
    }

    form input[type="text"], form input[type="number"] {
      width: 100%;
      padding: 5px;
      margin-top: 5px;
    }

    button {
      display: block;
      margin-top: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }

    #soruListesi {
      margin-top: 20px;
    }

    .soru {
      border: 1px solid #ccc;
      padding: 10px;
      margin-bottom: 10px;
      background-color: #f9f9f9;
    }

    .soru strong {
      display: block;
      margin-bottom: 5px;
    }
  </style>
</head>
<body>
  <h1>Soru Ekleme Formu</h1>

  <form id="soruFormu" method="post" action="tablo.asp">
    <div id="dersSec">
        <label for="Ders">Ders:</label>
        <select id="Ders" name="Ders">
            <% do while not rs.eof %>
            <option value="<%=rs("ders_kodu")%>"><%=rs("ders_ad")%></option>
            <% rs.movenext %>
            <% loop %>
        </select>
      <label for="sinav_adi">Sınav Adı</label>
      <input type="text" name="sinav_ad">
      <label for="sinav_aciklama">Sınav Açıklama</label>
      <input type="text" name="sinav_aciklama">
      <label for="sinav_süresi">Sınav Süresi</label>
      <input type="text" name="sinav_suresi">
      <label for="sinav_tarihi">Sınav Tarihi</label>
      <input type="text" name="sinav_tarihi">
      <label for="soruSayisi">Soru Sayısı:</label>
      <input type="number" maxlength="2" id="soruSayisi" name="soruSayisi" min="1" required>
      <button type="submit" onclick="dersSec()" >Devam Et</button>
    </div>

   
  </form>

  
  <script>
    var soruSayisi;
    function dersSec() {
      soruSayisi = parseInt(document.getElementById("soruSayisi").value);
      if (isNaN(soruSayisi) || soruSayisi < 1) {
        alert("Geçerli bir soru sayısı giriniz.");
        return;
      }

     

    }
</script>

 
  
</body>
</html>