
Common
=========
Synopsis
----

Common configuration applied to all hosts for the Apollo Project.  It sets up common software, does a baseline security configuration, and adds/configures user accounts. 

On first run, this role should be executed as root (since no other accounts will have been configured). Note that this role disables the root account, so you must add at least one account with root privileges (see below), and subsequent applications of this role must use another privileged user.

Requirements
------------
This role targets a CentOS 7 minimal installation. 


Variables
--------------
Global, user-defined variables are listed below:

**No user-defined variables are in this role at this time**

Add Users
-----
This role disables access to the root account. Therefore, it is ~~highly advised~~ mandatory to setup an administrative account.
All files matching the `tasks/user_accounts/*_account.yml` glob will be executed by this role. Use this to setup your accounts, permissions, configurations, SSH, etc.
 
Example Playbook
-------
Run the play below with:

`ansible-playbook -i /path/to/inventory --vault-password-file /path/to/password/file --ask-become-pass`


`
---
# Configure a brand new system

- hosts: my_host
  roles:
    - common
  become: yes
  become_user: some_sudo_user
'

Note that the `become_user` may not be "root" after the first time this playbook is run; the root account is disabled in this play.

License
-------
TBD 

Author Information
------------------

* Alex Page, <alex.page@rochester.edu>
* Peter Dragos, <pdragos@u.rochester.edu>

