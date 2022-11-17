FROM ubuntu
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install php libapache2-mod-php -y
COPY info.php /var/www/html/info.php
COPY dir.conf /etc/apache2/mods-available/dir.conf
COPY apache2.conf /etc/apache2/apache2.conf
COPY ports.conf /etc/apache2/ports.conf
COPY 000-default.conf /etc/apach2/sites-available/000-default.conf

ENTRYPOINT apache2ctl -D FOREGROUND
EXPOSE 80 8080




