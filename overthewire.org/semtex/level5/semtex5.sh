#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: semtex5 Password: HELICOTRMA
sshpass -p "HELICOTRMA" ssh -l "semtex5" semtex.labs.overthewire.org 
