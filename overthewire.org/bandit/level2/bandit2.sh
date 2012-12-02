#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit2 Password: CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
sshpass -p "CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9" ssh -l "bandit2" vortex.labs.overthewire.org "cat spaces\ in\ this\ filename"
