#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan5 Password: Tith4cokei
sshpass -p 'Tith4cokei' ssh -l "leviathan5" leviathan.labs.overthewire.org
