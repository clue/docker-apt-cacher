#!/bin/bash

if [ "$1" = 'apt-cacher' ]; then
    cron &
    exec apt-cacher
else
    exec "$@"
fi
