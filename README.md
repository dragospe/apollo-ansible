
# apollo_ansible

Ansible setup for the APOLLO-AF project. This repo consists of inventory, vars, and roles required to deploy and configure the project.

## Role Overview:


| Role        | Description                                                                                                                               |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| apollo_monitor  | Configures a host to perform monitoring functions (grafana).                                                                              |
| apollo_pg   | Configures a host running postgreSQL to function as apollo's long-term data store.                                                        |
| apollo_scripts  | Configures a host to run scripts related to geneACTIV, medtronic, REDCap, etc.                                                         |
| apollo_ts   | Configures a host running postgreSQL and timescaledb to function as apollo's timeseries database. |
| common      | Common configuration applied to all hosts, including common software, user accounts, security hardening, etc.                             |




## Lifecycle Environments


This repository is designed to configure development (`dev`), testing (`test`), and production (`prod`) lifecycle enviornments. To do so, three different inventory files in their respective directories under the `hosts/[lifecycle state]/` directory. 

Variables specific to each lifecycle state may be set in accordance with inventory-based variables ([`group_vars`](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#assigning-a-variable-to-many-machines-group-variables)  , [`host_vars`](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#assigning-a-variable-to-one-machine-host-variables), etc.)

*Note:* In ansible, `group_vars` take precedence over variables in `roles/[rolename]/defaults/main.yml`. 

### Variables
Variables that relate to site-wide or lifecycle-wide configuration are listed below.

Complete descriptions of *role-specific* variables (required or optional) may be found in the respective `README.md` files. 

|Variable      | Description                                                                                                                               |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------|
|lifecycle_state|: Either 'dev', 'test', or 'prod', depending on the inventory file used.


### Prerequisites

* install ansible

* create `vault_pass.txt` in `secrets/` containing the vault password

* Fill out the appropriate entries in the `hosts/[lifecycle state]/inventory` file.

* Fill out required variables for the groups, roles, and playbooks you are applying.

## Deployment

Run this to configure everything on the `test` environment:

    ansible-playbook site.yml -i hosts/test/inventory --vault-password-file secrets/vault_pass.txt [-K]

(`-K` is only needed for local sudo.)

Run this to configure just the timeseries database on the `dev` environment:

    ansible-playbook apollo_ts.yml -i hosts/dev/inventory --vault-password-file secrets/vault_pass.txt  

## Authors

* Alex Page, <alex.page@rochester.edu>
* Peter Dragos, <pdragos@u.rochester.edu>

