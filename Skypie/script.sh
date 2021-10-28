echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update

apt-get install nano
apt-get install apache2 -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y
apt-get install git
git clone https://github.com/FeinardSlim/Praktikum-Modul-2-Jarkom.git

apt-get install unzip
mv general.mecha.franky.zip /var/www/
mv super.franky.zip /var/www/
mv franky.zip /var/www/

unzip /var/www/franky.zip
unzip /var/www/super.franky.zip
unzip /var/www/general.mecha.franky.zip

mv /var/www/franky /var/www/franky.E03.com
mv /var/www/super.franky /var/www/super.franky.E03.com
mv /var/www/general.mecha.franky /var/www/general.mecha.franky.E03.com