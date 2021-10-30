# Jarkom Modul 2 E03 2021

Daftar Kelompok:

1. Reyhan Naufal Rahman - 05111940000171
2. Vicky Thirdian - 05111940000211
3. Fiodhy Ardito Narawangsa - 05111940000218

## Soal dan Pembahasan

1. EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet

Dibuat topologi sebagai berikut
![image](https://user-images.githubusercontent.com/73778173/139527903-a3fe9724-5f2c-4cb1-8823-059e861aa303.png)

dengan konfigurasi dari masing-masing node sebagai berikut

Foosha

```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.201.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.201.2.1
	netmask 255.255.255.0

```

Loguetown

```
auto eth0
iface eth0 inet static
	address 192.201.1.2
	netmask 255.255.255.0
	gateway 192.201.1.1
```

Alabasta

```
auto eth0
iface eth0 inet static
	address 192.201.1.3
	netmask 255.255.255.0
	gateway 192.201.1.1

```

EniesLobby

```
auto eth0
iface eth0 inet static
	address 192.201.2.2
	netmask 255.255.255.0
	gateway 192.201.2.1
```

Water7

```
auto eth0
iface eth0 inet static
	address 192.201.2.3
	netmask 255.255.255.0
	gateway 192.201.2.1

```

Skypie

```
auto eth0
iface eth0 inet static
	address 192.201.2.21
	netmask 255.255.255.0
	gateway 192.201.2.1
```

2. Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses franky.yyy.com dengan alias www.franky.yyy.com pada folder kaizoku

Pertama untuk konfigurasi di node EniesLobby sebagai berikut

```
zone "franky.E03.com" {
      type master;
      file "/etc/bind/kaizoku/franky.E03.com";
};
```

lalu melakukan konfigurasi pada file `franky.E03.com` dengan konfigurasi sebagai berikut
![image](https://user-images.githubusercontent.com/73778173/139528843-099dbe03-6b71-4718-9128-173a865c01e2.png)

Kemudian setting nameserver pada client mengarah ke EniesLobby
![image](https://user-images.githubusercontent.com/73778173/139528912-9cb3eaf1-1ee7-4a84-9a08-637499e7fd6b.png)

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

   Pertama aktifkan module rewrite dengan cara `a2enmod rewrite`. Setelah itu, edit file `franky.E03.com.conf` pada folder `/etc/apache2/sites-available` seperti berikut

   ![image](https://user-images.githubusercontent.com/54606856/139532114-4a763d2e-3a09-4af8-8fb8-24855392e433.png)

   Lakukan `service apache2 restart` pada skypie. Setelah itu buka `www.franky.E03.com/home` pada salah satu client.

   ![image](https://user-images.githubusercontent.com/54606856/139532186-c7769f59-22a2-4703-a471-176d656aacf3.png)

10. Setelah itu, pada subdomain www.super.franky.yyy.com, Luffy membutuhkan penyimpanan aset yang memiliki DocumentRoot pada /var/www/super.franky.yyy.com

    Pertama masuk ke folder `/var/www`. Buat folder baru yaitu `super.franky.E03.com` yang berisikan hasil extract dari super.franky.zip yang sudah di git clone sebelumnya. Lalu buat file konfigurasi baru dengan cara melakukan copy pada file `000-default.conf` menjadi `super.franky.E03.com.conf` yang berisikan

```
      ServerAdmin webmaster@localhost
      DocumentRoot /var/www/super.franky.E03.com
      ServerName super.franky.E03.com
      ServerAlias www.super.franky.E03.com
```

Setelah itu aktifkan konfigurasi tersebut dengan cara `a2ensite super.franky.E03.com.conf` dan lakukan `service apache2 restart`. Lalu lakukan `lynx www.super.franky.E03com` pada salah satu client.

![image](https://user-images.githubusercontent.com/54606856/139534589-e20f3491-a2ae-4a92-8735-adacef2889ad.png)

11. Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja.

    Edit file `super.franky.E03.com.conf` yang terletak di `/etc/apache2/sites-available` dengan menambahkan

```
      <Directory /var/www/super.franky.E03.com/public>
              Options +Indexes
      </Directory>
```

Lakukan `service apache2 restart`. Lalu buka `www.super.franky.E03.com` pada salah satu client.

![image](https://user-images.githubusercontent.com/54606856/139535217-364d5cb8-2325-4d08-ae18-9e349145ea7e.png)

12. Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /error untuk mengganti error kode pada apache .

    Edit file `super.franky.E03.com.conf` di folder `etc/apache2/sites-available` dengan menambahkan beberapa code seperti berikut

```
      ErrorDocument 404 /error/404.html
```

Lakukan `service apache2 restart`. Lalu buka `www.super.franky.E03.com/c` pada salah satu client.
![image](https://user-images.githubusercontent.com/54606856/139535623-df18afae-3bbc-4860-8be7-f3297d264f63.png)

13. Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset www.super.franky.yyy.com/public/js menjadi www.super.franky.yyy.com/js.

    Edit file `super.franky.E03.com.conf` di folder `etc/apache2/sites-available` dengan menambahkan beberapa code seperti berikut

```
    Alias "/js" "/var/www/super.franky.E03.com/public/js"
```

Lakukan `service apache2 restart`. Lalu buka `www.super.franky.E03.com/js` pada salah satu client.
![image](https://user-images.githubusercontent.com/54606856/139536208-54bd9cf1-8320-4c3e-952f-93615848a15d.png)

14. Dan Luffy meminta untuk web www.general.mecha.franky.yyy.com hanya bisa diakses dengan port 15000 dan port 15500

    Buka file `ports.conf` dan gunakan settingan dibawah jika hanya dapat diakses menggunakan port 15000 dan 15500

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

    Tambahkan konfigurasi `.htpasswd` di `/etc/apache2/` menggunakan config dibawah dengan format `username:password` dengan decrypt

```
 luffy:$2y$10$mePXsiF4FlxFbLAXj7h1Bu2bJbOcuZhypOIQbA/ZEGspby6EznL0G
```

    Setelah itu tambahkan konfigurai pada `mecha.franky.E03.com.conf` dengan config berikut supaya dapat mengattach `.htpasswd`

```
<Directory "var/www/general.mecha.franky.E03.com">
	AuthType Basic
	AuthName "Restricted Content"
	AuthUserFile /etc/apache2/.htpasswd
	Require valid-user
</Directory>
```

![image](https://user-images.githubusercontent.com/59334824/139519289-e21358b4-51a5-420b-ad9b-f9a8a0902d12.png)
![image](https://user-images.githubusercontent.com/59334824/139519300-98e37dfa-2d0d-4600-beb9-71f66678e872.png)

16. Dan setiap kali mengakses IP Skypie akan dialihkan secara otomatis ke www.franky.yyy.com
    Tambahkan config sebagai berikut

```
Redirect / http://www.franky.E03.com/
```

![messageImage_1635565295845](https://user-images.githubusercontent.com/59334824/139519256-5b255200-c716-43a5-816d-e9d6cda99d30.jpg)
![image](https://user-images.githubusercontent.com/59334824/139519263-0332a5c7-4dfd-4f2d-8daa-f34743e4e029.png)

17. Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website www.super.franky.yyy.com, dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring “franky” akan diarahkan menuju franky.png. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!

Untuk setiap query image yang ada maka alihkan, url tersebut pada franky.png

```
RewriteEngine On
RewriteBase /var/www/super.franky.E03.com/public/images/
RewriteCond %{ REQUEST_FILENAME} !franky.png
RewriteRule (.*)franky(.*) http://super.franky.E03.com/public/images/franky.png
```

![image](https://user-images.githubusercontent.com/59334824/139519238-824d9abc-bd44-44b1-8f0b-faf853b7b43b.png)
![messageImage_1635565436495](https://user-images.githubusercontent.com/59334824/139519243-7cfdba72-c2d3-47f6-824b-2293e9b42958.jpg)
