#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit11 Password: IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
sshpass -p "IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR" ssh -l "bandit11" vortex.labs.overthewire.org 'cat data.txt | tr [:alpha:] [O-ZA-No-za-m]'