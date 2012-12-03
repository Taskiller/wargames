#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: semtex1 Password: B#4j%XXc
sshpass -p "B#4j%XXc" ssh -l "semtex1" semtex.labs.overthewire.org 
