#!/bin/bash

mkdir certs

sudo docker run --rm --name create_certs \
--user 0 \
--workdir /usr/share/elasticsearch \
-v $PWD/certs:/certs \
-v $PWD:/usr/share/elasticsearch/config/certificates \
docker.elastic.co/elasticsearch/elasticsearch:7.3.0 \
bash -c ' \
yum install -y -q -e 0 unzip; \
bin/elasticsearch-certutil cert --silent --pem --in config/certificates/instances.yml -out /certs/bundle.zip; \
unzip /certs/bundle.zip -d /certs; \
chown -R 1000:0 /certs; \
rm -f /certs/bundle.zip'
