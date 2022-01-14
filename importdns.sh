#!/bin/sh

#Overwriting the custom.list file with imported Windows DNS entries
cat /home/dnscopy/custom.list > /etc/pihole/custom.list

#Restart the Pihole DNS service
pihole restartdns