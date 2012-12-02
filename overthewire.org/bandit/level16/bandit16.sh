#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit16 Password: cluFn7wTiGryunymYOu4RcffSxQluehd
sshpass -p "cluFn7wTiGryunymYOu4RcffSxQluehd" ssh -l "bandit16" bandit.labs.overthewire.org 'echo nmap-ing; for i in `nmap -p31000-32000 localhost|grep tcp|cut -d/ -f1|sort -r`; do echo "try $i"; ( openssl s_client -connect localhost:$i -quiet </etc/bandit_pass/bandit16 2>/dev/null ) & sleep 2; kill -9 $!; done'