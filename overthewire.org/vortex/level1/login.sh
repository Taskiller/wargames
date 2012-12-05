#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: vortex1 Password: Gq#qu3bF3
sshpass -p "Gq#qu3bF3" ssh -l "vortex1" vortex.labs.overthewire.org
