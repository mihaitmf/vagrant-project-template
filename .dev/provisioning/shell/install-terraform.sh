#!/usr/bin/env bash

# Install terraform if not exists
if ! type terraform >/dev/null 2>&1; then
    wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip >/dev/null 2>&1
    unzip terraform_0.11.13_linux_amd64.zip >/dev/null
    mv terraform /usr/local/bin/
    rm -f terraform_0.11.13_linux_amd64.zip
fi

#terraform --version
