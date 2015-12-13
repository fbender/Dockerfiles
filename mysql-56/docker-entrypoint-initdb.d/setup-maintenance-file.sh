#!/bin/sh

echo "[client]
user=root
password=${MYSQL_ROOT_PASSWORD}
" > /etc/mysql/maintenance.cnf

# for automysqlbackup compliance
ln -s /etc/mysql/maintenance.cnf /etc/mysql/debian.cnf
if [ -n "$MYSQL_ADMIN_EMAIL" ]
then
    sed -i.bak "s/MAILADDR=.*/MAILADDR=\"${MYSQL_ADMIN_EMAIL}\"/g" /etc/default/automysqlbackup
fi

#EOF
