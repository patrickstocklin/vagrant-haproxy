# -*- mode: ruby -*-
# vi: set ft=ruby :
#Adapted from https://github.com/justintime/vagrant-haproxy-demo

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 256]
  end

  #HAProxy
  config.vm.define :haproxy, primary: true do |haproxy_config|
    haproxy_config.vm.hostname = 'haproxy'
    #configure network's forwarded ports here via .vm.network
    haproxy_config.vm.network :forwarded_port, guest: 8080, host: 8080
    haproxy_config.vm.network :forwarded_port, guest: 80, host:8081
    haproxy_config.vm.network :private_network, ip: "172.16.0.1"
    #provisioning
    haproxy_config.vm.provision :shell, :path => "haproxy-setup.sh"
  end

  #Webserver 1
  config.vm.define :webserver1 do |webserver1_config|
    webserver1_config.vm.hostname = 'webserver1'
    #configure network's forwarded ports here via .vm.network
    webserver1_config.vm.network :private_network, ip: "172.16.0.2"
    #provisioning
    webserver1_config.vm.provision :shell, :path => "webserver-setup.sh"
  end

  #Webserver 2
  config.vm.define :webserver2 do |webserver2_config|
    webserver2_config.vm.hostname = 'webserver2'
    #configure network's forwarded ports here via .vm.network
    webserver2_config.vm.network :private_network, ip: "172.16.0.3"
    #provision
    webserver2_config.vm.provision :shell, :path => "webserver-setup.sh"
  end
end
