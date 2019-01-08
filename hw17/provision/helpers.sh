#!/bin/bash

function allow_ssh_access() {
    echo 111111 | passwd --stdin vagrant
    sed -i '/PasswordAuthentication no/d' /etc/ssh/sshd_config
    systemctl restart sshd
}

function allow_system_routing() {
    echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
    sysctl -p /etc/sysctl.conf
}

function setup_connectivity () {
    connection="$1"
    gateway="$2"

    nmcli connection modify "$connection" ipv4.dns 8.8.8.8 ipv4.gateway "$gateway"
    nmcli connection up "$connection"
}
