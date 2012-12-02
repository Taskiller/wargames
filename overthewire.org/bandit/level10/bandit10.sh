#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit10 Password: truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
sshpass -p "truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk" ssh -l "bandit10" bandit.labs.overthewire.org 'base64 -d data.txt'