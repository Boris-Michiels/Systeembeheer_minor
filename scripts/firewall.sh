#!/bin/bash

start () {
	iptables-restore < /etc/iptables/rules.v4
	ip6tables-restore < /etc/iptables/rules.v6
}

stop () {
	iptables -F
	iptables -X
	ip6tables -F
	ip6tables -X
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
