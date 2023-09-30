#!/bin/bash

export CTRL=${SVR_CTRL_PORT}
export AD=${AUDIO_DEVICE}
export VD=${VIDEO_DEVICE}

run_ffmpeg () {
	PORT=$(echo $1 | cut -f1 -d'|')
	PWD=$(echo $1 | cut -f2 -d'|')
	ffmpeg \
                -hide_banner -loglevel info \
                -f alsa -thread_queue_size 8192 -use_wallclock_as_timestamps 1 -sample_rate 48000 -channels 2 -channel_layout stereo -i ${AD} \
                -itsoffset 0.3 \
                -f v4l2 -thread_queue_size 8192 -use_wallclock_as_timestamps 1 -framerate 60 -video_size 1280x720 -i /dev/${VD} \
                -map 0:a \
                -c:a aac -b:a 128k -ac 2 -ar 48k \
                -map 1:v \
                -c:v h264_omx -tune zerolatency -b:v 6M -maxrate:v 8M -bufsize:v 500M \
		-f mpegts -fflags +genpts -start_at_zero "srt://0.0.0.0:${PORT}?password=${PWD}&mode=listener&transtype=live"
        sleep 1
	return $?
}

while [ 1==1 ]
do
	echo "Waiting for connection..."
	CMD=$(nc -q -1 -l -p ${CTRL})
	echo "Received: ${CMD}"
	run_ffmpeg ${CMD}
        sleep 1
done
