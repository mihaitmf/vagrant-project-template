# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 2.1'

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  PROJECT_NAME = 'default-project-name'
  MACHINE_IP_ADDRESS = '192.168.89.103'

  required_plugins = %w(vagrant-vbguest vagrant-hostmanager)

  # Install plugins if missing
  plugins_to_install = required_plugins.select {|plugin| not Vagrant.has_plugin? plugin}
  if plugins_to_install.any?
    puts "Installing plugins: #{plugins_to_install.join(' ')}"
    if system "vagrant plugin install #{plugins_to_install.join(' ')}"
      exec "vagrant #{ARGV.join(' ')}"
    else
      abort 'Installation of one or more plugins has failed. Aborting.'
    end
  end

  # Configure hosts
  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.aliases = "#{PROJECT_NAME}.local"
  end

  # Set auto_update to false, if you do NOT want to check the correct virtual-box-guest-additions version when booting VM
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.define "#{PROJECT_NAME}-vagrant", primary: true do |vm_config|
    vm_config.vm.box = 'ubuntu/bionic64'
    vm_config.vm.box_check_update = true
    vm_config.vm.network 'private_network', ip: MACHINE_IP_ADDRESS
    vm_config.vm.provider 'virtualbox' do |vb|
      vb.name = "#{PROJECT_NAME}-VM"
      vb.cpus = 2
      vb.memory = 4096
    end

    vm_config.vm.hostname = PROJECT_NAME

    vm_config.ssh.insert_key = false

    vm_config.vm.synced_folder '.', '/vagrant', disabled: true
    vm_config.vm.synced_folder '.', "/var/#{PROJECT_NAME}", create: true

    vm_config.vm.provision 'docker'

    vm_config.vm.provision 'bootstrap', type: 'shell', run: 'once', path: '.dev/provisioning/bootstrap.sh'
    vm_config.vm.provision 'git-config', type: 'shell', run: 'once', path: '.dev/provisioning/git-config.sh'
    vm_config.vm.provision 'install-packages', type: 'shell', run: 'once', path: '.dev/provisioning/install-packages.sh'
  end
end
