apollo_ts
=========

This role configures a host to work as the timeseries database for the apollo project. It consists of a postgreSQL 11 database server with the timescale extension. It pulls directly from the PostgreSQL Global Development Group (PGDG) and timescaledb repositories.

Requirements
------------
This role targets a CentOS 7 minimal installation with the `common` role applied as a pre-requisite.  

**Required files:**
Found under `files/`, these files must be supplied by users of this role:

|File: | Purpose: | Vaulted: |
|------|----------|----------|
|apollo_monitor_postgresql_password | The database password for the `apollo_monitor` postgresql account. | Yes |
| default_postgresql_user_password | The database password for the default postgresql user ( set in `{{ apollo_ts_postgresql_user }}`, defaults to `postgres`) | Yes|
| [env]_apollo_ts_server.crt | The postgresql server's ssl certificate. `env` should be one of `dev`, `test` or `prod`. | No |
| [env]_apollo_ts_server.key | The postgresql server's ssl private key. Should be in a raw RSA format (not .pem) | Yes |


Role Variables
--------------

A description of the variables that may be set by users of this role can be found below. The "Default" designation specifies the default *as if the role was applied to a host directly*. Thus, if the primary source of truth about the variable is in `group_vars`, it will *not* have a default value; in particular, variables that are dependent upon environment (ip addresses, etc) to not have default values. The "Decalared in" column specifies the files in which the variable is declared, in order of decreasing precedence. 

| Variable:                            	| Choices/Defaults:                                                                                                                                                                	| Declared in:                                                                      	| Comments:                                                           	|
|--------------------------------------	|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|-----------------------------------------------------------------------------------	|---------------------------------------------------------------------	|
| apollo_ts_postgresql_user            	| *Default*: postgres                                                                                                                                                              	|   hosts/[env]/group_vars/all/apollo_ts.yml <br> roles/apollo_ts/defaults/main.yml 	| The primary postgres user                                           	|
| apollo_ts_postgresql_group           	| *Default*: postgres                                                                                                                                                              	| hosts/[env]/group_vars/all/apollo_ts.yml <br> roles/apollo_ts/defaults/main.yml   	| The primary postgres group                                          	|
| __apollo_ts_postgresql_data_dir      	|  *Default*: `var/lib/pgsql/11/data`                                                                                                                                              	| roles/apollo_ts/defaults/main.yml                                                 	| The data postgresql data directory                                  	|
| __apollo_ts_postgresql_bin_path      	| *Default*: `/usr/pgsql-11/bin`                                                                                                                                                   	| roles/apollo_ts/defaults/main.yml                                                 	| The directory containing postgres-related binaries                  	|
| __apollo_ts_postgresql_config_path   	| *Default*: `/var/lib/pgsql/11/data`                                                                                                                                              	| roles/apollo_ts/defaults/main.yml                                                 	| The directory containing configuration data, e.g. `postgesql.conf`. 	|
| apollo_ts_postgresql_hba_entries     	| *Format*: A list of dictionaries, expecting the following keys: <br> 'type', 'database, 'user', 'auth_method', 'address', 'ip_address', 'ip_mask', 'auth_method', 'auth_options' 	| hosts/[env]/group_vars /apollo_ts.yml                                             	| See https://www.postgresql.org/docs/11/auth-pg-hba-conf.html        	|
| __apollo_ts_postgresql_database_name 	| *Format*: string                                                                                                                                                                 	|  hosts/[env]/group_vars/apollo_ts.yml                                            	| The name of the timeseries database.                                	|
| apollo_ts_postgresql_listen_address  	| *Format*: List of IP addresses                                                                                                                                                          	| hosts/[env]/group_vars/apollo_ts.yml                                                                                  	|                                                                     	|



Environment Notes
-----------------

**[dev]:**
The development enviroment uses self-signed ssl certificates. The following files are included for reference:

* The certificate authority signing key is stored under `hosts/dev/files/cakey.pem`. 
* The certificate authority certificate is stored under `hosts/dev/files/cacert.pem`. 


Role Usage:
----------------
Before the first run:

* Set environment-specific variables in the `hosts/[env]/group_vars/apollo_ts/apollo_ts.yml` file.
* Supply the required files (see ** Requirements > Required Files ** in this document.
* Supply the vault password

Example Playbook (applying the `apollo_ts` role to hosts in the `apollo_ts` group):

    - hosts: apollo_ts
      roles:
        - common
        - apollo_ts    


Example invocation (applying to the `[dev]` environment):

    ansible-playbook playbook.yml -i hosts/dev/inventory --vault-password-file ~/.vault-password.txt


License
-------

To be determined

Author Information
------------------
Alex Page, <alex.page@urmc.rochester.edu>
Peter Dragos, <pdragos@u.rochester.edu>