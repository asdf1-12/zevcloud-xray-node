#!/bin/sh
set -e
PORT="${PORT:-8080}"
UUID="${UUID:?UUID env required}"
WSPATH="${WSPATH:-/ws}"
sed -e "s/__PORT__/$PORT/g" -e "s/__UUID__/$UUID/g" -e "s#__WSPATH__#$WSPATH#g" /config-template.json > /etc/xray-config.json
exec /usr/local/bin/xray run -c /etc/xray-config.json
