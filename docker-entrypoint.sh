#!/bin/bash
set -e

marcfs /tmp/mailru -o username=$MAILRU_LOGIN,password=$MAILRU_PASSWORD,cachedir=/tmp/cache

exec "$@"
