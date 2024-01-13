#!/bin/bash

# /etc/hosts
chmod a+r /etc/hosts

# Update SNMP config /cat-touch
sudo apt-get update
sudo apt-get -y install snmp snmp-mibs-downloader snmptrapd unzip
sudo download-mibs

#How to fix net-snmp / snmpwalk errors #https://docs.linuxconsulting.mn.it/notes/net-snmp-errors #https://serverfault.com/questions/936119/snmp-mibs-on-ubuntu-error-in-mibs
sudo wget http://www.iana.org/assignments/ianaippmmetricsregistry-mib/ianaippmmetricsregistry-mib -O /usr/share/mibs/iana/IANA-IPPM-METRICS-REGISTRY-MIB
sudo wget http://pastebin.com/raw.php?i=p3QyuXzZ -O /usr/share/mibs/ietf/SNMPv2-PDU
sudo wget http://pastebin.com/raw.php?i=gG7j8nyk -O /usr/share/mibs/ietf/IPATM-IPMC-MIB

# To have the new MIBs recognized by net-snmp
cat > /etc/snmp/snmp.conf <<EOD
mibs +ALL
EOD