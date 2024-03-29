uTorrent is the world most popular BitTorrent client. It’s available to the Ubuntu server with webUI. I have containerized the uTorrent web UI client using docker.


If yout want to setup uTorrent Web UI client directly on your Ubuntu VPS server please follow my another Github repository: [utorrent-server](https://github.com/tankibaj/utorrent-server)



### Prerequisites

- [Docker Engine](https://docs.docker.com/engine/install/)
- [Manage Docker as a non-root user for Linux](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)
- [Docker Compose](https://docs.docker.com/compose/install/) (Optional: only required if you want to run with docker-compose)



### Build

```bash
docker build -t utorrent:latest .
```



### Run

```bash
docker run -d \
    -p 8080:8080 \
    -p 6881:6881 \
    -p 6881:6881/udp \
    -v $(pwd)/downloads:/torrent/downloads \
    -v $(pwd)/torrentfiles:/torrent/torrentfiles \
    utorrent:latest
```



### Run - Docker Compose

You can also build and run container by using [Docker Compose](https://docs.docker.com/compose/). In that case skip previous build and run steps.

```bash
docker-compose up -d
```



### uTorrent WebUI login

`URL`: your_server_ip:8080

`User`: admin

`Password`: leave blank
