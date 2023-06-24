#!/bin/bash

if [ $EUID -ne 0 ]; then
        echo "Run this script as root"
        exit 1
fi

VHOST=$(echo "$1" | cut -d "." -f1)
SUBDOMAIN=$(echo "$1" | cut -d "." -f2)
DBFILE="db.$SUBDOMAIN.boris-michiels.sb.uclllabs.be"

if [ ! -f "/etc/bind/zones/$DBFILE" ]; then
    echo "subdomain does not exist"
    exit 1
fi

mkdir -p /var/www/html/$SUBDOMAIN/$VHOST

echo "<VirtualHost *:80>
        ServerName $VHOST.$SUBDOMAIN.boris-michiels.sb.uclllabs.be
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html/$SUBDOMAIN/$VHOST
        ErrorLog ${APACHE_LOG_DIR}/$VHOST.$SUBDOMAIN-error.log
        CustomLog ${APACHE_LOG_DIR}/$VHOST.$SUBDOMAIN-access.log combined
</VirtualHost>" > /etc/apache2/sites-available/mrt.$VHOST.$SUBDOMAIN.conf

echo "welcome $VHOST.$SUBDOMAIN" > /var/www/html/$SUBDOMAIN/$VHOST/index.html

a2ensite mrt.$VHOST.$SUBDOMAIN.conf
systemctl reload apache2
