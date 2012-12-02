#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit8 Password: cvX2JJa4CFALtqS87jk27qwqGhBM9plV
sshpass -p "cvX2JJa4CFALtqS87jk27qwqGhBM9plV" ssh -l "bandit8" bandit.labs.overthewire.org 'sort data.txt | uniq -u'