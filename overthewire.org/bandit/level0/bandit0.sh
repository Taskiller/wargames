#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit0 Password: bandit0
sshpass -p "bandit0" ssh -l "bandit0" vortex.labs.overthewire.org "cat ./readme"
