#!/bin/bash

docker-compose up --build -d

echo "Waiting for database servers setup (60s)..."
sleep 60

./nodes/provision.sh node1
./nodes/provision.sh node2
./nodes/provision.sh node3

./init-cluster.sh

docker-compose up -d router
