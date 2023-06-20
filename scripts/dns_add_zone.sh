#!/bin/bash

if [ $EUID -ne 0 ]; then
        echo "Run this script as root"
        exit 1
fi

if [ $# -ne 1 ]; then
	echo "Supply a zone name to add"
	exit 1
fi

echo "zone \"$1.boris-michiels.sb.uclllabs.be\" {
     type master;
     file \"/etc/bind/zones/db.$1\";
};

" >> /etc/bind/named.conf.mrt-zones

mkdir -p /etc/bind/zones
touch /etc/bind/zones/db.$1

echo "\$TTL	604800
@	IN	SOA	ns.$1.boris-michiels.sb.uclllabs.be. r0760222.ucll.be. (
			      1		; Serial
			  10800		; Refresh
			   3600		; Retry
			2419200		; Expire
			 604800	)	; Negative Cache TTL
;
@	IN	NS	ns.boris-michiels.sb.uclllabs.be.

ns	IN	A	193.191.177.134" > /etc/bind/zones/db.$1

echo "$1	IN	NS	ns.boris-michiels.sb.uclllabs.be." >> /etc/bind/db.boris-michiels.sb.uclllabs.be

originalSerial=$(grep -Po '\d+\s+; Serial' "/etc/bind/db.boris-michiels.sb.uclllabs.be" | cut -f1)
updatedSerial=$(("$originalSerial" + 1))
sed -i "0,/$originalSerial/{s/$originalSerial/$updatedSerial/}" "/etc/bind/db.boris-michiels.sb.uclllabs.be"

rndc reload
#systemctl restart named
