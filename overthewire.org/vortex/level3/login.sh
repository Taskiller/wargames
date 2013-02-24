#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: vortex3 Password: 64ncXTvx#
sshpass -p '64ncXTvx#' ssh -l "vortex3" vortex.labs.overthewire.org
