FROM debian

MAINTAINER peter version: 0.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# System
RUN apt-get install -y mc
RUN apt-get install -y aptitude

# Postfix
RUN apt-get install -y postfix
RUN apt-get install -y procmail

# Dovecot
RUN apt-get install -y dovecot-core
RUN apt-get install -y dovecot-imapd

# Clamav
RUN apt-get install -y clamav
RUN apt-get install -y clamsmtp

# Spamassassin
RUN apt-get install -y spamassassin

# Rsyslog
RUN apt-get install -y rsyslog

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 25 587 465 
EXPOSE 143 993

COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN mkdir /etc/conf

ENTRYPOINT ["/start.sh"]

#CMD ["/bin/bash"]
