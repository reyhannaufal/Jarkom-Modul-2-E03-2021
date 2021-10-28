echo "nameserver 192.168.122.1" > /etc/resolv.conf

apt-get update
apt-get install bind9 -y 
echo "# nameserver 192.168.122.1
nameserver 192.201.2.2
nameserver 192.201.2.3" > /etc/resolv.conf

mkdir /etc/bind/sunnygo
cp /etc/bind/db.local /etc/bind/sunnygo/mecha.franky.E03.com
