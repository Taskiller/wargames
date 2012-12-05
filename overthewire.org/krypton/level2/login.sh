#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: krypton2 Password: ROTTEN
sshpass -p "ROTTEN" ssh -l "krypton2" krypton.labs.overthewire.org
