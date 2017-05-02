#!/usr/bin/env bash
CERTBOT_BIN=/usr/local/bin/certbot-auto
CERTBOT_AUTO_OPTIONS="$(cat /certbot-auto-options 2>/dev/null|head -n 1)"

if [ -n "$CERTBOT_AUTO_OPTIONS" ]; then
  $CERTBOT_BIN certonly --webroot $CERTBOT_AUTO_OPTIONS &> /var/log/certbot-auto.log
else
  echo "[$(date)] No options found in /certbot-auto-options" > /var/log/certbot-auto.log
fi
