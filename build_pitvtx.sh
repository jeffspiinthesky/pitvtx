#!/bin/bash

docker build -t jeffspiinthesky/raspbian:buster -f Dockerfile-buster . && \
docker build -t jeffspiinthesky/srt:1.5.3 -f Dockerfile-SRT . && \
docker build -t jeffspiinthesky/ffmpeg:5.1.3 -f Dockerfile-FFMPEG . && \
docker build -t jeffspiinthesky/srt-ffmpeg-omxplayer:1.5.3_5.1.3_f543a0d -f Dockerfile-OMXPlayer . && \
docker build -t jeffspiinthesky/pitvtx:1.0.0 -f Dockerfile-PiTvTx .

