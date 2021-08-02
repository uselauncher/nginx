# https://github.com/uselauncher/nginx
# https://hub.docker.com/r/uselauncher/nginx

FROM nginx:1.21-alpine
RUN apk add --no-cache curl bash

RUN set -ex \
  && mkdir -p /etc/nginx/apps \
  && mkdir -p /etc/nginx/sites-enabled

COPY apps/*.conf /etc/nginx/apps
COPY default.conf /etc/nginx/conf.d
COPY gzip.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
