FROM ghcr.io/linuxserver-labs/webhook:latest

ENV EXTRA_PARAM -verbose
ENV CONVERSION_EXT_LIST flac;wav

RUN apk add --no-cache ffmpeg

WORKDIR /config
COPY hooks/hooks.json hooks/hooks.json
COPY flac2mp3.bash flac2mp3.bash
