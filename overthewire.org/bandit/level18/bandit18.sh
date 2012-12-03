#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit18 Password: kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
sshpass -p "kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd" ssh -l "bandit18" bandit.labs.overthewire.org 'cat readme'