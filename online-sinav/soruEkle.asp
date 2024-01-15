<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Sınav Sistemi</title>

    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
      }

      #soruEklemeContainer {
        max-width: 500px;
        margin: 0 auto;
      }

      label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }

      input[type="text"],
      select {
        width: 100%;
        padding: 5px;
        margin-bottom: 10px;
      }

      button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #4caf50;
        color: white;
        border: none;
        cursor: pointer;
      }

      button:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
    <form action="soruInsert.asp" method="post">
      <div id="soruEklemeContainer">
        <label for="soruMetni">Soru Metni:</label>
        <input type="text" id="soruMetni" name="soruMetni" />

        <label for="secenekA">Seçenek A:</label>
        <input type="text" id="secenekA" name="secenekA" />

        <label for="secenekB">Seçenek B:</label>
        <input type="text" id="secenekB" name="secenekB" />

        <label for="secenekC">Seçenek C:</label>
        <input type="text" id="secenekC" name="secenekC" />

        <label for="secenekD">Seçenek D:</label>
        <input type="text" id="secenekD" name="secenekD" />

        <label for="cevap">Doğru Cevap:</label>
        <input type="text" id="cevap" name="cevap" />
        

        <button type="submit">Soru Ekle</button>
      </div>
    </form>
    
    <%
    soruSayisi = CInt(Session("soruSayisi"))
    soruSayisi1 = CInt(Session("soruSayisi1"))
    If soruSayisi = soruSayisi1 Then
    %>
        <script>alert("Sınav Ekleme Bitti"); window.location="sinav_olustur.asp";</script>
        <%soruSayisi1 = 0
        Session("soruSayisi1") = soruSayisi1
    Else
        soruSayisi1 = soruSayisi1 + 1
        Session("soruSayisi1") = soruSayisi1
    End If
    %>
    



  </body>
</html>
