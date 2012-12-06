#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan3 Password: Ahdiemoo1j
sshpass -p 'Ahdiemoo1j' ssh -l "leviathan3" leviathan.labs.overthewire.org
