#!/bin/bash

source common.env

nodes=(node1 node2 node3)

function provision_node() {
    local node=$1

    docker-compose exec "$node" mysql -uroot -p"$MYSQL_ROOT_PASSWORD" \
        -e "CREATE USER '${CLUSTER_ADMIN_LOGIN}'@'%' IDENTIFIED BY '${CLUSTER_ADMIN_PASSWORD}';"

    docker-compose exec "$node" mysql -uroot -p"$MYSQL_ROOT_PASSWORD" \
        -e "GRANT ALL PRIVILEGES ON *.* TO '${CLUSTER_ADMIN_LOGIN}'@'%' WITH GRANT OPTION;"
}

for i in "${nodes[@]}"; do
    provision_node "$i"
done
