#!/bin/sh

set -e

TARGET=${TARGET:-"example.com:80"}
DNS_RESOLVER=${DNS_RESOLVER:-"8.8.8.8:53"}

# render the template with config
cp haproxy.cfg.tpl /usr/local/etc/haproxy/haproxy.cfg
sed -i "s/{{DNS_RESOLVER}}/$DNS_RESOLVER/" /usr/local/etc/haproxy/haproxy.cfg
sed -i "s/{{TARGET}}/$TARGET/" /usr/local/etc/haproxy/haproxy.cfg

#   -W  -- "master-worker mode" (similar to the old "haproxy-systemd-wrapper"; allows for reload via "SIGUSR2")
#   -db -- disables background mode
exec haproxy -W -db -f /usr/local/etc/haproxy/haproxy.cfg