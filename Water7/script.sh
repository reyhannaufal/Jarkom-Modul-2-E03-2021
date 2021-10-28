echo "nameserver 192.168.122.1" > /etc/resolv.conf

apt-get update
apt-get install bind9 -y 
echo "# nameserver 192.168.122.1
nameserver 192.201.2.2
nameserver 192.201.2.3" > /etc/resolv.conf

mkdir /etc/bind/sunnygo
cp /etc/bind/db.local /etc/bind/sunnygo/mecha.franky.E03.com

#named.conf.local--------------------------------------------------
echo '
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

// SLAVE
zone "franky.E03.com" {
    type slave;
    masters { 192.201.2.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/franky.E03.com";
};

// DELEGASI 
zone "mecha.franky.E03.com" {
   type master;
   file "/etc/bind/sunnygo/mecha.franky.E03.com";
};
' > /etc/bind/named.conf.local



#mecha------------------------------------------------------
echo '
;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	mecha.franky.E03.com. root.mecha.franky.E03.com. (
		2021100401		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	        IN	NS	mecha.franky.E03.com.
@	        IN	A	192.201.2.21
www 	    IN	CNAME	mecha.franky.E03.com.	
general     IN 	A	192.201.2.21
www.general IN 	CNAME  	general.mecha.franky.E03.com.	
' > /etc/bind/sunnygo/mecha.franky.E03.com