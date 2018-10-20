Vagrant.configure("2") do |config|
  config.ssh.shell = "bash"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.ssh.keys_only = false

  config.vm.define "control" do |guest|
    guest.vm.box = "ubuntu/trusty64"
    guest.vm.hostname = "control"
    guest.vm.network "private_network", ip: "192.168.253.10"
  end

  config.vm.define "ubuntu" do |guest|
    guest.vm.box = "ubuntu/trusty64"
    guest.vm.hostname = "ubuntu"
    guest.vm.network "private_network", ip: "192.168.253.11"
  end

  config.vm.define "arch" do |guest|
    guest.vm.box = "archlinux/archlinux"
    guest.vm.hostname = "arch"
    guest.vm.network "private_network", ip: "192.168.253.12"
  end

  config.vm.provider "virtualbox" do |v, override|
    v.linked_clone = true

    v.memory = "#{ENV['_VM_PROVIDER_MEMORY'] || 2048}"
    v.cpus = "#{ENV['_VM_PROVIDER_CPU'] || 1}"

    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

    override.vm.synced_folder ENV['HOME'], '/vagrant'
    override.vm.synced_folder (ENV['_VM_SYNCED_HOME'] || "../home"), '/home/vagrant'
  end
end
