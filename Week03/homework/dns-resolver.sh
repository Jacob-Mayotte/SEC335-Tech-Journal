#!/bin/bash

targethost=$1 # set variables
dnsserver=$2

for i in {1..254}; do # for loop to go through the last octet of ipaddr
	ipaddr=${targethost}.${i} # define ipaddr by adding targethost + what the for loop is parsing though on last octet
	nslookup $ipaddr $dnsserver 2>&1 | grep "name"
done
