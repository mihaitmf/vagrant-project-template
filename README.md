# Vagrant project template
Template for new Vagrant projects

## Quick start
0. Copy `Vagrantfile` and `.dev` directory to your new project directory 
0. Update `Vagrantfile` and replace `DEFAULT-PROJECT` with your **project name**
0. Search in the `provisioning` directory and replace all occurrences of `DEFAULT-PROJECT` with your **project name**
0. Create a copy of the `git-config.env.dist` file with the name `git-config.env` and set your **git** user **name** and **email** in it 
0. Run `vagrant up`

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
