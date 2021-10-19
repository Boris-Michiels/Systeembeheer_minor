#!/bin/bash

rsync -a --delete -e 'ssh -p 22345' /etc r0760222@leia.uclllabs.be:/home/LDAP/r0760222/sysbeh/backup/
