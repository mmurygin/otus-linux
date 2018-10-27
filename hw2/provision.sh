#!/bin/bash

yum update -y
yum install -y mdadm e2fsprogs

# configure raid 10
mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}
mdadm --create --verbose /dev/md0 -l 10 -n 5 /dev/sd{b,c,d,e,f}

# store config for reload
mkdir /etc/mdadm
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf

# create GPT
parted -s /dev/md0 mklabel gpt

# create partitions
parted /dev/md0 mkpart primary ext4 0% 20%
parted /dev/md0 mkpart primary ext4 20% 40%
parted /dev/md0 mkpart primary ext4 40% 60%
parted /dev/md0 mkpart primary ext4 60% 80%
parted /dev/md0 mkpart primary ext4 80% 100%

# create file system
for i in $(seq 1 5); do
    sudo mkfs.ext4 "/dev/md0p$i"
done

# mount file system
mkdir -p /raid/part{1,2,3,4,5}
for i in $(seq 1 5); do
    mount "/dev/md0p$i" "/raid/part$i"
done
