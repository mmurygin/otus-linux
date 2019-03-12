#!/bin/bash

source ./common.env

node=$1

docker-compose exec "$node" mysql -uroot -p"$MYSQL_ROOT_PASSWORD" \
    -e "CREATE USER '${CLUSTER_ADMIN_LOGIN}'@'%' IDENTIFIED BY '${CLUSTER_ADMIN_PASSWORD}';"

docker-compose exec "$node" mysql -uroot -p"$MYSQL_ROOT_PASSWORD" \
    -e "GRANT ALL PRIVILEGES ON *.* TO '${CLUSTER_ADMIN_LOGIN}'@'%' WITH GRANT OPTION;"
