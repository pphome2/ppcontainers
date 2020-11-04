FROM debian

MAINTAINER peter version: 0.1

RUN apt-get update

# Mariadb
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
RUN apt-get install -y mc

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY start.sh /start.sh
RUN chmod +x /start.sh

COPY server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/start.sh"]

#CMD ["/usr/sbin/service apache2 restart && tail -f /var/log/messages"]
CMD ["/bin/bash"]
