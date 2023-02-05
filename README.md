# T-NSA-700 - Setting up a CI/CD on an existing project

## Quick start

```bash
# spin up 3 ubuntu containers to act as VM's accessible using ssh 
./init.sh
# copy ssh priv/pub keys to your ~/.ssh/ directory
cp ./id_rsa ~/.ssh/
cp ./id_rsa.pub ~/.ssh/
# add ssh key to your agent 
ssh-add ~/.ssh/id_rsa
# ssh into each of the VM's
ssh test@localhost -p 2022
ssh test@localhost -p 2023
ssh test@localhost -p 2024
# run server_playbook.yml to install environment for php 7.4 and composer (ask_pass=test)
ansible-playbook --ask-become-pass ./playbook.yml -e ansible_python_interpreter=/usr/bin/python3
```


