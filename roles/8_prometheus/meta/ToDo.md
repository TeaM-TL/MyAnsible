# To Do

## dnsmasq
https://github.com/google/dnsmasq_exporter

```bash
apt-get install golang-go
cp ~/go/bin/dnsmasq_exporter /usr/local/bin/
vim /etc/systemd/system/dnsmasq_exporter.service
systemctl daemon-reload
systemctl restart dnsmasq_exporter
systemctl status dnsmasq_exporter
```
/var/local/exporter prometheus:prometheus
vim /etc/default/prometheus-node-exporter
ARGS="--collector.textfile.directory /var/local/exporter"

## wireguard

https://github.com/kbknapp/wireguard_exporter

grafana:
- install
- configure LDAP, create LDIF
cn=grafana,ou=services,dc=team-tl,dc=intranet
- insert dashboards

```bash
wget -q -O /usr/share/keyrings/grafana.key https://packages.grafana.com/gpg.key 
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list
apt-get update 
apt list | grep grafana
apt-get install grafana
vim /etc/grafana/grafana.ini`
vim /etc/grafana/ldap.toml
systemctl restart grafana-server 
systemctl status grafana-server
```
