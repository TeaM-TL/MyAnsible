# MyAnsible
My ansible roles and playbooks

---

## OpenDJ - LDAP Directory Server
- opendj - install OpenDJ
- opendj_replica - setup replication between OpenDJ servers
- opendj_upgrade - upgrade OpenDJ server
- opendj_keepalived - flying IP for OpenDJ

## EasyRSA - own PKI CA
- pki_easyrsa - only installation, without *init-pki* or *build-ca*

## HA
- ha_keepalived - flying IP, highly parametrized, ready for more services
- ha_cluster - cluster

---

## Apache
- apache - install Apache web server with HTTPS
- apache_cluster - pacemaker cluster for Apache

## MariaDB
- mariadb - install multimaster cluster MariaDB
- mariadb_keepalived - flying IP for MariaDB

## SSH
- ssh_ldap - a ssh key from LDAP directory

## Cockpit
- cockpit - own certificate for https connection

---

