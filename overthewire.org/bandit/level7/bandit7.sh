#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit7 Password: HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs
sshpass -p "HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs" ssh -l "bandit7" bandit.labs.overthewire.org 'grep millionth data.txt'