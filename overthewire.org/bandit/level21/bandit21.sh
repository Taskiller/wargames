#!/bin/bash
if ! which sshpass >/dev/null; then
  
  echo "'sshpass' command not available."
  echo "Install it first with 'sudo apt-get install sshpass"
  sleep 5
  sudo apt-get install sshpass
fi

#Username: bandit21 Password: gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr
sshpass -p "gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr" ssh -l "bandit21" bandit.labs.overthewire.org 'cat $(cat $(cat /etc/cron.d/cronjob_bandit22 | cut -d" " -f7)|grep cat|cut -d" " -f4)'