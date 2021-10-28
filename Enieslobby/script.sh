echo "nameserver 192.168.122.1"

apt-get update
apt-get install bind9 -y

mkdir /etc/bind/kaizoku

cp /etc/bind/db.local  /etc/bind/kaizoku/franky.E03.com

# named.conf.local ------------------------------------------------------
echo '
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

zone "franky.E03.com" {
    type master;
    file "/etc/bind/kaizoku/franky.E03.com";
    allow-transfer { 192.201.2.3; };
    also-notify { 192.201.2.3; };
    notify yes;
};

zone "2.201.192.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.201.192.in-addr.arpa";
};' 
    > /etc/bind/kaizoku/franky.E03.com

# named.conf.options --------------------------------------------
echo '
options {
	directory "/var/cache/bind";

	// If there is a firewall between you and nameservers you want
	// to talk to, you may need to fix the firewall to allow multiple
	// ports to talk.  See http://www.kb.cert.org/vuls/id/800113

	// If your ISP provided one or more IP addresses for stable 
	// nameservers, you probably want to use them as forwarders.  
	// Uncomment the following block, and insert the addresses replacing 

	// forwarders {
	// 	0.0.0.0;
	// };

	//========================================================================
	// If BIND logs error messages about the root key being expired,
	// you will need to update your keys.  See https://www.isc.org/bind-keys
	//========================================================================
	// dnssec-validation auto;
	allow-query{any;};	

	auth-nxdomain no;    # conform to RFC1035
	listen-on-v6 { any; };
};' 
    > /etc/bind/named.conf.options


#franky -----------------------------------------
echo '
;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	franky.E03.com. root.franky.E03.com. (
		     	4		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	franky.E03.com.
@	IN	A	192.201.2.21
www	IN	CNAME	franky.E03.com. 
super	IN	A	192.201.2.21
www.super IN 	CNAME 	super.franky.E03.com.
mecha 	IN	NS	ns1' 
        > /etc/bind/kaizoku/franky.E03.com

#2.201.192.in-addr.arpa --------------------------------------------
cp /etc/bind/db.local  /etc/bind/kaizoku/2.201.192.in-addr.arpa
echo '
;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	franky.E03.com. root.franky.E03.com. (
			2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419201		; Expire
			 604800 )	; Negative Cache TTL
;
2.201.192.in-addr.arpa. IN	NS	franky.E03.com.
2			            IN	PTR	franky.E03.com.
' > /etc/bind/kaizoku/2.201.192.in-addr.arpa


service bind9 restart
