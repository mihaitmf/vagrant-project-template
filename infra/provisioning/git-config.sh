#!/usr/bin/env bash

WORK_DIR=/var/DEFAULT-PROJECT

apt update
apt install -y git

# Config git user
(cd ${WORK_DIR}; git config user.name "mihaitmf" && git config user.email mihai.tmf@gmail.com)

# Add .gitattributes file
: '
When text=auto conversion is enabled in a cross-platform project using push and pull to a central repository, the text
files containing CRLFs should be normalized.
When a text file is normalized, its line endings are converted to LF in the repository.
'
echo "* text=auto eol=lf" >> ${WORK_DIR}/.gitattributes

# Add .gitignore file
cat >> ${WORK_DIR}/.gitignore <<EOL
# IntelliJ project files
/.idea/
/*.iml

# Vagrant files
/*.log
/.vagrant/
EOL
