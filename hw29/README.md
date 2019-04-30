# PostgreSQL Cluster

## Homework
1. Setup PostgreSQL Cluster with 3 nodes
1. Create database and check replication state
1. Make switchover / faolover
1. Change some PostgreSQL config, which requires server reloading

## Getting started
1. Setup environment
    ```bash
    grep config.vm.define Vagrantfile | awk -F'"' '{print $2}' | xargs -P5 -I {} vagrant up {}
    ```

    * **parallel** run is required to start etcd
