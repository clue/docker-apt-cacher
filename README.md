# docker-apt-cacher

A minimal docker installation of [psocksd](https://github.com/clue/psocksd) on Ubuntu base image.

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

### Configure your clients

```bash
$ echo "Acquire::http::Proxy \"http://your-docker-host:3142\";" | sudo tee /etc/apt/apt.conf.d/01proxy
```
