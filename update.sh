#!/bin/bash

git checkout etc/casper/config.toml
git pull

echo "[network] 
public_address='$(dig @ns1-1.akamaitech.net ANY whoami.akamai.net +short):34553'" | crudini --merge etc/casper/config.toml
echo "[node] 
trusted_hash='57c5101a76a7eefd6031b2d79b52b970fb0bb99f3aa1d0c15af373e571a8a386'" | crudini --merge etc/casper/config.toml

docker-compose up -d --build --force-recreate
