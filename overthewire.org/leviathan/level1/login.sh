#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: leviathan1 Password: rioGegei8m
sshpass -p 'rioGegei8m' ssh -l "leviathan1" leviathan.labs.overthewire.org
