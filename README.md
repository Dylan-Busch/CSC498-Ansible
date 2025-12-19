# CSC498-Ansible
Ansible environment with the following capabilities:
  - join Linux hosts to a domain
  - join Windows hosts to a domain
  - create Linux domain controller
  - create Windows domain controller
  - create SMB Windows fileshare
  - create FTP Linux fileshare
  - create Linux mail server
  - create Kali Cyber Competition host
  - create Linux web server
  - create Linux MySQL database server
  - create Windows web server
  - create Windows MSSQL database server
  - setup Wordpress web application on the Linux web server

## Setup Ansible on the control node
Run the following command to install Ansible

```
pipx install --include-deps ansible
```

The following Ansible modules are utilized within these playbooks
- ansible.postfix
- ansible.windows
- automatesql.mssql
- community.general
- community.mysql
- community.windows
- community.vmware
- microsoft.ad
- microsoft.iis

Install all modules with the following command
```
ansible-galaxy collection install ansible.postfix ansible.windows automatesql.mssql community.general community.mysql community.windows community.vmware microsoft.ad microsoft.iis
```
	
## Create Managed Node Inventory
**Ansible Configuration File is located at `/etc/ansible.ansible.cfg`**

Edit ansible.cfg to specify the inventory.yml file location on your system
```
[defaults] 
inventory = /home/user1/ansible/inventory.yml
```

### Use the inventory.yml and secrets.yml files to create the inventory for managed nodes in the environment. These currently contain sample data for an example layout in YAML format

## Utilizing Playbooks
Each folder has at least one playbook and its corresponding variables file
  - modify the variables file with the information specific to your environment
  - ensure all hosts the playbook is managing have assigned IP addresses
  - ensure all host information is within the inventory file
  - Run a playbook with the command:
```
ansible-playbook playbookname.yml
```
