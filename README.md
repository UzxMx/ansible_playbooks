# Ansible Playbooks

This repository contains common playbooks and roles.

## How to use

```
git clone git@github.com:UzxMx/ansible_playbooks.git
cd ansible_playbooks
cat <<EOF >hosts
[editor]
192.168.1.1
EOF
ansible-playbook -i hosts editor.yml
```
