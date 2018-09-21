#!/bin/bash
mkdir -p /config/motioneye/
test -e /config/motioneye/motioneye.conf || \ 
cp /usr/share/motioneye/extra/motioneye.conf.sample /config/motioneye/motioneye.conf
ln -s /config/motioneye/motioneye.conf /etc/motioneye/motioneye.conf
/usr/local/bin/meyectl startserver -c /etc/motioneye/motioneye.conf
