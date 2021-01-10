#!/bin/bash

source config.txt

journalctl -n 0 -u $SERVICE_NAME -f | grep --line-buffered -o "${EVENT_SEARCH_PATTERN}" | while read -r line ; do
    echo "Got event ${line}"
    curl -X POST https://maker.ifttt.com/trigger/$line/with/key/$IFTTT_KEY
done

