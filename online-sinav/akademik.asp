<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="TR">
  <head>
    
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/e52ae652d9.js"
      crossorigin="anonymous"
    ></script>
    <title>Online Sınav Sistemi</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: "Lato", sans-serif;
        overflow: hidden;
      }

      .main-header {
        background-color: #222831;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 100px;
        padding: 0;
        margin: 0;
      }

      .logo {
        width: 300px;
        height: 100px;
      }

      .ogrenci {
        padding: 5px;
        position: relative;
        right: 50px;
        display: flex;
        align-items: center;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      .ogrenci:hover {
        background-color: #393e46;
      }

      .ogrenci img {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 50%;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
      }

      .ogrenci span {
        margin-left: 10px;
        color: white;
        font-weight: bold;
        font-size: 16px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
      }
      .ogrenci i {
        margin-left: 10px;
        color: white;
        font-size: 20px;
      }

      .main {
        display: flex;
        width: 100%;
        height: 100vh;
      }

      .menu {
        width: 300px;
        background-color: #eee;
      }

      .menu ul {
        list-style: none;
        margin: 0;
        padding: 0;
      }

      .menu ul li {
        border-bottom: 1px solid #ddd;
      }

      .menu ul li:last-child {
        border-bottom: none;
      }

      .menu ul li a {
        display: block;
        color: #555;
        text-decoration: none;
        padding: 20px;
        transition: background-color 0.3s ease;
      }

      .menu ul li a:hover {
        background-color: #ddd;
      }

      .menu ul li a i {
        margin-right: 10px;
      }

      .content {
        flex: 1;
        background-color: #f1f1f1;
      }

      .dropdown-menu {
        position: absolute;
        top: 100%;
        right: 0;
        width: 200px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-top: none;
        display: none;
        z-index: 1;
      }

      .ogrenci:hover .dropdown-menu {
        display: block;
      }

      .dropdown-menu a {
        display: block;
        color: #555;
        text-decoration: none;
        padding: 10px 20px;
        transition: background-color 0.3s ease;
      }

      .dropdown-menu a:hover {
        background-color: #ddd;
      }
    </style>
  </head>
  <%
    Response.CodePage = 65001
    Response.Charset = "UTF-8" 
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/OBS.mdb")
%>
  <body>
    <header class="main-header">
      <div class="logo">
        <img src="../img/logo.png" alt="" />
      </div>
      <div class="ogrenci">
        <img src="../img/pp.jpg" alt="" />
        <span><%=session("aad")%>&nbsp;<%=session("asoyad")%></span>
        <i class="fas fa-arrow-down"></i>
        <div class="dropdown-menu">
          <a href="cikis.asp"><i class="fas fa-sign-out-alt"></i>ÇIKIŞ</a>
        </div>
      </div>
    </header>
    <div class="main">
      <div class="menu">
        <ul>
          <li>
            <a href="akademik_anasayfa.asp" target="ifrm"><i class="fas fa-home"></i>ANASAYFA</a>
          </li>
          <li>
            <a href="sinavlarim.asp" target="ifrm"><i class="fas fa-bullhorn"></i>SINAVLARIM</a>
          </li>
          <li>
            <a href="sinav_olustur.asp" target="ifrm"><i class="fas fa-bullhorn"></i>SINAV OLUŞTUR</a>
          </li>
        </ul>
      </div>
      <div class="content">
        <iframe
          src="akademik_anasayfa.asp"
          name="ifrm"
          frameborder="0"
          width="100%"
          height="100%"
        ></iframe>
      </div>
    </div>
  </body>
</html>
