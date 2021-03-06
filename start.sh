#!/bin/sh
set -e

PUID=${PUID:=0}
PGID=${PGID:=0}

if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
	chown $PUID:$PGID /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi

touch /conf/aria2.session
chown $PUID:$PGID /conf/aria2.session

touch /conf/aria2.log
chown $PUID:$PGID /conf/aria2.log &

aria2c --conf-path=/conf/aria2.conf
