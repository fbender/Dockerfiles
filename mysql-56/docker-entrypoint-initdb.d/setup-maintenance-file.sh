
echo "[client]
user=root
password=$(echo ${MYSQL_ROOT_PASSWORD})
">/etc/mysql/maintenance.cnf
