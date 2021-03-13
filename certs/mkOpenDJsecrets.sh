#!/bin/bash

IP=192.168.0.167
CERT=ldap167
PIN=M@ory51A

FULL=$CERT.team-tl.intranet
SAN="DNS:$FULL,DNS:$CERT,DNS:localhost,IP:$IP,IP:127.0.0.1"

CA=/etc/CA

echo "--- Preparation -"
echo "-- Remember password: $PIN --"
echo "-- PINs --"
echo "$PIN" > keystore.pin
cp keystore.pin truststore.pin
cp keystore.pin admin-keystore.pin
cp keystore.pin ads-keystore.pin
cp keystore.pin ads-truststore.pin

echo "-- Generate key pair in new keystore --"
keytool -genkeypair \
    -keyalg rsa \
    -alias "server-cert" \
    -dname "CN=$FULL" \
    -keystore keystore \
    -storepass `cat keystore.pin` \
    -storetype PKCS12

echo "-- Generate CSR --"
yes $PIN | keytool -certreq \
    -file $CERT.csr \
    -keystore keystore \
    -alias server-cert \
    -ext SAN=$SAN
mv $CERT.csr $CA/pki/reqs/$CERT.req

echo "--- CA -"

echo "-- Sign req by CA --"
cd $CA
yes yes |./easyrsa sign-req server $CERT
cd -

echo "--- Import certs into keystores -"
echo "--  keystore, truststore -"
cp $CA/pki/ca.crt .
cp $CA/pki/issued/$CERT.crt .

yes yes | keytool -import \
    -file ca.crt \
    -alias ca \
    -trustcacerts \
    -keystore keystore \
    -storepass `cat keystore.pin`

keytool -import \
    -file $CERT.crt \
    -alias "server-cert" \
    -keystore keystore \
    -storepass `cat truststore.pin`

yes yes | keytool -import \
    -file ca.crt \
    -alias ca \
    -trustcacerts \
    -keystore truststore \
    -storepass `cat keystore.pin`

keytool -import \
    -file $CERT.crt \
    -alias "server-cert" \
    -keystore truststore \
    -storepass `cat truststore.pin`


echo "-- admin-keystore, admin-truststore --"
cp keystore admin-keystore
keytool -changealias \
    -alias "server-cert" \
    -destalias "admin-cert" \
    -keystore admin-keystore \
    -storepass `cat admin-keystore.pin`

cp truststore admin-truststore
keytool -changealias \
    -alias "server-cert" \
    -destalias "admin-cert" \
    -keystore admin-truststore \
    -storepass `cat admin-keystore.pin`


echo "-- ads-keystore, ads-truststore --"
cp keystore ads-keystore
keytool -changealias \
    -alias "server-cert" \
    -destalias "ads-certificate" \
    -keystore ads-keystore \
    -storepass `cat ads-keystore.pin`

cp truststore ads-truststore
keytool -changealias \
    -alias "server-cert" \
    -destalias "ads-certificate" \
    -keystore  ads-truststore\
    -storepass `cat ads-truststore.pin`


echo "-- zipping --"
zip -m $CERT.zip *store*
chown `whoami` $CERT.zip

rm $CERT.crt
rm ca.crt

echo "--- Done -"

