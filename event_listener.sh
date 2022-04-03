#!/bin/bash

# A script which monitors connecting snd disconnecting events on an interface on OpenWRT using hostapd_cli
# References:
# https://www.systutorials.com/docs/linux/man/1-hostapd_cli/
# https://www.systutorials.com/docs/linux/man/8-hostapd/

#TODO - Add a checks for known devices
#TODO - Capabilities the MAC address?

API_KEY=''
GROUP_CHAT_ID=-''
TELEGRAM_BOT="https://api.telegram.org/bot$API_KEY/sendMessage?chat_id=$GROUP_CHAT_ID&text="
KNOW_DEVICES_FILE="/know_devices.txt"

if [[ $2 == "AP-STA-CONNECTED" ]]
then
    TEXT="A new device, $3 has join $1"
    message=$(/usr/bin/curl "$TELEGRAM_BOT$TEXT")
    echo "$3" >> "$USER$KNOW_DEVICES_FILE"
fi

if [[ $2 == "AP-STA-DISCONNECTED" ]]
then
    TEXT="Device $3 has been disconnected from $1"
    message=$(/usr/bin/curl "$TELEGRAM_BOT$TEXT")
fi







