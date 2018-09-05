# apollo_ansible

Ansible setup for the APOLLO-AF project

### Prerequisites

* install ansible

* create `vault_pass.txt` in `secrets/` containing the vault password

* link `hosts` to `/etc/ansible/hosts`

## Deployment

`ansible-playbook playbook.yaml --vault-password-file secrets/vault_pass.txt [-K]

`-K` is only needed for local sudo.

## Authors

* Alex Page, alex.page@rochester.edu
