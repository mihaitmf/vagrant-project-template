# Vagrant project template
Template for new Vagrant projects

## Quick start
1. Update `Vagrantfile` file and replace `DEFAULT-PROJECT` with your **project name**
1. Search in the `.dev/provisioning` directory and replace all occurrences of `DEFAULT-PROJECT` with your **project name**
1. Set your *git* user **name** and **email** in the `git-config.sh` file 
1. Run `vagrant up`

### Vagrant provisioners
To run just a separate provisioner:
- `vagrant provision --provision-with <provisioner-name>`

- Example: `vagrant provision --provision-with install-packages`

### Git config
Git user name and email are configured in the `config.env` file.

Default versions of `.gitignore` and `.gitattributes` files are auto-generated.

### Get a quick start for your favorite programming language 
In the `install-packages.sh` vagrant provisioner there are some default installations for various programming languages to give you a quick start for developing your new project.

They are all commented. Just uncomment and install the ones you need.  

### Enjoy!
