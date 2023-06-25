#!/bin/bash

certbot -d boris-michiels.sb.uclllabs.be -d secure.boris-michiels.sb.uclllabs.be -d supersecure.boris-michiels.sb.uclllabs.be --manual --preferred-challenges dns certonly --renew-by-default
