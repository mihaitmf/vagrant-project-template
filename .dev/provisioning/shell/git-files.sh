#!/usr/bin/env bash

PROJECT_DIR=${1}

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
/.vagrant/
/*.log

# Config YAML file
/.dev/config.yml
EOL

apt update >/dev/null
apt install -y git >/dev/null

# Add .gitattributes and .gitignore files to staging area
(cd ${PROJECT_DIR}; git add .gitignore .gitattributes)
