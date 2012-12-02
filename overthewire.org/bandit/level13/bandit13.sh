#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit13 Password: 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
# will create file ~/.ssh/bandit.labs.overthewire.org
sshpass -p "8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL" ssh -l 'bandit13' bandit.labs.overthewire.org 'cat sshkey.private' > /tmp/bandit14_key
chmod 600 /tmp/bandit14_key

#connect as bandit14
ssh -i /tmp/bandit14_key -l 'bandit14' bandit.labs.overthewire.org 'cat /etc/bandit_pass/bandit14'
