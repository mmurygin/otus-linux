# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "hw11"

  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end
end
