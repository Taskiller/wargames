#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: narnia2 Password: nairiepecu
sshpass -p "nairiepecu" ssh -l "narnia2" narnia.labs.overthewire.org
