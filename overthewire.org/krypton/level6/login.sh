#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: krypton6 Password: RANDOM
sshpass -p "RANDOM" ssh -l "krypton6" krypton.labs.overthewire.org
