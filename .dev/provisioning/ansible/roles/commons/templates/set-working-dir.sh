#!/usr/bin/env bash

#{{ ansible_managed }}

bashrc_path="/home/vagrant/.bashrc"
line_to_be_added="cd {{ project_dir }}"

last_line_in_file=$(tail -n 1 ${bashrc_path})

if [[ "$last_line_in_file" != "$line_to_be_added" ]]; then
  echo ${line_to_be_added} >> ${bashrc_path}
fi
