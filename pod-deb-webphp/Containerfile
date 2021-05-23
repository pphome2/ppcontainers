FROM debian

MAINTAINER peter version: 0.1

RUN apt-get update

# Apache2
RUN apt-get install -y apache2
RUN apt-get install -y mc
RUN apt-get install -y aptitude

# PHP
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y php-mysql

# PhpMyAdmin
#RUN apt-get install -y phpmyadmin

# Web browser
RUN apt-get install -y lynx

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod php7.3
RUN a2enmod ssl

COPY conf/80.conf /etc/apache2/sites-enabled/80.conf
COPY conf/443.conf /etc/apache2/sites-enabled/443.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# RUN ln -sf /dev/stderr /var/log/apache2/access.log
# RUN ln -sf /dev/stderr /var/log/apache2/error.log
# RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log
# RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80 443

COPY init/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]

#CMD ["/bin/bash"]
