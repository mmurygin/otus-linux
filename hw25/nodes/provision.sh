#!/bin/bash

source env/nodes.env

node=$1

docker-compose exec "$node" mysql -uroot -p"$MYSQL_ROOT_PASSWORD" \
    -e "SET sql_log_bin = 0; \
    CREATE USER '${CLUSTER_ADMIN_LOGIN}'@'%' IDENTIFIED BY '${CLUSTER_ADMIN_PASSWORD}'; \
    SET sql_log_bin = 1;"

docker-compose exec "$node" mysql -uroot -p"$MYSQL_ROOT_PASSWORD" \
    -e "SET sql_log_bin = 0; \
      GRANT ALL PRIVILEGES ON *.* TO '${CLUSTER_ADMIN_LOGIN}'@'%' WITH GRANT OPTION; \
      SET sql_log_bin = 1;"
