# apollo_ansible

Ansible setup for the APOLLO-AF project. This repo consists of inventory, vars, and roles required to deploy the project.

## Role Overview:


| Role        | Description                                                                                                                               |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| apollo_pg   | Configures a host running postgreSQL to function as apollo's long-term data store.                                                        |
| apollo_ts   | Configures a host running postgreSQL and timescaledb to function as apollo's timeseries database. Depends on pg_database and ts_database. |
| common      | Common configuration applied to all hosts, including common software, user accounts, security hardening, etc.                             |
| datasource  | Configures a host to act as a data source, for geneACTIV, medtronic, REDCap, etc.                                                         |
| monitoring  | Configures a host to perform monitoring functions (grafana).                                                                              |


## Lifecycle Architecture


This repository is designed to configure development (`dev`), testing (`test`), and production (`prod`) lifecycle enviornments. To do so, three different `inventory` files, `secrets.yml`, and `group_vars` and `host_vars` files are maintained under the "hosts" directory.

A complete description of all variables (required or optional) that should be set of each *role* is found in the respective `README.md` file. 

**NOTE:** In ansible, `group_vars` take precedence over variables in `roles/[rolename]/defaults/main.yml`. 


### Prerequisites

* install ansible

* create `vault_pass.txt` in `secrets/` containing the vault password

* link `/etc/ansible/hosts` to this repo's `hosts` file (optional; could point ansible.cfg to the inventory file instead, or use `-i` with ansible commands)

## Deployment

Run this to configure everything:

    ansible-playbook playbook.yaml --vault-password-file secrets/vault_pass.txt [-K]

`-K` is only needed for local sudo.

## Authors

* Alex Page, <alex.page@rochester.edu>
* Peter Dragos, <pdragos@u.rochester.edu>
