#!/bin/bash

## specify distributions to cache from environment variable UBUNTU_RELEASE_NAMES
echo "ubuntu_release_names = $UBUNTU_RELEASE_NAMES" >> /etc/apt-cacher/apt-cacher.conf

if [ $# -eq 0 ]; then
    ## run the services
    cron &
    exec apt-cacher
else
    exec "$@"
fi
