# make and sign certificates

First make EasyRSA in /etc/CA

## keystores with certs for OpenDJ

- edit mkOpenDJsecrets
- run: sudo ./mkOpenDJsecrets
- move filename.zip to roles/opendj/files

## certs for Apache

- edit mkOpenDJsecrets
- run: sudo ./mkApacheCerts

