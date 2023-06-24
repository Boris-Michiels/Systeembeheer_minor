#!/bin/bash

if [ $EUID -ne 0 ]; then
        echo "Run this script as root"
        exit 1
fi

VHOST=$(echo "$1" | cut -d "." -f1)
SUBDOMAIN=$(echo "$1" | cut -d "." -f2)
DBFILE="db.$SUBDOMAIN.boris-michiels.sb.uclllabs.be"

echo $VHOST
echo $SUBDOMAIN
