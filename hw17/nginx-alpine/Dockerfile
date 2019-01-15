FROM alpine:latest

ENV NGINX_VERSION nginx-1.15.8

EXPOSE 80
EXPOSE 443

RUN apk --update --no-cache add build-base \
        openssl-dev \
        pcre-dev \
        zlib-dev \
        wget

RUN mkdir -p /tmp/src && \
    cd /tmp/src && \
    wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
    tar zxf ${NGINX_VERSION}.tar.gz && \
    cd ${NGINX_VERSION} && \
    ./configure --sbin-path=/usr/bin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --pid-path=/var/run/nginx.pid \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --with-pcre \
        --with-http_ssl_module && \
    make && \
    make install && \
    rm -rf /tmp/src

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY index.html /usr/local/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]
