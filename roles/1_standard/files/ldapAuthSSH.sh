#!/bin/sh

uid=$1
host={{ domain_name }}
port=389
baseDN="{{ opendj_context }}"
bindDN="cn=ssh,ou=services,{{ opendj_context }}"
bindPWDfile=~/.pwd

ldapsearch \
  -h $host \
  -p $port \
  -b $baseDN \
  -s sub \
  -D $bindDN \
  -y $bindPWDfile \
  "(&(objectclass=posixAccount)(uid=$uid))" \
  sshPublicKey | sed -n '/^ /{H;d};/sshPublicKey:/x;$g;s/\n *//g;s/sshPublicKey: //gp'

