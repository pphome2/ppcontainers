#!/bin/sh

service apache2 start && tail -f /var/log/lastlog
