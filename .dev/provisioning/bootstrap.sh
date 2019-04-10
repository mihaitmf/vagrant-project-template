#!/usr/bin/env bash

PROJECT_DIR=${1}

# Set working directory after vagrant ssh
echo "cd $PROJECT_DIR" >> /home/vagrant/.bashrc

# Add .gitattributes file
: '
When text=auto conversion is enabled in a cross-platform project using push and pull to a central repository, the text
files containing CRLFs should be normalized.
When a text file is normalized, its line endings are converted to LF in the repository.
'
echo "* text=auto eol=lf" > ${PROJECT_DIR}/.gitattributes

# Add .gitignore file
cat > ${PROJECT_DIR}/.gitignore <<EOL
# IntelliJ project files
/.idea/
/*.iml

# Vagrant files
/*.log
/.vagrant/

# Config YAML file
/.dev/config.yml
EOL
