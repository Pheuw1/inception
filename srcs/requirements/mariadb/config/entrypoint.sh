sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done
	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi
usr/bin/mysqld_safe --datadir=/var/lib/mysql
