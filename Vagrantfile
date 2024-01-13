# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
  v.customize ["modifyvm", :id, "--memory", 512]
  end

  config.vm.define "Manager" do |manager|
    manager.vm.hostname = 'Manager'  
    manager.vm.network :private_network, ip: "10.0.123.5"
    manager.vm.provision "file", source: "./keys/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
    manager.vm.provision "file", source: "./keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    manager.vm.provision "shell", :path => "manager-setup.sh"
  end

  config.vm.define "Host1"  do |host1|
    host1.vm.hostname = 'Host1'  
    host1.vm.network :private_network, ip: "10.0.123.6"
    host1.vm.provision "file", source: "./keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    host1.vm.provision "shell", :path => "host-setup.sh"
  end

  config.vm.define "Host2" do |host2|
    host2.vm.hostname = 'Host2'  
    host2.vm.network :private_network, ip: "10.0.123.7"
    host2.vm.provision "file", source: "./keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    host2.vm.provision "shell", :path => "host-setup.sh"
  end
  
   config.vm.define "Host3" do |host3|
    host3.vm.hostname = 'Host3'  
    host3.vm.network :private_network, ip: "10.0.123.8"
    host3.vm.provision "file", source: "./keys/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    host3.vm.provision "shell", :path => "host-setup.sh"
  end
end
