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
  base
  ```
15. dengan autentikasi username luffy dan password onepiece dan file di /var/www/general.mecha.franky.yyy
  ```
  base
  ```
16. Dan setiap kali mengakses IP Skypie akan dialihkan secara otomatis ke www.franky.yyy.com 
  ```
  base
  ```
17. Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website www.super.franky.yyy.com, dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring “franky” akan diarahkan menuju franky.png. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!


  ```
  base
  ```
