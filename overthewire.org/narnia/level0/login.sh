#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: narnia0 Password: narnia0
sshpass -p "narnia0" ssh -l "narnia0" narnia.labs.overthewire.org
