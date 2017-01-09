#!/bin/sh

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
	echo "=> An empty or uninitialized MySQL volume is detected in ${VOLUME_HOME}"
	echo "=> Installing MySQL ..."
	/create_mysql_admin_user.sh
else
	echo "=> Using an existing volume of MySQL"
fi

exec mysqld_safe