#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan0 Password: leviathan0
sshpass -p 'leviathan0' ssh -l "leviathan0" leviathan.labs.overthewire.org
