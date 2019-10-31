#!/bin/bash
set -e


if [ "$MAILRU_AUTOMOUNT" = 'true' ]; then
  mount-mail-ru.sh
fi

exec "$@"
