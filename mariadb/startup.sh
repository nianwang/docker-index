#!/bin/sh

# Stop on error
set -e

SCRIPTS=$(ls -A /etc/mysql/scripts/*.sql)

if [ ! -d /var/lib/mysql/mysql ]
then
    echo "Initialize database ..."
    mysql_install_db
fi

initialize_scripts() {
    while [ ! -e /run/mysqld/mysqld.sock ]
    do
        echo "Waiting for database to start up ..."
        inotifywait -q -e create /run/mysqld/ >> /dev/null
    done

    if [ "$SCRIPTS" ]
    then
        echo "Running scripts ... ($SCRIPTS)"
        cat "$SCRIPTS" | mysql -u root
        rm -f "$SCRIPTS"
    fi
} 

initialize_scripts &

exec mysqld_safe --skip-syslog
