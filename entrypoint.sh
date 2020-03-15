#!/bin/sh
crontab install_crontab.txt
crond -c /var/spool/cron/crontabs -f -L /var/log/cron.log "$@"
