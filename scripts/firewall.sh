#!/bin/bash

start () {
	iptables-restore < /etc/iptables/rules.v4
	ip6tables-restore < /etc/iptables/rules.v6
}

stop () {
	iptables -F
	iptables -X
	iptables -P INPUT ACCEPT
	ip6tables -F
	ip6tables -X
	ip6tables -P INPUT ACCEPT
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
