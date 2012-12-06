#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan4 Password: vuH0coox6m
sshpass -p 'vuH0coox6m' ssh -l "leviathan4" leviathan.labs.overthewire.org
