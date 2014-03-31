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
RUN apt-get install -y nginx php5-fpm

# Nginx configuration
ADD ./conf.d/ /etc/nginx/conf.d/
ADD ./sites-available /etc/nginx/sites-available/

# Decouple data from container
VOLUME ["/var/www", "/var/log/nginx"]

# Startup script
EXPOSE 80
ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

CMD ["/opt/startup.sh"]
