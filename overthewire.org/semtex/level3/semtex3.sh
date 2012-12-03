#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: semtex3 Password: jJjl2Msl
sshpass -p "jJjl2Msl" ssh -l "semtex3" semtex.labs.overthewire.org 
