#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: vortex2 Password: 23anbT\rE
sshpass -p '23anbT\rE' ssh -l "vortex2" vortex.labs.overthewire.org
