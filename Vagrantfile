Vagrant.configure("2") do |config|
  config.vm.box = "#{ENV['_VM_BOX'] || "archlinux/archlinux"}"

  config.ssh.shell = "bash"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.ssh.keys_only = false

  config.vm.define "guest" do |guest|
    guest.vm.hostname = "#{ENV['_VM_HOSTNAME'] || "guest"}"
    guest.vm.network "private_network", ip: "#{ENV['_VM_NETWORK_IP'] || "192.168.253.10"}"

    guest.trigger.before :up do |trigger|
      trigger.run = {inline: "#{ENV['_TRIGGER_BEFORE_RUN'] || "date"}"}
    end

    guest.trigger.after :destroy do |trigger|
      trigger.run = {inline: "#{ENV['_TRIGGER_DESTROY_RUN'] || "date"}"}
    end
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
