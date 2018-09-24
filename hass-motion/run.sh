#!/bin/bash
mkdir -p /config/motioneye/
test -e /config/motioneye/motioneye.conf || \
cp /usr/share/motioneye/extra/motioneye.conf.sample /config/motioneye/motioneye.conf
/usr/local/bin/meyectl startserver -c /config/motioneye/motioneye.conf