# docker-apt-cacher

Downloading the same software packages for Debian/Ubuntu-based distributions for several machines in your network over and over again is slow and annoying.
Using [apt-cacher](https://help.ubuntu.com/community/Apt-Cacher-Server) you can set up a central machine that caches the package files after the first download.
This is a minimal docker image that eases setting up and maintaining your apt-cacher proxy server.

## Instructions

```bash
$ git clone https://github.com/clue/docker-apt-cacher.git
$ cd docker-psocksd
$ sudo docker build -t apt-cacher .
```

### Run in background

```bash
$ sudo docker run -d -p 3142:3142 -t apt-cacher
```

### Run in background with persistent cache

```bash
$ sudo mkdir /var/cache/apt-cacher
$ sudo docker run -d -p 3142:3142 -v /var/cache/apt-cacher:/var/cache/apt-cacher -t apt-cacher
```

### Configure your clients

```bash
$ echo "Acquire::http::Proxy \"http://your-docker-host:3142\";" | sudo tee /etc/apt/apt.conf.d/01proxy
```
