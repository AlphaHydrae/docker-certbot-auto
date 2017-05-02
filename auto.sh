#!/usr/bin/env bash
CERTBOT_BIN=/usr/local/bin/certbot-auto
CERTBOT_AUTO_OPTIONS="$(cat /certbot-auto-options 2>/dev/null|head -n 1)"

$CERTBOT_BIN certonly --webroot $CERTBOT_AUTO_OPTIONS
