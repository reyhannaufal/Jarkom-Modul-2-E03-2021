echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install dnsutils -y
apt-get install lynx -y

echo "# nameserver 192.168.122.1
nameserver 192.201.2.2
nameserver 192.201.2.3" > /etc/resolv.conf
