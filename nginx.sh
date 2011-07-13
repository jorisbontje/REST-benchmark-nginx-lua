#!/bin/sh
NGINX=/opt/local/openresty/nginx/sbin/nginx
$NGINX -p . -c conf/nginx.conf $@
