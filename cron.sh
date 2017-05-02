#!/usr/bin/env bash
mkfifo /var/log/certbot-auto.log
tail -f /var/log/certbot-auto.log &
exec /usr/sbin/cron -f 2>&1
