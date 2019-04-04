#!/usr/bin/env bash

PROJECT_DIR=/var/DEFAULT-PROJECT

GIT_USER_NAME="Mihai Tmf"
GIT_USER_EMAIL=mihai.tmf@gmail.com

apt update
apt install -y git

# Config git user
(cd ${PROJECT_DIR}; git config user.name "${GIT_USER_NAME}" && git config user.email ${GIT_USER_EMAIL})

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
EOL

# Add .gitattributes and .gitignore files to staging area
(cd ${PROJECT_DIR}; git add .gitignore .gitattributes)
