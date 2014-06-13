FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	apt-cacher

# allow access from everywhere
RUN echo "allowed_hosts = *" >> /etc/apt-cacher/apt-cacher.conf

# limit disk usage
# TODO: does not work as of now. Seems to interpret as 0 bytes maximum
# RUN echo "disk_usage_limit = 10GB" > /etc/apt-cacher/conf.d/disk.conf

# enable multi-distro support (debian and ubuntu alike)
RUN echo "distinct_namespaces = 1" >> /etc/apt-cacher/apt-cacher.conf

# extend ubuntu release names (and keep adding future versions...)
RUN echo "ubuntu_release_names = dapper, edgy, feisty, gutsy, hardy, intrepid, jaunty, karmic, lucid, maverick, natty, oneiric, precise, quantal, trusty, utopic" >> /etc/apt-cacher/apt-cacher.conf

ADD run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]

EXPOSE 3142
VOLUME ["/var/cache/apt-cacher"]
