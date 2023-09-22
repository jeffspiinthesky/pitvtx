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
	(ffmpeg -hide_banner -loglevel info -copyts -f mpegts -re -i "srt://${HOST}:${PORT}?password=${PWD}" -map 0:v -c:v copy -map 0:a -c:a copy -f mpegts -flags low_delay pipe:1 > /tmp/fifo)& /usr/bin/omxplayer.bin -o hdmi --adev hdmi --live /tmp/fifo
	sleep 5
done
