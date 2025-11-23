#!/bin/bash

IFS=';' read -r -a _CONVERSION_EXT_LIST <<< ${CONVERSION_EXT_LIST}
_WORKING_DIR=$(pwd)
echo "Working dir: ${_WORKING_DIR}"
echo "Arguments : $@"

_FILE_FULL_NAME="$1"
_FILE_BASE_NAME="${_FILE_FULL_NAME%.*}"
_FILE_EXT="${_FILE_FULL_NAME##*.}"

echo "File base: $_FILE_BASE_NAME"
echo "File ext: $_FILE_EXT"

for ext in ${_CONVERSION_EXT_LIST[@]}; do
    if [ "$_FILE_EXT" = "$ext" ]; then
        ffmpeg -i "${_FILE_FULL_NAME}" -y -b:a 128k -map 0 -map -0:v -ac 2 "${_FILE_BASE_NAME}.opus" && rm "${_FILE_FULL_NAME}"
    fi
done
