FROM ubuntu:14.04
MAINTAINER nian

# Update system
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get dist-upgrade -y

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Basic packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx php5-fpm

# Configuration
ADD ./conf.d/ /etc/nginx/conf.d/
ADD ./sites-available/ /etc/nginx/sites-available/
ADD ./pool.d/ /etc/php5/fpm/pool.d/

# Decouple data from container
VOLUME ["/var/www"]

# Startup script
EXPOSE 80
ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

CMD ["/opt/startup.sh"]
