#!/bin/bash

## specify distributions to cache from environment variable UBUNTU_RELEASE_NAMES
echo "ubuntu_release_names = $UBUNTU_RELEASE_NAMES" >> /etc/apt-cacher/apt-cacher.conf

## run the services
cron && apt-cacher