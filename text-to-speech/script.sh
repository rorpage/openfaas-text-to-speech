#!/bin/sh
UUID=$(cat /proc/sys/kernel/random/uuid)
python /usr/local/bin/gtts-cli.py - -l 'en' -o /tmp/$UUID.mp3 && cat /tmp/$UUID.mp3
