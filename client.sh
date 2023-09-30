#!/bin/bash

if [ -f "/mnt/fifo" ]
then
	rm -f /mnt/fifo
fi
mkfifo /tmp/fifo

export HOST=${SVR_HOST}
export CTRL=${SVR_CTRL_PORT}
export PORT=${SVR_VID_PORT}
export PWD=$(printf '%s' $(echo "$RANDOM" | md5sum) | cut -c 1-10)

while [ 1==1 ]
do 
	RESP=$(echo "${PORT}|${PWD}" | nc -vq 1 ${HOST} ${CTRL})
echo "${RESP}"
	(srt-live-transmit "srt://${HOST}:${PORT}?password=${PWD}" file://con > /tmp/fifo)& \
        /usr/bin/omxplayer.bin -o hdmi --adev hdmi --live /tmp/fifo && \
        echo "raspberry" | sudo kill -9 $(ps -ef | grep srt-live-transmit | grep -v grep | awk '{print $2}')
	sleep 5
done
