#!/usr/bin/env bash

mysqldump --no-tablespaces -hlocalhost -P3306 -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --add-drop-database --databases mattermost_test > /volume/db.sql

