#!/bin/sh
python /usr/local/bin/gtts-cli.py - -l 'en' -o /tmp/temp.mp3 && cat /tmp/temp.mp3
