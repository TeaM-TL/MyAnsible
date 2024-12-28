#!/bin/bash
# 2024 Tomasz Łuczak, inspired by https://github.com/enix/x509-certificate-exporter
# metrics for node_exporter for certificates expiration of services
VER=1.0.0
set -o nounset -o pipefail

X509_HOST=$HOSTNAME
X509_PORTS="443 636"
X509_PORTS=443
X509_PROM_FILE=/var/local/exporter/x509
if [ -e x509_4node_exporter.conf ]; then
    source x509_4node_exporter.conf
fi

NOW=`date +%s`

for PORT in $X509_PORTS; do
    PROM_FILE=$X509_PROM_FILE-$PORT.prom
    CRT_INFO=`echo Q | openssl s_client -connect $X509_HOST:$PORT 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -f2 -d=`
    ERR=$?
    echo "x509_exporter_build_info{host=\"$X509_HOST\", port=\"$PORT\", version=\"$VER\"} 1" > $PROM_FILE
    echo "x509_timestamp{host=\"$X509_HOST\", port=\"$PORT\"} $NOW" >> $PROM_FILE
    if [ $ERR -eq 0 ] && [ ! -z "$CRT_INFO" ]; then
        READ_ERROR=0
        CERT_END=`date -d"$CRT_INFO" +%s`
        echo "x509_cert_not_after{host=\"$X509_HOST\", port=\"$PORT\"} $CERT_END" >> $PROM_FILE
        if [ $CERT_END -le $NOW ]; then
            EXPIRED=1
        else
            EXPIRED=0
        fi
        echo "x509_cert_expired{host=\"$X509_HOST\", port=\"$PORT\"} $EXPIRED" >> $PROM_FILE
    # x509_cert_not_before
    # x509_cert_expires_in_seconds (optional)
    # x509_cert_valid_since_seconds (optional)
    # x509_cert_error (optional)
    else
        READ_ERROR=1
    fi
    echo "x509_read_errors{host=\"$X509_HOST\", port=\"$PORT\"} $READ_ERROR" >> $PROM_FILE
done
