ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
    bash \
    busybox-extras \
    bind-tools \
    curl \
    file \
    git \
    iputils \
    jq \
    nano \
    ncurses \
    netcat-openbsd \
    nmap \
    openssh-client \
    sudo \
    tree
