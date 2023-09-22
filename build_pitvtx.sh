#!/bin/bash

#docker buildx build --platform linux/arm64,linux/arm/v7 -t docker-jpits-498b2.ddns.net:5000/jeffspiinthesky/raspbian:buster -f Dockerfile-buster --push --build-arg REPOSITORY="docker-jpits-498b2.ddns.net:5000/" . && \
#docker buildx build --platform linux/arm64,linux/arm/v7 -t docker-jpits-498b2.ddns.net:5000/jeffspiinthesky/srt:1.5.3 -f Dockerfile-SRT --push --build-arg REPOSITORY="docker-jpits-498b2.ddns.net:5000/" . && \
docker buildx build --platform linux/arm64,linux/arm/v7 -t docker-jpits-498b2.ddns.net:5000/jeffspiinthesky/ffmpeg:5.1.3 -f Dockerfile-FFMPEG --push --build-arg REPOSITORY="docker-jpits-498b2.ddns.net:5000/" .
#docker buildx build --platform linux/arm64 -t docker-jpits-498b2.ddns.net:5000/jeffspiinthesky/srt-ffmpeg-omxplayer:1.5.3_5.1.3_f543a0d -f Dockerfile-OMXPlayer --push --build-arg REPOSITORY="docker-jpits-498b2.ddns.net:5000/" . && \
#docker buildx build --platform linux/arm64 -t docker-jpits-498b2.ddns.net:5000/jeffspiinthesky/pitvtx:1.0.0 -f Dockerfile-PiTvTx --push --build-arg REPOSITORY="docker-jpits-498b2.ddns.net:5000/" .

