# Vagrant project template
Template for new Vagrant projects

## Quick start
1. Copy `Vagrantfile` and `.dev` directory to your new project directory 
1. Create a copy of the `config.yml.dist` file with the name `config.yml` and set your desired properties 
(ex: project name, project root path, git user name and email etc.) 
1. Run `vagrant up`

### Vagrant provisioners
Provisioning can be done using either **shell scripts** or **Ansible**.

The two versions are similar and you can choose your favorite one by changing the value of the `provisioning.default`
property in the `config.yml` file. Possible values are `shell` and `ansible`.

### Git config
Git user **name** and **email** are configured in the `config.yml` file.

Default versions of `.gitignore` and `.gitattributes` files are auto-generated.

### Get a quick start for your favorite programming language 
There are some default installations for various programming languages and tools, to give you a quick start for
developing your new project.

They can easily be managed for each Vagrant provisioner type from:
- `install-packages.sh` for the shell provisioning 
- `playbook-install-packages.yml` for the Ansible provisioning 

The installations are by default all commented. Just uncomment and install the ones you need.  

To run just a single provisioner:
- `vagrant provision --provision-with <provisioner-name>`

- Example: `vagrant provision --provision-with install-packages`

### Enjoy!
