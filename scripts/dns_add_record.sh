#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "Run this script as root"
	exit 1
fi


if [ -z "${t}" ]; then
	TYPE="A"
	HOST=$1
	IP=$2
	DOMAIN=$3
fi

while getopts t: o; do
    case "${o}" in
        t)
            TYPE=${OPTARG}
	    if [[ ! $TYPE =~ (A|MX|CNAME) ]]; then 
		{ echo "Wrong record type"; exit 1; }
	    fi
            ;;
    esac
done




echo $TYPE;
echo $1;
echo $2;
