;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns.boris-michiels.sb.uclllabs.be. borismichiels.gmail.be. (
			      8		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.boris-michiels.sb.uclllabs.be.
@	IN	NS	ns1.uclllabs.be.
@	IN	NS	ns2.uclllabs.be.
@	IN	A	193.191.177.138
ns	IN	A	193.191.177.138

www     IN      A       193.191.177.138
www1	IN	A	193.191.177.138

test	IN	A	193.191.177.254
