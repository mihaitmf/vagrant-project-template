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

# Install git if not exists
if ! type git >/dev/null 2>&1; then
    apt update >/dev/null
    apt install -y git >/dev/null

    # Check installation succeeded
    if ! type git >/dev/null 2>&1; then
        echo "ERROR installing git"
        exit 1
    fi
fi

# Add .gitattributes and .gitignore files to staging area
(cd ${PROJECT_DIR}; git add .gitignore .gitattributes)

exit 0
