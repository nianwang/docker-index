FROM ubuntu:13.10
MAINTAINER nian

# Update system
RUN apt-get update && apt-get dist-upgrade -y

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y \
    git curl nginx \
    php5-cli php5-curl php5-fpm php5-json php5-mcrypt php5-sqlite php5-mysqlnd

# Nginx configuration
RUN unlink /etc/nginx/sites-enabled/default
ADD ./realip.conf /etc/nginx/conf.d/realip.conf
ADD ./www.conf /etc/nginx/sites-enabled/www.conf

# Decouple our data from our container
VOLUME ["/var/www", "/var/log/nginx"]

EXPOSE 80
ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh
CMD ["/opt/startup.sh"]
