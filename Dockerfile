ARG ALPINE_VERSION

FROM --platform=$BUILDPLATFORM alpine:${ALPINE_VERSION}

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
    openldap-clients \
    openssh-client \
    openssh-server \
    postgresql-client \
    sudo \
    tree

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
