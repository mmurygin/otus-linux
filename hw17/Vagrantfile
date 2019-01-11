# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
    :inetRouter => {
        net: [
            { ip: '192.168.255.1', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "router-net" },
        ],
        routes: [
            { dst: "192.168.0.0/16", src: "192.168.255.2", connection: "System eth1" },
        ],
        masquerade: true,
        isRouter: true,
    },
    :centralRouter => {
        net: [
            { ip: '192.168.255.2', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "router-net" },
            { ip: '192.168.0.1', adapter: 3, netmask: "255.255.255.240", virtualbox__intnet: "dir-net" },
            { ip: '192.168.0.33', adapter: 4, netmask: "255.255.255.240", virtualbox__intnet: "hw-net" },
            { ip: '192.168.0.65', adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "mgt-net" },
            { ip: '192.168.255.9', adapter: 6, netmask: "255.255.255.248", virtualbox__intnet: "central-net" },
        ],
        routes: [
            { dst: "192.168.1.0/24", src: "192.168.255.11", connection: "System eth5" },
            { dst: "192.168.2.0/24", src: "192.168.255.10", connection: "System eth5" },
        ],
        gateway: { ip: "192.168.255.1", connection: "System eth1" },
        dns: { ip: "8.8.8.8", connection: "System eth1" },
        isRouter: true,
    },
    :centralServer => {
        net: [
            { ip: '192.168.0.2', adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: "dir-net" },
        ],
        gateway: { ip: "192.168.0.1", connection: "System eth1" },
        dns: { ip: "8.8.8.8", connection: "System eth1" },
    },
    :office1Router => {
        net: [
            { ip: '192.168.255.10', adapter: 2, netmask: "255.255.255.248", virtualbox__intnet: "central-net" },
            { ip: '192.168.2.1', adapter: 3, netmask: "255.255.255.192", virtualbox__intnet: "dev1-net" },
            { ip: '192.168.2.65', adapter: 4, netmask: "255.255.255.192", virtualbox__intnet: "test1-net" },
            { ip: '192.168.2.129', adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "managers1-net" },
            { ip: '192.168.2.193', adapter: 6, netmask: "255.255.255.192", virtualbox__intnet: "hw1-net" },
        ],
        gateway: { ip: "192.168.255.9", connection: "System eth1" },
        dns: { ip: "8.8.8.8", connection: "System eth1" },
        isRouter: true,
    },
    :office1Server => {
        net: [
            { ip: '192.168.2.2', adapter: 3, netmask: "255.255.255.192", virtualbox__intnet: "dev1-net" },
        ],
        gateway: { ip: "192.168.2.1", connection: "System eth1" },
        dns: { ip: "8.8.8.8", connection: "System eth1" },
    },
    :office2Router => {
        net: [
            { ip: '192.168.255.11', adapter: 2, netmask: "255.255.255.248", virtualbox__intnet: "central-net" },
            { ip: '192.168.1.1', adapter: 3, netmask: "255.255.255.128", virtualbox__intnet: "dev2-net" },
            { ip: '192.168.1.129', adapter: 4, netmask: "255.255.255.192", virtualbox__intnet: "test2-net" },
            { ip: '192.168.1.193', adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "hw2-net" },
        ],
        gateway: { ip: "192.168.255.9", connection: "System eth1" },
        dns: { ip: "8.8.8.8", connection: "System eth1" },
        isRouter: true,
    },
    :office2Server => {
        net: [
            { ip: '192.168.1.2', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "dev2-net" },
        ],
        gateway: { ip: "192.168.1.1", connection: "System eth1" },
        dns: { ip: "8.8.8.8", connection: "System eth1" },
    },
}

Vagrant.configure("2") do |config|
    MACHINES.each do |boxname, boxconfig|
        config.vm.define boxname do |box|
            box.vm.box = "centos/7"
            box.vm.host_name = boxname.to_s

            box.ssh.insert_key = false
            box.ssh.forward_agent = true

            boxconfig[:net].each do |ipconf|
                box.vm.network "private_network", ipconf
            end

            # box.vm.provision "shell", inline: "yum install -y tcpdump"

            if boxconfig[:masquerade] then
                box.vm.provision "shell", inline: <<-SHELL
                    iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE
                SHELL
            end

            if boxconfig[:isRouter] then
                box.vm.provision "shell", inline: <<-SHELL
                    echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
                    sysctl -p /etc/sysctl.conf
                SHELL
            end

            if boxconfig[:routes] then
                boxconfig[:routes].each do |route|
                    box.vm.provision "shell" do |s|
                        s.inline = <<-SHELL
                            nmcli connection modify "$1" +ipv4.routes "$2 $3"
                            nmcli connection up "$1"
                        SHELL
                        s.args = [route[:connection], route[:dst], route[:src]]
                    end
                end
            end

            if boxconfig[:dns] then
                box.vm.provision "shell" do |s|
                    s.inline = <<-SHELL
                        nmcli connection modify "$1" ipv4.dns "$2"
                        nmcli connection up "$1"
                    SHELL
                    s.args = [boxconfig[:dns][:connection], boxconfig[:dns][:ip]]
                end
            end

            if boxconfig[:gateway] then
                box.vm.provision "shell" do |s|
                    s.inline = <<-SHELL
                        nmcli connection modify "$1" ipv4.gateway "$2"
                        nmcli connection up "$1"
                    SHELL
                    s.args = [boxconfig[:gateway][:connection], boxconfig[:gateway][:ip]]
                end
            end
        end
    end
end

