#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: semtex6 Password: again_mue5li
sshpass -p "again_mue5li" ssh -l "semtex6" semtex.labs.overthewire.org
