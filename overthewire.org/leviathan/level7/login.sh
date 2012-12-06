#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan7 Password: ahy7MaeBo9
sshpass -p 'ahy7MaeBo9' ssh -l "leviathan7" leviathan.labs.overthewire.org
