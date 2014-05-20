# nginx-php5

Dockerfile which providers services for [Nginx][nginx] and [PHP5][php].

[nginx]: http://nginx.org/en/docs/
[php]: http://php.net/

## Building this Image

```
$ sudo docker build -t="nian/nginx-php5"
```

## Running this Image

Document root is configured to host at `/var/www/public`.

In the example below, we use `/opt/` as a base, but feel free to modify for your configuration as needed.

```
$ mkdir -p /opt/www/public
$ mkdir -p /opt/nginx
$ sudo docker run -d -p 80 -v /opt/www:/var/www nian/nginx-php5
```

## Building from this Image

```
FROM nian/nginx-php5
RUN apt-get install -y git curl php5-curl php5-json php5-mcrypt
```
