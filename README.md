# MyAnsible
My ansible roles and playbooks

---

## Ready

### Cockpit
- cockpit - install cockpit and add signed certificate for https connection

### Dnsmasq
- dnsmasq_dns - as DNS
- dnsmasq_dhcp - as DHCPd

### DUF - Disk Usage/Free Utility - a better 'df' alternative
- duf - download and install

### EasyRSA - own PKI CA
- pki_easyrsa - only installation, without *init-pki* or *build-ca*

### HA
- ha_keepalived - flying IP, highly parametrized, ready for more services

### OpenDJ - LDAP Directory Server
- opendj - install OpenDJ
- opendj_replica - setup replication between OpenDJ servers
- opendj_upgrade - upgrade OpenDJ server
- opendj_keepalived - flying IP for OpenDJ

---

## To Do

### Apache
- apache - install Apache web server with HTTPS
- apache_cluster - pacemaker cluster for Apache

### Chronyd
- chronyd - time server and synchronize time

### Dnsmasq
- dnsmasq_cluster - pacemaker cluster

### HA
- ha_cluster - pacemaker cluster

### MariaDB
- mariadb - install Galera cluster MariaDB (multimaster)
- mariadb_keepalived - flying IP for MariaDB

### OpenVPN
- openvpn_ldap

### Server
- server_minimal - typical configuration after installation
- server_kickstart - preparing unattende installation

### SSH
- ssh_ldap - a ssh key from LDAP directory

### Zabbix
- zabbix_server
- zabbix_server_cluster - pacemaker cluster
- zabbix_agent
- zabbix_agent_opendj - monitoring OpenDJ
- zabbix_agent_galera - monitoring MariaDB Galera Cluster

---

