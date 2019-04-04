# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 2.1'

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  project_name = 'DEFAULT-PROJECT'
  machine_ip_address = '192.168.3.10'

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
    config.hostmanager.aliases = "#{project_name}.local"
  end

  # Set auto_update to false, if you do NOT want to check the correct additions version when booting VM's
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.define "#{project_name}-vagrant", primary: true do |vm_config|
    vm_config.vm.box = 'ubuntu/bionic64'
    vm_config.vm.box_check_update = true
    vm_config.vm.network 'private_network', ip: machine_ip_address
    vm_config.vm.provider 'virtualbox' do |vb|
      vb.name = "#{project_name}-VM"
      vb.cpus = 2
      vb.memory = 4096
    end

    vm_config.vm.hostname = project_name

    vm_config.ssh.insert_key = false

    vm_config.vm.synced_folder '.', '/vagrant', disabled: true
    vm_config.vm.synced_folder '.', "/var/#{project_name}", create: true

    vm_config.vm.provision 'docker'

    vm_config.vm.provision 'bootstrap', type: 'shell', run: 'once', path: 'infra/provisioning/bootstrap.sh'
    vm_config.vm.provision 'git-config', type: 'shell', run: 'once', path: 'infra/provisioning/git-config.sh'
    vm_config.vm.provision 'install-packages', type: 'shell', run: 'once', path: 'infra/provisioning/install-packages.sh'
  end
end
