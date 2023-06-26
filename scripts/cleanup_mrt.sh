#!/bin/bash

sed -i '/^subzone/d' /etc/bind/db.boris-michiels.sb.uclllabs.be
cat /etc/bind/db.boris-michiels.sb.uclllabs.be > /etc/bind/db.boris-michiels.sb.uclllabs.be.back
rm -r /etc/bind/zones
echo "" > named.conf.mrt-zones

rm /etc/apache2/sites-enabled/mrt.*
rm /etc/apache2/sites-available/mrt.*

echo "Cleaning successful";
