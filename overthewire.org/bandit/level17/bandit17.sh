#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit17 Password: xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn
sshpass -p "xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn" ssh -l "bandit17" bandit.labs.overthewire.org 'diff passwords.{new,old} | grep "<" | cut -d" " -f2'
#ssh -i bandit17_sshkey -l "bandit17" bandit.labs.overthewire.org 