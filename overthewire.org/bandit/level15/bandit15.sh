#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit15 Password: BfMYroe26WYalil77FoDi9qh59eK5xNr
sshpass -p "BfMYroe26WYalil77FoDi9qh59eK5xNr" ssh -l "bandit15" bandit.labs.overthewire.org 'cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -quiet 2>/dev/null'