#!/bin/bash
CONFIG_PATH=/data/options.json

TIMEZONE=$(jq --raw-output ".timezone" $CONFIG_PATH)

date && export TZ=":/usr/share/zoneinfo/"$TIMEZONE && date
mkdir -p /config/motioneye/
test -e /config/motioneye/motioneye.conf || \
cp /usr/share/motioneye/extra/motioneye.conf.sample /config/motioneye/motioneye.conf
/usr/local/bin/meyectl startserver -c /config/motioneye/motioneye.conf