#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit4 Password: pIwrPrtPN36QITSp3EQaw936yaFoFgAB
sshpass -p "pIwrPrtPN36QITSp3EQaw936yaFoFgAB" ssh -l "bandit4" vortex.labs.overthewire.org 'cat `file ./inhere/-file0*|grep ASCII|cut -d: -f1`'