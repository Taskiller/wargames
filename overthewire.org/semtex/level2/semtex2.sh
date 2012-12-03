#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: semtex2 Password: MUESLIMUHAHAH
sshpass -p "MUESLIMUHAHAH" ssh -l "semtex2" semtex.labs.overthewire.org 
