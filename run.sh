#!/bin/bash

IP=$(awk "/$HOSTNAME/{print \$1}" /etc/hosts)
DISTRIBUTIONS=$(sed -n 's/^ubuntu_release_names = //p' /etc/apt-cacher/apt-cacher.conf)

cat <<EOF
   _____ _____________________ _________               .__                  
  /  _  \\\\______   \\__    ___/ \\_   ___ \\_____    ____ |  |__   ___________ 
 /  /_\\  \\|     ___/ |    |    /    \\  \\/\\__  \\ _/ ___\\|  |  \\_/ __ \\_  __ \\
/    |    \\    |     |    |    \\     \\____/ __ \\\\  \\___|   Y  \\  ___/|  | \\/
\\____|__  /____|     |____|     \\______  (____  /\\___  >___|  /\\___  >__|   
        \\/                             \\/     \\/     \\/     \\/     \\/       
		
Cache enabled for the following ubuntu disto: $DISTRIBUTIONS

Container IP: $IP


Configure your clients
======================

    echo "Acquire::http::Proxy \"http://$IP:3142\";" | sudo tee /etc/apt/apt.conf.d/01proxy
	
	
Configure your Containers
=========================

In your Dockerfile, add:
    RUN echo "Acquire::http::Proxy \"http://apt-cacher:3142\";" | sudo tee /etc/apt/apt.conf.d/01proxy

Then run that container with --link:
    docker run --link apt-cacher:apt-cacher <any container>
	
EOF

cron && apt-cacher
