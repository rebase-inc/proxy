FROM nginx

RUN rm /etc/nginx/conf.d/default.conf && \ 
    apt-get update && \
    apt-get install -y wget && \
    wget https://dl.eff.org/certbot-auto && \
    chmod a+x certbot-auto && \
    mkdir -p /etc/letsencrypt/webrootauth && \
    ln -sf /etc/nginx/conf.d/dev.nginx /etc/nginx/nginx.conf

COPY listen.sh /usr/bin/listen
COPY conf/* /etc/nginx/conf.d/
