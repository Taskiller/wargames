#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: krypton3 Password: CAESARISEASY
sshpass -p "CAESARISEASY" ssh -l "krypton3" krypton.labs.overthewire.org
