ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    openssh-client \
    bind-tools \
    iputils \
    netcat-openbsd
