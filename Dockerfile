FROM mhart/alpine-node:6

ENV RANCHER_COMPOSE_VERSION v0.8.1

COPY package.json /opt/resource/package.json

RUN cd /opt/resource && \
  npm install && \
  npm cache clear

COPY ./resource/* /opt/resource/
RUN chmod +x /opt/resource/*

ADD https://github.com/rancher/rancher-compose/releases/download/$RANCHER_COMPOSE_VERSION/rancher-compose-linux-amd64-$RANCHER_COMPOSE_VERSION.tar.gz /tmp/rancher-compose.tar.gz

RUN cd /tmp && \
  tar xfz rancher-compose.tar.gz && \
  cp rancher-compose-$RANCHER_COMPOSE_VERSION/rancher-compose /usr/local/bin
