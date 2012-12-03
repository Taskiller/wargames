#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit20 Password: GbKksEFF4yrVs6il55v6gwY5aVje5f0j
sshpass -p "GbKksEFF4yrVs6il55v6gwY5aVje5f0j" ssh -l "bandit20" bandit.labs.overthewire.org 'cat /etc/bandit_pass/bandit20 | nc -lv 56789 & ./suconnect 56789'