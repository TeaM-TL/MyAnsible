# MyAnsible
My ansible roles and playbooks

---

## Ready

### OpenDJ - LDAP Directory Server
- opendj - install OpenDJ
- opendj_replica - setup replication between OpenDJ servers
- opendj_upgrade - upgrade OpenDJ server
- opendj_keepalived - flying IP for OpenDJ

### EasyRSA - own PKI CA
- pki_easyrsa - only installation, without *init-pki* or *build-ca*

### HA
- ha_keepalived - flying IP, highly parametrized, ready for more services

---

## To Do

### Apache
- apache - install Apache web server with HTTPS
- apache_cluster - pacemaker cluster for Apache

### Chronyd
- chronyd - time server and synchronize time

### Cockpit
- cockpit - own certificate for https connection

### Dnsmasq
- dnsmasq_dns - as DNS
- dnsmasq_dhcp - as DHCPd
- dnsmasq_cluster - pacemaker cluster

### HA
- ha_cluster - pacemaker cluster

### MariaDB
- mariadb - install multimaster cluster MariaDB
- mariadb_keepalived - flying IP for MariaDB

### OpenVPN
- openvpn_ldap

### Server
- server_minimal - typical configuration after installation
- server_kickstart - preparing unattende installation

### SSH
- ssh_ldap - a ssh key from LDAP directory

### Zabbix
- zabbix_client
- zabbix_server
- zabbix_opendj

---

