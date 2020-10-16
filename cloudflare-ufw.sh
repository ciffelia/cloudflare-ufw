#!/bin/sh

curl -s https://www.cloudflare.com/ips-v4 -o /tmp/cf_ips
curl -s https://www.cloudflare.com/ips-v6 >> /tmp/cf_ips

# Allow traffic from Cloudflare IPs to port 443
for cfip in `cat /tmp/cf_ips`; do ufw allow from $cfip to any app 'WWW Secure' comment 'Cloudflare IP'; done

ufw reload > /dev/null
