#!/bin/bash
CONFIG_PATH=/data/options.json

TIMEZONE=$(jq --raw-output ".timezone" $CONFIG_PATH)

date && export TZ=":/usr/share/zoneinfo/"$TIMEZONE && date

ls /dev/
mount /dev/disk/by-uuid/34cf2532-ddc5-4228-8d0c-a737503c3915 /share/disk/data

mkdir -p /config/motioneye/
test -e /config/motioneye/motioneye.conf || \
cp /usr/share/motioneye/extra/motioneye.conf.sample /config/motioneye/motioneye.conf
/usr/local/bin/meyectl startserver -c /config/motioneye/motioneye.conf