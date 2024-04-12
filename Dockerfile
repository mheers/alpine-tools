ARG ALPINE_VERSION

FROM --platform=$BUILDPLATFORM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
    bash \
    bind-tools \
    busybox-extras \
    curl \
    ethtool \
    file \
    git \
    iproute2 \
    iputils \
    jq \
    nano \
    ncurses \
    netcat-openbsd \
    nmap \
    numactl \
    openldap-clients \
    openssh-client \
    openssh-server \
    openssl \
    postgresql-client \
    procps \
    sudo \
    sysstat \
    tcpdump \
    tree \
    util-linux

RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh
RUN ssh-keygen -A

COPY --from=felixb/yocto-httpd /yhttpd /usr/local/bin/yhttpd
COPY start.sh /start.sh
RUN chmod 700 /start.sh

COPY sshd_config /etc/ssh/
RUN  echo "root:Docker!" | chpasswd

EXPOSE 8080 2222
ENTRYPOINT [ "/start.sh" ]
CMD [ "/usr/local/bin/yhttpd" ]
