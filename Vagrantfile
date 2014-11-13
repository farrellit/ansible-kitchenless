# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # vagrant box add ubuntu/trusty64
  config.vm.box = 'ubuntu/trusty64'

  5.times do |i|
	  config.vm.define "host#{i}" do |n|
	    n.vm.hostname = "host#{i}"
	    n.vm.network 'private_network', ip: "192.168.35.#{10+i}"
	  end
  end
end

