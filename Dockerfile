FROM ubuntu:16.04
MAINTAINER  qbf

# Install apache2, PHP, mysql-server, curl & vim
RUN DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y mysql-server

RUN apt-get -y install apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl vim

# Enable apache mods
RUN a2enmod php7.0
RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

#Set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Update webapp.conf
ADD ./apache-config.conf /etc/apache2/sites-enabled/webapp.conf

# Copy repo
ADD ./www/ /var/www/html
ADD ./sql-data/mydb.sql /docker-entrypoint-initdb.d

RUN service mysql start
CMD /usr/sbin/apache2ctl -D FOREGROUND