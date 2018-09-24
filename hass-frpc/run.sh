#!/bin/bash
mkdir -p /config/frp/
test -e /config/frp/frpc.ini || cp /frp/frpc.ini /config/frp/frpc.ini
/frp/frpc -c /config/frp/frpc.ini