#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: semtex4 Password: d%kj1//..
sshpass -p "d%kj1//.." ssh -l "semtex4" semtex.labs.overthewire.org < semtex4_script.sh
