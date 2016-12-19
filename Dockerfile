FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf && \ 
    apk --quiet update && \
    apk --quiet add wget ca-certificates && \
    wget --quiet https://dl.eff.org/certbot-auto && \
    chmod a+x certbot-auto && \
    mkdir -p /etc/letsencrypt/webrootauth && \
    ln -sf /etc/nginx/conf.d/dev.nginx /etc/nginx/nginx.conf

COPY listen.sh /usr/bin/listen
COPY conf/* /etc/nginx/conf.d/
