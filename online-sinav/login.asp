<%
    Response.CodePage = 65001
    Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Sınav Sistemi</title>
    <link rel="stylesheet" href="login.css">
	<script src="https://kit.fontawesome.com/e52ae652d9.js" crossorigin="anonymous"></script>
</head>
<body  >
	
    <div class="container">
		<img src="../img/logo.png" alt="logo" width="500px" height="100px">
		<h1>Online Sınav Sistemi</h1>

		<form action="login_kontrol.asp" method="post">
			<label>
				<label for="ogr" class="secim-ortala"><input type="radio" name="secim" value="1" id="ogr" checked="true"> <i class="fa-solid fa-book-open-reader"></i> Öğrenci</label>
				<label for="aka"><input type="radio" name="secim" value="2" id="aka"> <i class="fa-solid fa-school"></i> Akademisyen</label>
			</label>
			<label for="email">E-posta:</label>
			<input type="email" id="email" name="email" required>

			<label for="sifre">Şifre:</label>
			<input type="password" id="sifre" name="sifre" required>
	
			<a href="sifremi_unuttum.asp" class="sifre-unut">Şifremi Unuttum</a>
			
			<input type="submit" value="Giriş">

		</form>
	</div>

</body>
</html>