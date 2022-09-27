#!/bin/bash

ssh -p 22345 r0760222@leia.uclllabs.be 'mkdir -p /home/LDAP/r0760222/sysbeh/backup/' && rsync -a -e 'ssh -p 22345' /etc r0760222@leia.uclllabs.be:/home/LDAP/r0760222/sysbeh/backup/
