#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#connect as bandit14
sshpass -p "4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e" ssh -l 'bandit14' bandit.labs.overthewire.org 'cat /etc/bandit_pass/bandit14 | nc localhost 30000'
