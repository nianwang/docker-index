# nginx-php5

Dockerfile which providers services for [Nginx][nginx] and [PHP5][php].

[nginx]: http://nginx.org/en/docs/
[php]: http://php.net/

## Building this Image

```
$ sudo docker build -t="nian/nginx-php5"
```

## Running this Image

Document root is configured to host at `/var/www/public`. Log files are available at `/var/log/nginx`.

```
$ mkdir -p /tmp/www/public
$ mkdir -p /tmp/nginx
$ sudo docker run -d -p 80:80 -v /tmp/www:/var/www -v /tmp/nginx:/var/log/nginx
```
