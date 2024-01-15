<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERB ÜNİVERSİTE</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://kit.fontawesome.com/e52ae652d9.js" crossorigin="anonymous">
        
    </script>

</head>

<body>
    <div class="deneme">
        <header class="main-header">
            <div id="main-nav" class="container">
                <a href="#" class="main-header__logo">ERB Üniversite</a>
                <nav class="main-nav">
                    <ul class="main-nav__items menu">
                        <li class="main-nav__item">
                            <a href="#">Okulumuz</a>
                            <ul>
                                <li>
                                    <a href="#">Misyon ve Vizyon</a>
                                </li>
                                <li>
                                    <a href="#">Tanıtım</a>
                                </li>
                                <li>
                                    <a href="#">Stratejik Plan</a>
                                </li>
                                <li>
                                    <a href="#">Fotoğraf Albümü</a>
                                </li>
                                <li>
                                    <a href="#">Rakamlarla Okulumuz</a>
                                </li>
                                <li>
                                    <a href="#">Projelerimiz</a>
                                </li>
                                <li>
                                    <a href="#">Bize Ulaşın</a>
                                </li>
                            </ul>
                        </li>
                        <li class="main-nav__item">
                            <a href="#">İdari</a>
                            <ul>
                                <li>
                                    <a href="#">Yönetim</a>
                                </li>
                                <li>
                                    <a href="#">Yönetim Kurulu</a>
                                </li>
                                <li>
                                    <a href="#">Yüksekokul Kurulu</a>
                                </li>
                                <li>
                                    <a href="#">İdari Personel</a>
                                </li>
                            </ul>
                        </li>
                        <li class="main-nav__item">
                            <a href="#">Bölümler</a>
                            <ul>
                                <li>
                                    <a href="#">Bilgisayar Teknolojileri Bölümü</a>
                                </li>

                                <li>
                                    <a href="#">Tasarım Bölümü</a>
                                </li>
                                <li>
                                    <a href="#">Muhasebe ve Vergi Bölümü</a>
                                </li>
                            </ul>
                        </li>
                        <li class="main-nav__item">
                            <a href="#">Öğrenci</a>
                            <ul>
                                <li>
                                    <a href="/login.asp">Öğrenci Bilgi Sistemi</a>
                                </li>
                                <li>
                                    <a href="#">Öğrenci Kulüpleri</a>
                                </li>
                                <li>
                                    <a href="#">Öğrenci Danışmanları</a>
                                </li>
                                <li>
                                    <a href="#">Değişim Programları</a>
                                </li>
                                <li>
                                    <a href="#">Uzaktan Eğitim</a>
                                </li>
                                <li>
                                    <a href="#">Üniversite Seçmeli Dersler</a>
                                </li>
                                <li>
                                    <a href="#">Staj</a>
                                </li>
                            </ul>
                        </li>
                        <li class="main-nav__item">
                            <a href="#">Program Kilavuzu</a>
                        </li>
                        <li class="main-nav__item">
                            <a href="#">İç Kontrol</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- IMAGE SLIDER START -->
        <div class="slider">
            <div class="slides">
                <!-- radio buttons start  -->
                <input type="radio" name="radio-btn" id="radio1">
                <input type="radio" name="radio-btn" id="radio2">
                <input type="radio" name="radio-btn" id="radio3">
                <input type="radio" name="radio-btn" id="radio4">
                <!-- radio buttons end  -->
                <!-- slide images start  -->
                <div class="slide first">
                    <img src="img/slider1.jpg" alt="">
                </div>
                <div class="slide">
                    <img src="img/slider2.jpg" alt="">
                </div>
                <div class="slide">
                    <img src="img/slider3.jpg" alt="">
                </div>
                <div class="slide">
                    <img src="img/as.jpg" alt="">
                </div>
                <!-- slide images end  -->
                <!-- automatic navigation start -->
                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                    <div class="auto-btn4"></div>
                </div>
                <!-- automatic navigation end -->
            </div>
            <!-- manual navigation start -->
            <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
                <label for="radio3" class="manual-btn"></label>
                <label for="radio4" class="manual-btn"></label>

            </div>
            <!-- manual navigation end -->

        </div>
        <!-- IMAGE SLIDER END -->
    </div>
    </div>
    <script>
        var counter = 1;
        setInterval(function () {
            document.getElementById('radio' + counter).checked = true;
            counter++;
            if (counter > 4) {
                counter = 1;
            }
        }, 5000);
    </script>

    <main>
        <section id="how-it-works">
            <div class="container2">
                <div class="row">
                    <div class="col-3">
                        <a href="online-sinav/login.asp"><i class="fa-solid fa-pencil"></i>
                            <p>Online Sınav Sistemi</p>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <a href="#"><i class="fa-solid fa-calendar-days"></i>
                            <p>Akademik Takvim</p>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <a href="sayfalar/login.asp"><i class="fa-solid fa-user-group"></i>
                            <p>Öğrenci Bilgi Sistemi</p>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <a href="#"><i class="fa-solid fa-info"></i>
                            <p>Ders Bilgi Sistemi</p>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <a href="#"><i class="fa-solid fa-book-journal-whills"></i>
                            <p>Mevzuat</p>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <a href="#"><i class="fa-solid fa-table-list"></i>
                            <p>Formlar</p>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="denemee">
            <p>Erbaa Meslek Yüksekokulu Müdürlüğü Gaziosmanpaşa Mh. Alişan Diktaş Cd. No:26 P.K: 60500 Erbaa/Tokat</p>
            <p>Tasarım: Batuhan Enes Ramazan Daire Başkanlığı [Web Grubu], 2018© Tüm Hakları Saklıdır.</p>
            <hr size="1px" color="black" />
        </div>
        <div class="wrapper">

            <!-- Facebook Icon -->
            <div class="icon fb">
                <i class="fa-brands fa-facebook-f"></i>
                <span>Facebook</span>
            </div>

            <!-- Twitter Icon -->
            <div class="icon twt">
                <i class="fa-brands fa-twitter"></i>
                <span>Twitter</span>
            </div>

            <!-- Linkedin Icon -->
            <div class="icon lnk">
                <i class="fa-brands fa-linkedin-in"></i>
                <span>Linkedin</span>
            </div>

            <!-- GitHub Icon -->
            <div class="icon git">
                <i class="fa-brands fa-github"></i>
                <span>GitHub</span>
            </div>

            <!-- YouTube Icon -->
            <div class="icon yt">
                <i class="fa-brands fa-youtube"></i>
                <span>YouTube</span>
            </div>
        </div>

    </footer>

</body>

</html>