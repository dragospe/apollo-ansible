
Common
=========
Synopsis
----

Common configuration applied to all hosts for the Apollo Project.  It sets up common software, does a baseline security configuration, and adds/configures user accounts. 

This role should be run as root, since no other accounts will have been configured. Note that this role disables the root account, so you must add at least one account with root privileges (see below.)

Requirements
------------
This role targets a CentOS 7 minimal installation. 


Variables
--------------
Global, user-defined variables are listed below:

**No user-defined variables are in this role at this time**

Add Users
-----
This role disables password access for the root account. Therefore, it is ~~highly advised~~ mandatory to setup an administrative account.
All files matching the `tasks/user_accounts/*_account.yml` glob will be executed by this role. Use this to setup your accounts, permissions, configurations, SSH, etc.
 
License
-------
TBD 

Author Information
------------------

* Alex Page, <alex.page@rochester.edu>
* Peter Dragos, <pdragos@u.rochester.edu>

