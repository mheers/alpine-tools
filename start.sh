#!/bin/sh

/usr/sbin/sshd -D -e &

exec "$@"
