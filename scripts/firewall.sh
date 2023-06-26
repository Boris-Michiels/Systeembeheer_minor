#!/bin/bash

start () {
	iptables-restore < /etc/iptables/rules.v4
	ip6tables-restore < /etc/iptables/rules.v6
}

stop () {
	iptables-save > /etc/iptables/rules.v4
	ip6tables-save > /etc/iptables/rules.v6
	iptables -F
	iptables -X
	iptables -P INPUT   ACCEPT
	iptables -P FORWARD ACCEPT
	iptables -P OUTPUT  ACCEPT
	ip6tables -F
	ip6tables -X
	ip6tables -P INPUT   ACCEPT
	ip6tables -P FORWARD ACCEPT
	ip6tables -P OUTPUT  ACCEPT
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
esac
exit 0
