<!DOCTYPE html>
<html>
  <%Response.CodePage = 65001
  Response.Charset = "UTF-8"%>
  <head>
    <title>Şifremi Unuttum</title>
    <style>
      * {
        box-sizing: border-box;
      }

      body {
        font-family: "Lato", sans-serif;
        background-image: url("../img/bg.jpg");
        margin: 0;
      }

      .container {
        width: 25%;
        margin: 0 auto;
        text-align: center;
        margin-top: 200px;
        padding: 20px;
        background-color: #eeeeee;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      }

      h1 {
        font-size: 2em;
      }

      form {
        display: inline-block;
        text-align: left;
        margin-top: 2em;
      }

      label {
        display: block;
        margin-bottom: 0.5em;
      }

      input[type="email"],
      input[type="text"] {
        width: 100%;
        padding: 0.5em;
        margin-bottom: 1em;
        border-radius: 5px;
        border: none;
      }

      input[type="submit"] {
        background-color: #222831;
        color: white;
        padding: 0.5em 1em;
        border-radius: 5px;
        border: none;
        cursor: pointer;
      }

      input[type="submit"]:hover {
        background-color: #393e46;
      }
      .don {
        color: #00adb5;
        text-decoration: none;
        margin-right: 300px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <a href="login.asp" class="don">Giriş Ekranına Dön</a>
      <h1>Şifremi Unuttum</h1>
      <p>Lütfen aşağıdaki formu kullanarak yeni bir şifre oluşturun.</p>
      <form action="../sayfalar/sifre_degis_1.asp">
        <label for="ogrno">Öğrenci No:</label>
        <input type="text" id="ogrenci_no" name="ogrenci_no" required />
        <label for="tc">Kimlik No:</label>
        <input type="text" id="tc" name="tc" required />
        <label for="email">E-posta:</label>
        <input type="email" id="email" name="email" required />
        <input type="submit" value="Şifreyi Sıfırla" />
      </form>
    </div>
  </body>
</html>
