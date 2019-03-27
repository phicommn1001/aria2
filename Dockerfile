FROM arm64v8/alpine:edge

LABEL maintainer "User@126"

WORKDIR /

RUN mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
        apk update && apk add bash aria2 --no-cache

ADD start.sh /conf-copy/start.sh
ADD aria2.conf /conf-copy/aria2.conf

RUN chmod +x /conf-copy/start.sh



VOLUME ["/data"]
VOLUME ["/conf"]

EXPOSE 6800

CMD ["/conf-copy/start.sh"]
