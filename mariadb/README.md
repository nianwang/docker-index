# mariadb

Dockerfile which providers services for [MariaDB 5.5][mariadb].

[mariadb]: http://mariadb.org/

## Building this Image

```
$ sudo docker build -t="nian/mariadb"
```

## Running this Image

Database root is configured to host at `/var/mariadb`. Log files are available at `/var/log/mariadb`.

In the example below, we use `/opt/` as a base, but feel free to modify for your configuration as needed.

```
$ mkdir -p /opt/data
$ sudo docker run -d --name mydb -p 80 -v /opt/data:/var/lib/mysql nian/mariadb
```

## Building from this Image

Custom configuration can be added to `/etc/mysql/conf.d/`. One-off scripts can be added to `/etc/mysql/scripts/` (and end in `.sql`).

```
FROM nian/mariadb
ADD ./scripts/schema.sql /etc/mysql/scripts/schema.sql
```

## Linking with the Database Container

Spin up a new container:

```
$ docker run -t -i --link mydb:db ubuntu bash
```

This creates a link from a previously named `mydb` with the alias `db` in this new container.

Inside the new container:

```
$ apt-get install -y mysql-client
$ mysql -h "$DB_PORT_3306_TCP_ADDR" -P "$DB_PORT_3306_TCP_PORT"
```
