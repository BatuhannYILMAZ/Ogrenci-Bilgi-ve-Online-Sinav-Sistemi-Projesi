<!DOCTYPE html>
<html lang="en">
<head>
    <%
    Response.CodePage = 65001
    Response.Charset = "UTF-8" %>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="obs.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <title>Öğrenci Bilgi Sistemi</title>
</head>

<body>
    
    <div class="banner">
        <div class="logo">
         <a href="anasayfa.asp" target="ifrm"> <img src="../img/logo.png" alt="Okul Logosu" ></a>
        </div>
        <div class="ogrenci-bilgileri">
                    <button class="mesage-button"><i class="fa-regular fa-envelope"></i></button>
                    <img src="../img/pp.jpg" class="user-pic" onclick="toggleMenu()" >
                <div class="sub-menu-wrap" id="subMenu">
                    <div class="sub-menu">
                        <div class="uer-info">
                            <img src="../img/pp.jpg" alt="">
                            <h2><%=session("ogrenci_ad")%>&nbsp;<%=session("ogrenci_soyad")%></h2>
                        </div>
                        <hr>
                            
                            <a href="cikis.asp" class="sub-menu-link">
                                <i class="fa-solid fa-right-from-bracket"></i>
                                <p>Çıkış</p>
                                <span>></span>
                            </a>

                    </div>
                </div>

                <script>

                    let subMenu=document.getElementById("subMenu");
                    function toggleMenu(){
                        subMenu.classList.toggle("open-menu");

                    }
                </script>

            <span class="ogrenci-no"><%=session("ogrenci_no")%></span>
        </div>
      </div>
    </div>





    <div class="main"> 
        <div class="navbar"> 
            <div class="profil"> 
                <img src="../img/pp.jpg" alt="">
            </div>
            <div class="bilgi">
                <ul>
                    <li><%=session("ogrenci_ad")%>&nbsp;<%=session("ogrenci_soyad")%></li>
                    <li><%=session("ogrenci_no")%></li>
                </ul>
            </div>
            <div class="menu">
            <ul > 
                <li> <a href="anasayfa.asp" target="ifrm"><i class="fa-solid fa-house"></i> ANASAYFA</a></li>
                <li> <a href="#"><i class="fa-regular fa-calendar-days"></i> GENEL İŞLEMLER <i class="fa-solid fa-arrow-down-short-wide"></i></a>
                <ul>
                        <li><a href="akademik_takvim.html" target="ifrm">Akademik Takvim</a></li>
                        <li><a href="danisman.asp" target="ifrm">danışman Bilgisi</a></li>
                        <li><a href="alinan_dersler.asp" target="ifrm">Alınan derler</a></li>
                    </ul>
                </li>   
                <li> <a href="#"> <i class="fa-solid fa-pen"></i> DERS VE DÖNEM İŞLEMLERİ <i class="fa-solid fa-arrow-down-short-wide"></i></a>
                   <ul>
                        <li><a href="donem_ort.asp" target="ifrm">Dönem Ortalaması</a></li>
                        <li><a href="o_not_listesi.asp" target="ifrm">Not listesi</a></li>
                    </ul>
                </li>
                <li><a href="#"> <i class="fa-solid fa-id-card"></i> KULLANICI İŞLEMLERİ <i class="fa-solid fa-arrow-down-short-wide"></i></a>
                    <ul>
                      <li><a href="sifre_degis.asp" target="ifrm">şifre degistirme</a></li>
                    </ul>
                </li>
           </ul> 
        </div>
        </div>
        <div class="content">
            <iframe src="anasayfa.asp" name="ifrm" frameborder="0" width="1618px" height="881px" style="border:1px solid black;"></iframe>
        </div>
    </div>
   
</body>
</html>