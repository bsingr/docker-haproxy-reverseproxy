FROM haproxy:alpine

ADD haproxy.cfg.tpl /
ADD docker-entrypoint.sh /

RUN chmod +x docker-entrypoint.sh

CMD "/docker-entrypoint.sh"
