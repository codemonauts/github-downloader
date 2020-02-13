FROM ubuntu:bionic

LABEL MAINTAINER Felix <felix@codemonauts.com>

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    ca-certificates curl git jq

ADD download.sh /download.sh

VOLUME /storage
CMD "/download.sh"
