#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: narnia1 Password: efeidiedae
sshpass -p "efeidiedae" ssh -l "narnia1" narnia.labs.overthewire.org
