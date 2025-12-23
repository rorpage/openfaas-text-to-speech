#!/bin/sh
UUID=$(cat /proc/sys/kernel/random/uuid)

export language="en"

if [ ! -z "${Http_X_Language}" ] ;
then
        language="${Http_X_Language}"
fi

gtts-cli - -l "${language}"
