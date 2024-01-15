<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        table {
            margin: 20px auto;
            background-color: #ffffff;
            border-collapse: collapse;
            border: 1px solid #cccccc;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 10px;
        }

        input[type="password"] {
            padding: 8px;
            width: 250px;
            border: 1px solid #cccccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <table>
        <% ogrenci_no=Request.querystring("ogrenci_no")
      
        %>

        <form action="sifre_degis_update_1.asp" method="post" onsubmit="return validateForm()">
            <input type="hidden" value="<%=ogrenci_no%>" name="ogrenci_no">
            <tr>
                <td>Yeni Şifre Giriniz</td>
                <td><input type="password" id="yeni_sifre" name="yeni_sifre" required></td>
            </tr>
            <tr>
                <td>Yeni Şifre Tekrar Giriniz</td>
                <td><input type="password" id="yeni_sifre_tekrar" name="yeni_sifre_tekrar" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Şifreyi Değiştir"></td>
            </tr>
        </form>
    </table>

    <script>
        function validateForm() {
            var yeniSifre = document.getElementById('yeni_sifre').value;
            var yeniSifreTekrar = document.getElementById('yeni_sifre_tekrar').value;

            if (yeniSifre !== yeniSifreTekrar) {
                alert('Şifreler uyuşmuyor. Lütfen tekrar deneyin.');
                return false; // Formun gönderilmesini engeller
            }
            
            // Şifreler uyuşuyor, formu gönder
            return true;
        }
    </script>
    
</body>
</html>
