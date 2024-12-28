# Scripts

## Monitoring x509_4node_exporter.sh
inspired by: https://github.com/enix/x509-certificate-exporter

optional config file: x509_4node_exporter.conf
```bash
X509_HOST=$HOSTNAME
X509_PORTS="443 636"
X509_PROM_FILE=/var/local/exporter/x509
```
metrics
- x509_exporter_build_info
- x509_timestamp
- x509_cert_not_after
- x509_cert_expired
- x509_read_errors
