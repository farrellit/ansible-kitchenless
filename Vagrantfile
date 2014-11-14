# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # vagrant box add ubuntu/trusty64
  config.vm.box = 'ubuntu/trusty64'

  5.times do |i|
    host="192.168.35.#{10+i}"
    name=host.gsub '.', '-'
	  config.vm.define name do |n|
	    n.vm.hostname = name
	    n.vm.network 'private_network', ip: host
      n.vm.provider "virtualbox" do |v|
        v.memory = 256
        v.cpus = 2
      end
	  end
  end
end

