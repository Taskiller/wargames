#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit24 Password: UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
sshpass -p "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ" ssh -l "bandit24" bandit.labs.overthewire.org 