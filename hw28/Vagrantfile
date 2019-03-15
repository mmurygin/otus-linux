# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "10.0.10.2"
  end

  config.vm.define "slave" do |slave|
    slave.vm.hostname = "slave"
    slave.vm.network "private_network", ip: "10.0.10.3"
  end
end
