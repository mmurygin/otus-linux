#!/bin/bash

declare -r VERSION=4.18.14

yum update -y
yum install -y \
    wget \
    ncurses-devel \
    make \
    gcc \
    bc \
    bison \
    flex \
    perl \
    elfutils-libelf-devel \
    openssl-devel \
    grub2

cd /usr/src/kernels
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-"$VERSION".tar.xz
tar -xvf linux-"$VERSION".tar.xz

cd linux-"$VERSION"
cp /boot/config-"$(uname -r)" .config
make olddefconfig
make -j"$(nproc)" bzImage
make -j"$(nproc)" modules
make -j"$(nproc)"
make modules_install
make install
