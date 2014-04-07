FROM ubuntu:13.10
MAINTAINER nian

# Update system
RUN apt-get update && apt-get dist-upgrade -y

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Basic packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://mirror.jmu.edu/pub/mariadb/repo/5.5/ubuntu saucy main'
RUN apt-get update && apt-get install -y inotify-tools mariadb-server

# Configuration
ADD ./conf.d/ /etc/mysql/conf.d/
ADD ./scripts/ /etc/mysql/scripts/

# Decouple data from container
VOLUME ["/var/lib/mysql"]

# Startup script
EXPOSE 3306
ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

CMD ["/opt/startup.sh"]
