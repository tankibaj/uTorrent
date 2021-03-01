FROM ubuntu:20.04

RUN mkdir /opt/utorrent && \
    mkdir -p /torrent/downloads && \
    mkdir /torrent/torrentfiles && \
    mkdir /torrent/settings

WORKDIR /torrent

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y --no-install-recommends curl openssl

RUN curl -k -O https://raw.githubusercontent.com/tankibaj/public-files/main/utorrent/libssl1.0.0_1.0.2n-1ubuntu5.5_amd64.deb

RUN apt install ./libssl1.0.0_1.0.2n-1ubuntu5.5_amd64.deb && rm libssl1.0.0_1.0.2n-1ubuntu5.5_amd64.deb

RUN apt-get autoremove -y && apt-get clean -y

RUN curl -k -S -L https://raw.githubusercontent.com/tankibaj/public-files/main/utorrent/utserver.tar.gz | tar xz --strip-components 1 -C /opt/utorrent

COPY ./utserver.conf /torrent/settings

EXPOSE 8080 6881
VOLUME ["/torrent/downloads", "/torrent/torrentfiles", "/torrent/settings"]

CMD ["/opt/utorrent/utserver", "-settingspath", "/opt/utorrent", "-configfile", "/torrent/settings/utserver.conf", "-logfile", "/opt/utorrent/utserver.log"]
