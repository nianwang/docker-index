#!/bin/sh

service php5-fpm start
nginx -g "daemon off;"
