;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns.boris-michiels.sb.uclllabs.be. r0760222.ucll.be. (
			    109		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.boris-michiels.sb.uclllabs.be.
ns	IN	A	193.191.177.134
@	IN	NS	ns1.uclllabs.be.
@	IN	NS	ns2.uclllabs.be.
@	IN	NS	brick-vanroekel.sb.uclllabs.be.

www	IN	A	193.191.177.134
test	IN	A	193.191.177.254



