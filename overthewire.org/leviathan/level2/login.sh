#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan2 Password: ougahZi8Ta
sshpass -p 'ougahZi8Ta' ssh -l "leviathan2" leviathan.labs.overthewire.org
