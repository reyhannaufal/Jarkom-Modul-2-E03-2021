# Jarkom Modul 2 E03 2021
Daftar Kelompok:
1. Reyhan Naufal Rahman - 05111940000171
2. Vicky Thirdian - 05111940000211
3. Fiodhy Ardito Narawangsa - 05111940000218

## Soal dan Pembahasan
1. EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet
  ```
  base
  ```
2. Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses franky.yyy.com dengan alias www.franky.yyy.com pada folder kaizoku
  ```
  base
  ```
3. Setelah itu buat subdomain super.franky.yyy.com dengan alias www.super.franky.yyy.com yang diatur DNS nya di EniesLobby dan mengarah ke Skypie
  ```
  base
  ```
4. Buat juga reverse domain untuk domain utama
  ```
  base
  ```
5. Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama
  ```
  base
  ```
6. EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama (5). Setelah itu terdapat subdomain mecha.franky.yyy.com dengan alias www.mecha.franky.yyy.com yang didelegasikan dari EniesLobby ke Water7 dengan IP menuju ke Skypie dalam folder sunnygo
 ```
  base
 ```
7.  Untuk memperlancar komunikasi Luffy dan rekannya, dibuatkan subdomain melalui Water7 dengan nama general.mecha.franky.yyy.com dengan alias www.general.mecha.franky.yyy.com yang mengarah ke Skypie
  ```
  base
  ```
8. Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver www.franky.yyy.com. Pertama, luffy membutuhkan webserver dengan DocumentRoot pada /var/www/franky.yyy.com.
  ```
  base
  ```
9. Setelah itu, Luffy juga membutuhkan agar url www.franky.yyy.com/index.php/home dapat menjadi menjadi www.franky.yyy.com/home. 

  ```
  base
  ```
10.  Setelah itu, pada subdomain www.super.franky.yyy.com, Luffy membutuhkan penyimpanan aset yang memiliki DocumentRoot pada /var/www/super.franky.yyy.com
  ```
  base
  ```
11. Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja.
  ```
  base
  ```
12.Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /error untuk mengganti error kode pada apache . 
  ```
  base
  ```
13. Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset www.super.franky.yyy.com/public/js menjadi www.super.franky.yyy.com/js. 

  ```
  base
  ```
14. Dan Luffy meminta untuk web www.general.mecha.franky.yyy.com hanya bisa diakses dengan port 15000 dan port 15500
  ```
  Listen 80
  Listen 15000
  Listen 15500
  
  <IfModule ssl_module>
    Listen 443
  <IfModule>
  
  <IfModule mod_gnutls.c>
    Listen 443
  <IfModule>
  ```
![image](https://user-images.githubusercontent.com/59334824/139519281-9a87e428-6aea-4c7a-9fe3-90a279f9f2dc.png)

15. dengan autentikasi username luffy dan password onepiece dan file di /var/www/general.mecha.franky.yyy
 ```
  luffy:$2y$10$mePXsiF4FlxFbLAXj7h1Bu2bJbOcuZhypOIQbA/ZEGspby6EznL0G
 ```
![image](https://user-images.githubusercontent.com/59334824/139519289-e21358b4-51a5-420b-ad9b-f9a8a0902d12.png)
![image](https://user-images.githubusercontent.com/59334824/139519300-98e37dfa-2d0d-4600-beb9-71f66678e872.png)

16. Dan setiap kali mengakses IP Skypie akan dialihkan secara otomatis ke www.franky.yyy.com
 ![messageImage_1635565295845](https://user-images.githubusercontent.com/59334824/139519256-5b255200-c716-43a5-816d-e9d6cda99d30.jpg)
 ![image](https://user-images.githubusercontent.com/59334824/139519263-0332a5c7-4dfd-4f2d-8daa-f34743e4e029.png)

17. Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website www.super.franky.yyy.com, dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring “franky” akan diarahkan menuju franky.png. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!
  ```
  RewriteEngine On
  RewriteBase /var/www/super.franky.E03.com/public/images/
  RewriteCond %{ REQUEST_FILENAME} !franky.png
  RewriteRule (.*)franky(.*) http://super.franky.E03.com/public/images/franky.png
  ```
![image](https://user-images.githubusercontent.com/59334824/139519238-824d9abc-bd44-44b1-8f0b-faf853b7b43b.png)
![messageImage_1635565436495](https://user-images.githubusercontent.com/59334824/139519243-7cfdba72-c2d3-47f6-824b-2293e9b42958.jpg)
