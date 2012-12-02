#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit3 Password: UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
sshpass -p "UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK" ssh -l "bandit3" vortex.labs.overthewire.org "cat inhere/.hidden"
