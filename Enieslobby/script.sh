echo "nameserver 192.168.122.1"

apt-get update
apt-get install bind9 -y

mkdir /etc/bind/db.local /etc/bind/kaizoku/franky.E03.com

$conf_name = "
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";


zone "franky.e01.com" {
    type master;
    file "/etc/bind/kaizoku/franky.e01.com";
    allow-transfer { 192.200.2.3; }; // Masukan IP Water7 tanpa tanda petik
    // bikin jadi slave
    also-notify { 192.200.2.3; };
    notify yes;
};

zone "2.200.192.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.200.192.in-addr.arpa";
};
"

$name >> /etc/bind/kaizoku/franky.E03.com

service bind9 restart

cp /etc/bind/db.local  /etc/bind/kaizoku/2.201.192.in-addr.arpa