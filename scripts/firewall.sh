#!/bin/bash

start () {
	iptables-restore < /etc/iptables/rules.v4
	ip6tables-restore < /etc/iptables/rules.v6

	sysctl -w net.ipv4.ip_forward=0
	sysctl -w net.ipv6.conf.all.forwarding=0
	sysctl -w net.ipv4.tcp_syncookies=1
}

stop () {
	iptables -F
	iptables -X
	iptables -P INPUT ACCEPT
	iptables -P FORWARD ACCEPT
	iptables -P OUTPUT ACCEPT
	ip6tables -F
	ip6tables -X
	ip6tables -P INPUT ACCEPT
	ip6tables -P INPUT ACCEPT
	ip6tables -P FORWARD ACCEPT
	ip6tables -P OUTPUT ACCEPT
}

case "$1" in
    start|restart)
        stop
	start
        ;;
    stop)
        stop
        ;;
esac
exit 0
