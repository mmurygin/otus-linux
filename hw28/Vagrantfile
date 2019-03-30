# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end

  config.vm.define "master" do |master|
    master.vm.hostname = "master.local"
    master.vm.network "private_network", ip: "10.0.10.2"
  end

  config.vm.define "slave" do |slave|
    slave.vm.hostname = "slave.local"
    slave.vm.network "private_network", ip: "10.0.10.3"
  end

  config.vm.define "backup" do |backup|
    backup.vm.hostname = "backup.local"
    backup.vm.network "private_network", ip: "10.0.10.4"
  end
end
