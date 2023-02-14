#!/usr/bin/env bash

mysql -hlocalhost -P3306 -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" < /volume/db.sql

