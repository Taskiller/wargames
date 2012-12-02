#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit5 Password: koReBOKuIDDepwhWk7jZC0RTdopnAYKh
sshpass -p "koReBOKuIDDepwhWk7jZC0RTdopnAYKh" ssh -l "bandit5" vortex.labs.overthewire.org 'find ~/inhere -size 1033c -type f ! -perm /a+x -exec cat {} \;'