#!/bin/bash

# Target IP
CUSTOM_IP=dns.google

# Log file
LOG_FILE=network_log.csv

# Delay
DELAY=5

RESULT=`/usr/bin/ping -w 1 -c 1 $CUSTOM_IP > /dev/null && echo "PING_OK"`

echo "Time,IP,Status" >> $LOG_FILE
while true; do
	TIMESTAMP=$(date +"%Y-%m-%d %T")
	
	if [ "$RESULT" = "PING_OK" ]; then
		echo "$TIMESTAMP: Network is OK"
	else
		echo "$TIMESTAMP: Network is DOWN"
		echo "$TIMESTAMP,$CUSTOM_IP,DOWN" >> $LOG_FILE
	fi
	
	sleep $DELAY
done
