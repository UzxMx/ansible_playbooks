# Ansible Playbooks

This repository contains common playbooks and roles.

## How to use

```
git clone git@github.com:uzxmx/ansible_playbooks.git
cd ansible_playbooks

# Install dependent roles from requirements.yml
ansible-galaxy install -r requirements.yml

cat <<EOF >hosts
[dotfiles]
192.168.1.1
EOF

ansible-playbook -i hosts dotfiles.yml
```
