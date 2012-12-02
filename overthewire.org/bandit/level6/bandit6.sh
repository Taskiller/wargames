#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit6 Password: DXjZPULLxYr17uwoI01bNLQbtFemEgo7
sshpass -p "DXjZPULLxYr17uwoI01bNLQbtFemEgo7" ssh -l "bandit6" bandit.labs.overthewire.org 'find / -user bandit7 -group bandit6 -size 33c -exec cat {} \; 2>/dev/null'