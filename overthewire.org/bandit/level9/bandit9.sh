#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit9 Password: UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
sshpass -p "UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR" ssh -l "bandit9" bandit.labs.overthewire.org 'strings data.txt | grep -E "==+"'