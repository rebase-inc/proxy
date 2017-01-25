# do not use alpine, it is not supported by Let's Encrypt
FROM nginx

RUN rm /etc/nginx/conf.d/default.conf && \ 
    apt-get update && \
    apt-get install -y wget && \
    wget https://dl.eff.org/certbot-auto && \
    chmod a+x certbot-auto && \
    mkdir -p /etc/letsencrypt/webrootauth

COPY conf/* /etc/nginx/conf.d/

COPY etc/ /etc/

CMD nginx -g "daemon off;" -c $CONFIG
