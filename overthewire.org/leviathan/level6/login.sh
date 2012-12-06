#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan6 Password: UgaoFee4li
sshpass -p 'UgaoFee4li' ssh -l "leviathan6" leviathan.labs.overthewire.org
