#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit12 Password: 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
sshpass -p "5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu" ssh -l "bandit12" bandit.labs.overthewire.org 'xxd -r data.txt | gunzip | bunzip2 | gunzip | tar -xO | tar -xO | bunzip2 | tar -xO | gunzip'