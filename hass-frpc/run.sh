#!/bin/sh
CONFIG_PATH=/data/options.json

DEFAULT_CONFIG_FILE=/config/frp/frpc.ini

CONFIG_FILE=$(jq --raw-output ".config_file" $CONFIG_PATH)

if [ ! -f "$CONFIG_FILE" -a ! -f "$DEFAULT_CONFIG_FILE" ]; then
	echo "frpc config file not found in "$CONFIG_FILE", copy example file to "$DEFAULT_CONFIG_FILE", please to edit it."
	mkdir -p /config/frp/ && cp /frp/frpc.ini $DEFAULT_CONFIG_FILE
	CONFIG_FILE=$DEFAULT_CONFIG_FILE
elif [ -f "$CONFIG_FILE" ]; then
    echo "use config file in "$CONFIG_FILE
elif [ -f "$DEFAULT_CONFIG_FILE" ]; then
	echo "use default config file in "$DEFAULT_CONFIG_FILE
	CONFIG_FILE=$DEFAULT_CONFIG_FILE
fi

/frp/frpc -c $CONFIG_FILE
