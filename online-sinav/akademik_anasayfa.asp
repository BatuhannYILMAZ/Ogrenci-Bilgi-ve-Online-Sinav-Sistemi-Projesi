<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Sınav Sistemi</title>
  <style>
    body {
      background-color: #fff;
      color: #000;
      font-family: Arial, sans-serif;
      margin: 0;
    }
    
    header {
      background-color: #fff;
      color: #000;
      padding: 20px;
      text-align: center;
    }
    
    h1 {
      font-size: 36px;
      animation: fadeIn 1s ease-in;
    }
    
    @keyframes fadeIn {
      0% { opacity: 0; }
      100% { opacity: 1; }
    }
    
    section {
      background-color: #fff;
      color:#000;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      text-align: center;
      animation: slideUp 1s ease-in-out;
    }
    
    @keyframes slideUp {
      0% { transform: translateY(50px); opacity: 0; }
      100% { transform: translateY(0); opacity: 1; }
    }
    
    h2 {
      font-size: 24px;
      animation: fadeIn 1s ease-in;
    }
    .content{
      height:510px
    }
    p {
      
      font-size: 16px;
      line-height: 1.5;
      animation: fadeIn 1s ease-in;
    }
    
    footer {
      background-color: #fff;
      color: #000;
      padding: 10px;
      text-align: center;
      animation: fadeIn 1s ease-in;
    }
  </style>
</head>
<body onload="showTime()">

  <script>
    function showTime() {
      var date = new Date();
      var hours = date.getHours();
      var minutes = date.getMinutes();
      var seconds = date.getSeconds();
      
      hours = formatTime(hours);
      minutes = formatTime(minutes);
      seconds = formatTime(seconds);
      
      var time = hours + ":" + minutes + ":" + seconds;
      
      document.getElementById("clock").innerHTML = time;
      
      setTimeout(showTime, 1000); // Her saniye güncelleme yapması için
    }
    
    function formatTime(time) {
      if (time < 10) {
        time = "0" + time; // Önünde 0 ekleme
      }
      return time;
    }
  </script>

  <header>
    <h1>Online Sınav Sistemi</h1>
  </header>
  
  <section>
    <h2>Hoş Geldiniz!</h2>
    <div id="clock"></div>
    <p>  <div class="content"> Online Sınav Sistemi'ne hoş geldin. </div></p>
  </section>
  
  <footer>
    <p>Telif Hakkı &copy; 2023 Online Sınav Sistemi</p>
  </footer>
</body>
</html>
