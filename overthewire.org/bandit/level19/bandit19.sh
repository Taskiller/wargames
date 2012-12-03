#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit19 Password: IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x
sshpass -p "IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x" ssh -l "bandit19" bandit.labs.overthewire.org './bandit20-do cat /etc/bandit_pass/bandit20'