#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit1 Password: boJ9jbbUNNfktd78OOpsqOltutMc3MY1
sshpass -p "boJ9jbbUNNfktd78OOpsqOltutMc3MY1" ssh -l "bandit1" bandit.labs.overthewire.org "cat ./-"
