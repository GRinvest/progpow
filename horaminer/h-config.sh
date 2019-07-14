#!/usr/bin/env bash
# This code is included in /hive/bin/custom function

. colors
. h-manifest.conf

[[ -z $CUSTOM_TEMPLATE ]] && echo -e "${YELLOW}CUSTOM_TEMPLATE is empty${NOCOLOR}" && return 1
[[ -z $CUSTOM_URL ]] && echo -e "${YELLOW}CUSTOM_URL is empty${NOCOLOR}" && return 1
conf="--report-hashrate --api-port ${CUSTOM_API_PORT} --HWMON 1 -P stratum1+tcp://${CUSTOM_TEMPLATE}@${CUSTOM_URL} ${CUSTOM_USER_CONFIG}"

[[ -z $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}No CUSTOM_CONFIG_FILENAME is set${NOCOLOR}" && return 1
echo "$conf" > $CUSTOM_CONFIG_FILENAME
