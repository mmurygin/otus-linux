#!/bin/bash

source env/nodes.env

docker-compose exec node1 \
    mysqlsh "$CLUSTER_ADMIN_LOGIN"@node1 -p"$CLUSTER_ADMIN_PASSWORD" -- \
        dba create-cluster c1

docker-compose exec node1 \
    mysqlsh "$CLUSTER_ADMIN_LOGIN"@node1 -p"$CLUSTER_ADMIN_PASSWORD" -- \
        cluster add-instance "$CLUSTER_ADMIN_LOGIN"@node2 --password="$CLUSTER_ADMIN_PASSWORD"

docker-compose exec node1 \
    mysqlsh "$CLUSTER_ADMIN_LOGIN"@node1 -p"$CLUSTER_ADMIN_PASSWORD" -- \
        cluster add-instance "$CLUSTER_ADMIN_LOGIN"@node3 --password="$CLUSTER_ADMIN_PASSWORD"
