#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit22 Password: Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI
sshpass -p "Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI" ssh -l "bandit22" bandit.labs.overthewire.org 'cat /tmp/$(echo "I am user bandit23" | md5sum | cut -d" " -f 1)'