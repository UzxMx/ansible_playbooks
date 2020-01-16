# Ansible Playbooks

This repository contains common playbooks and roles.

## Prerequisites

```
git clone git@github.com:uzxmx/ansible_playbooks.git
cd ansible_playbooks

# Install dependent roles from requirements.yml
ansible-galaxy install -r requirements.yml
```

## Common Usage

```
# Show help
ansible-playbook -h

# Run as current user
ansible-playbook -i hosts playbook.yml

# Run plays and tasks with tags
ansible-playbook -i hosts playbook.yml -t TAGS

# Run with extra vars
ansible-playbook -i hosts playbook.yml -t TAGS -e key=value

# Run as other user, with private key file
ansible-playbook -i hosts -u other-user --private-key <path-to-private-key-file> playbook.yml
```

## Playbooks

### dotfiles

```
cat <<EOF >hosts
[dotfiles]
192.168.1.2
EOF

ansible-playbook -i hosts dotfiles.yml
```

### users

```
cat <<EOF >hosts
[users]
192.168.1.2
EOF

ansible-playbook -i hosts -u root --private-key <path-to-private-key-file> users.yml
```

### jenkins

```
cat <<EOF >hosts
[jenkins]
192.168.1.2
EOF

# Run all tasks
ansible-playbook -i hosts jenkins.yml

# Run only tasks tagged with jenkins
ansible-playbook -i hosts -t jenkins jenkins.yml

# Run only tasks tagged with jenkins, with password provided
ansible-playbook -i hosts -t jenkins jenkins.yml -e jenkins_admin_password=password

# Run only tasks tagged with nginx
ansible-playbook -i hosts -t nginx jenkins.yml

# Run only tasks tagged with nginx, with ssl enabled
ansible-playbook -i hosts -t nginx -e enable_ssl=true jenkins.yml

# Run only tasks tagged with nginx, with custom ssl cert and key path
ansible-playbook -i hosts -t nginx \
  -e enable_ssl=true \
  -e jenkins_ssl_cert=path-to-ssl-cert \
  -e jenkins_ssl_key=path-to-ssl-key \
  jenkins.yml
```

### jumpserver

```
cat <<EOF >hosts
[jumpserver]
192.168.1.2
EOF

ansible-playbook -i hosts -u jumpserver \
  -e mysql_root_password=<root-password> \
  -e mysql_user_password=<user-password> \
  -e jumpserver_secret_key=<secret-key> \
  -e jumpserver_bootstrap_token=<bootstrap-token> \
  jumpserver.yml

ansible-playbook -i hosts -u jumpserver -t nginx -e enable_ssl=true jumpserver.yml
```
