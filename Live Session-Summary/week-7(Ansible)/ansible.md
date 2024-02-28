## Ansible

### Why Ansible?

- Let's say we have 100 servers and we want to install a package on all of them. We can do it manually by ssh into each server and install the package. But it will take a lot of time and effort. Instead of doing it manually, we can use the automation tools like Ansible, Which can automate the server configuration for us.

### What is Ansible?

- Ansible is an open-source automation tool that automates the software provisioning, configuration management, and application deployment.

- Advantages of Ansible:
    - **Declarative**: We can define the system's state and Ansible will ensure that the system is in that state.
    - **Agentless**: We don't have to install any agent on the remote servers.
    - **Idempotent**: We can run the playbook multiple times and it will not change the state of the system if it is already in that state.

- Ansible is written in Python and it uses the YAML syntax to write the playbooks.

### Command to install Ansible on Amazon Linux 3

```bash
yum install ansible-core -y
```

### Ansible configuration file

- The default configuration file for Ansible is `/etc/ansible/ansible.cfg`.
- We have to run the command `ansible-config init --disabled > ansible.cfg` to initiate a new configuration file in the current directory.


### Inventory file in Ansible

The inventory file is used to define the list of servers(Target Node) on which we want to run Automate the configurations/services.
- By default, the inventory file is located at `/etc/ansible/hosts`.
- But we can edit the `ansible.cfg` file to define the location of the inventory file.
- Go to the `ansible.cfg` file and add the following line to define the location of the inventory file. For searching the inventory word in the file, If we use vim editor, We can use /inventory to search the word in the file.
```bash
inventory = ./inventory
```
- Let's create the inventory file and define the list of servers.

```bash
172.31.33.111 ansible_user=ec2-user ansible_ssh_private_key_file=key.pem
```

### Other options we have to change in the `ansible.cfg` file

- `host_key_checking = False`: This option is used to disable the host key checking. By default, it is set to `True` which means that Ansible will check the host key of the remote server before connecting to it. If we set it to `False`, it will not check the host key of the remote server.
- `become`, `become_user`, `become_method`: These options are used to define the user and method to become the root user on the remote server. By default, the `become` option is set to `False`. We can set it to `True` to become the root user on the remote server.

### Ansible Playbook

- Playbook is a file where we define the tasks that we want to run on the remote servers.
The playbook is written in YAML syntax.

### Example of a playbook

- Let's define the playbook to install the `httpd` package on the remote servers. 
- Create a file `httpd.yml` and define the following content in it.

```yaml
- hosts: all
  tasks:

    - name: Installing the HTTPD Package
      package:
        name: httpd
        state: present

    - name: Copying Files from Localhost to Remote
      copy:
        src: index.html
        dest: /var/www/html
        owner: root
        mode: '666'

    - name: Starting the Service
      service:
        name: httpd
        state: started
```

- This playbook will install the `httpd` package on all the remote servers, copy the `index.html` file from the localhost to the remote server, and start the `httpd` service on the remote server.

### Creating EC2 instances using Ansible

- We can use the `amazon.aws.ec2_instance` module to create the EC2 instances using Ansible.
- For using the `amazon.aws.ec2_instance` module, we have to install the collection `amazon.aws` using the following command.

```bash
ansible-galaxy collection install amazon.aws
```

- After installing the collection, we can use the `amazon.aws.ec2_instance` module to create the EC2 instances.
- Let's define the playbook to create the EC2 instances.
- Let's create a file `ec2.yml` and define the following content in it.

```yaml
- hosts: localhost
  vars_files:
    - credentials.yml
    - ec2-config.yml
  tasks:
    - package:
        name: python3-pip
        state: present

    - pip:
        name: boto3

    - amazon.aws.ec2_instance:
        aws_access_key: "{{ access_key }}"
        aws_secret_key: "{{ secret_access_key }}"
        region: "{{ region }}"
        image_id: "{{ ami_id }}"
        instance_type: "{{ instance_type }}"
        security_group: "{{ sg }}"
        count: "{{ count }}"
        key_name: "{{ key_pair }}"
        tags:
          name: ansible-demo
      register: ec2

    - debug:
        var: ec2
    - set_fact:
        private_ip: "{{ ec2.instances | map(attribute='private_ip_address') | list }}"

    - debug:
        var: private_ip

    - template:
        src: inventory.j2
        dest: inventory
```

- In the above playbook, we used one option like vars_files which allows us to define the variables in the separate files and use them in the playbook. We can define the variables in the `credentials.yml` and `ec2-config.yml` files and use them in the playbook.

- Let's create the `credentials.yml` file and define the variables in it.

```yaml
access_key: Your_Access_Key
secret_access_key: Your_Secret_Access_Key
```

- Let's create the `ec2-config.yml` file and define the variables in it.

```yaml
region: us-east-1
instance_type: t2.micro
count: 0
ami_id: ami-0e731c8a588258d0d
key_pair: key
sg: launch-wizard-13
```

- If you look at the playbook, we used for creating the EC2 instances, we have used different modules like `package`, `pip`, `amazon.aws.ec2_instance`, `debug`, `set_fact`, and `template`.
    - `package`: This module is used to install the package on the localhost.
    - `pip`: This module is used to install the Python package using pip.
    - `amazon.aws.ec2_instance`: This module is used to create the EC2 instances on AWS.
    - `debug`: This module is used to print the output of the previous task.
    - `set_fact`: This module is used to set the facts in the playbook.
    - `template`: This module is used to create the file from the template.

### Running the playbook

- We can run the playbook using the following command.

### Dynamic Inventory

- Currently, we are defining the list of servers in the inventory file manually. However, we can use the dynamic inventory to define the list of servers dynamically.
- For this purpose only we are using the `template` module in the above ec2.yml playbook to create the inventory file dynamically.
- If you look at that playbook, we used the `template` module to create the inventory file from the template `inventory.j2`.
- Let's create the `inventory.j2` file and define the following content in it.

```yaml
{% for ip in private_ip %}
{{ ip }}
{% endfor %}
```

### Running the playbook

- We can run the playbook using the following command.

```bash
ansible-playbook ec2.yml
```

### Load Balancer using Ansible

- We can also configure a reverse proxy with the help of a tool/program named `haproxy` to create the load balancer using Ansible.
- Let's create a playbook to install the haproxy package and configure the load balancer.
- Create a file `load-balancer.yml` and define the following content in it.


```yaml
- hosts: localhost
  tasks:
    - package:
        name: haproxy
        state: present 
```

- In the above playbook, we used the `package` module to install the `haproxy` package on the localhost.
- So that our localhost will act as a load balancer.
- We can run the playbook using the following command.

```bash
ansible-playbook load-balancer.yml
```

- After running the playbook, we have to configure the `haproxy` to act as a load balancer.
- We need to add our remote servers to the `haproxy` configuration file.
- Normally, the `haproxy` configuration file is located at `/etc/haproxy/haproxy.cfg`.
- We have to edit the `haproxy.cfg` file and define the list of servers in it.

```bash
#---------------------------------------------------------------------
# Example configuration for a possible web application.  See the
# full configuration options online.
#
#   https://www.haproxy.org/download/1.8/doc/configuration.txt
#
#---------------------------------------------------------------------

#---------------------------------------------------------------------
# Global settings
#---------------------------------------------------------------------
global
    # to have these messages end up in /var/log/haproxy.log you will
    # need to:
    #
    # 1) configure syslog to accept network log events.  This is done
    #    by adding the '-r' option to the SYSLOGD_OPTIONS in
    #    /etc/sysconfig/syslog
    #
    # 2) configure local2 events to go to the /var/log/haproxy.log
    #   file. A line like the following can be added to
    #   /etc/sysconfig/syslog
    #
    #    local2.*                       /var/log/haproxy.log
    #
    log         127.0.0.1 local2

    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haproxy
    group       haproxy
    daemon

    # turn on stats unix socket
    stats socket /var/lib/haproxy/stats

    # utilize system-wide crypto-policies
    ssl-default-bind-ciphers PROFILE=SYSTEM
    ssl-default-server-ciphers PROFILE=SYSTEM

#---------------------------------------------------------------------
# common defaults that all the 'listen' and 'backend' sections will
# use if not designated in their block
#---------------------------------------------------------------------
defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    option http-server-close
    option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000

#---------------------------------------------------------------------
# main frontend which proxys to the backends
#---------------------------------------------------------------------
frontend main
    bind *:5000
    acl url_static       path_beg       -i /static /images /javascript /stylesheets
    acl url_static       path_end       -i .jpg .gif .png .css .js

    use_backend static          if url_static
    default_backend             app

#---------------------------------------------------------------------
# static backend for serving up images, stylesheets and such
#---------------------------------------------------------------------
backend static
    balance     roundrobin
    server      static 127.0.0.1:4331 check

#---------------------------------------------------------------------
# round robin balancing between the various backends
#---------------------------------------------------------------------
backend app
    balance     roundrobin
    server  app1 127.0.0.1:5001 check
    server  app2 127.0.0.1:5002 check
    server  app3 127.0.0.1:5003 check
    server  app4 127.0.0.1:5004 check
    server  app5 3.92.163.129:80 check
    server  app6 54.82.77.72:80 check
```

- In the above configuration file, we defined the list of servers in the `backend app` section.
- Now the last thing we have to do is to start the `haproxy` service.

```bash
systemctl start haproxy
```
- After starting the `haproxy` service, we can access the load balancer using the public IP of the localhost on port 5000.

**Now we deployed a Load Balancer and 2 Web Servers. The problem we have is we manually need to update the Load Balancer IP in the /etc/haproxy/haproxy.cfg file.**

### Dynamic IP updation in /etc/haproxy/haproxy.cfg file

- We are going to update the load-balancer.yml file to dynamically update the IP of the web servers in the haproxy.cfg file.
```yaml
- hosts: localhost
  vars_files:
    - credentials.yml
    - ec2-config.yml
  tasks:
    - package:
        name: haproxy
        state: present

    - amazon.aws.ec2_instance_info:
        aws_access_key: "{{ access_key }}"
        aws_secret_key: "{{ secret_access_key }}"
        region: "{{ region }}"
        filters:
          "tag:Name": "ansible-demo"
          instance-state-name: ["running"]
      register: ec2

    - set_fact:
        private_ip: "{{ ec2.instances | map(attribute='private_ip_address') | list }}"

    - debug:
        var: private_ip

    - template:
        src: haproxy.j2
        dest: /etc/haproxy/haproxy.cfg

    - service:
        name: haproxy
        state: restarted
```

- What we did here is we are going to get the instances that are created by our ec2.yml playbook and then we going to get the private IP of the instances and then we are going to update the haproxy.cfg file with the private IP of the instances.
- **aws.ec2_instance_info** is a module that is used to get the information of the instances that are created by the ec2.yml playbook.
- **register** is a keyword that is used to store the output of the module in a variable. In our case `ec2` variable.
- **set_fact** is a module that is used to set the value of a private_ip variable.
- **template** is a module that is used to update the haproxy.cfg file with the private IP of the instances.
- **debug** is a module that is used to print the value of the private_ip variable.

- You can see that in `load-balancer.yml` file, We used to use the `template` module to update the haproxy.cfg file. But we need to create a template file to update the haproxy.cfg file. So we need to create a template file called `haproxy.j2` in the same directory where the `load-balancer.yml` file is present.
- Let's create a `haproxy.j2` file.
```yaml
#---------------------------------------------------------------------
# Example configuration for a possible web application.  See the
# full configuration options online.
#
#   https://www.haproxy.org/download/1.8/doc/configuration.txt
#
#---------------------------------------------------------------------

#---------------------------------------------------------------------
# Global settings
#---------------------------------------------------------------------
global
    # to have these messages end up in /var/log/haproxy.log you will
    # need to:
    #
    # 1) configure syslog to accept network log events.  This is done
    #    by adding the '-r' option to the SYSLOGD_OPTIONS in
    #    /etc/sysconfig/syslog
    #
    # 2) configure local2 events to go to the /var/log/haproxy.log
    #   file. A line like the following can be added to
    #   /etc/sysconfig/syslog
    #
    #    local2.*                       /var/log/haproxy.log
    #
    log         127.0.0.1 local2

    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haproxy
    group       haproxy
    daemon

    # turn on stats unix socket
    stats socket /var/lib/haproxy/stats

    # utilize system-wide crypto-policies
    ssl-default-bind-ciphers PROFILE=SYSTEM
    ssl-default-server-ciphers PROFILE=SYSTEM

#---------------------------------------------------------------------
# common defaults that all the 'listen' and 'backend' sections will
# use if not designated in their block
#---------------------------------------------------------------------
defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    option http-server-close
    option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000

#---------------------------------------------------------------------
# main frontend which proxys to the backends
#---------------------------------------------------------------------
frontend main
    bind *:5000
    acl url_static       path_beg       -i /static /images /javascript /stylesheets
    acl url_static       path_end       -i .jpg .gif .png .css .js

    use_backend static          if url_static
    default_backend             app

#---------------------------------------------------------------------
# static backend for serving up images, stylesheets and such
#---------------------------------------------------------------------
backend static
    balance     roundrobin
    server      static 127.0.0.1:4331 check

#---------------------------------------------------------------------
# round robin balancing between the various backends
#---------------------------------------------------------------------
backend app
    balance     roundrobin
  {% for ip in private_ip %}
  server app{{ ip.split('.')[-1] }} {{ ip }}:80 check
  {% endfor %}
```

- In the above file we used Jinja syntax to create a loop to update the private IP of the instances in the haproxy.cfg file.

- Now we need to run the `load-balancer.yml` file to update the haproxy.cfg file.
```bash
ansible-playbook load-balancer.yml
```
- After running the above command, you can see that the haproxy.cfg file is updated with the private IP of the instances.

### Get the IP address of our server on our Page:

- We can use the backend service of our httpd server to show the IP of the server on our page(Basically we are going to do server-side programming)
- For this purpose, We are going to use the Python `subprocess` module to get the IP of the server and then we are going to use the IP in our page.
- Let's create `python_cgi_ip.py` file
```
#!/usr/bin/env python3

import subprocess

print("Content-type: text/html\n")  # CGI header

print("<html>")
print("<head><title>CGI ifconfig</title></head>")
print("<body>")

ifconfig_output = subprocess.getoutput("ifconfig")
print("<pre>{}</pre>".format(ifconfig_output))
print("</body>")
print("</html>")
```

- We are going to copy this file to our httpd server and then we are going to use this backend server to get the IP of the server in our page.
- This step also we are going to automate using ansible.
- Let's update the `httpd.yml` file to copy the `python_cgi_ip.py` file to the httpd server.
```yaml
- hosts: all
  tasks:

    - name: Installing the HTTPD Package
      package:
        name: httpd
        state: present

    - name: Copying Files from Localhost to Remote
      copy:
        src: index.html
        dest: /var/www/html
        owner: root
        mode: '666'

    - name: "copy the cgi program"
      copy:
        src: python_cgi_ip.py
        dest: /var/www/cgi-bin/ip.py

    - command: "chmod +x /var/www/cgi-bin/ip.py"

    - name: Starting the Service
      service:
        name: httpd
        state: started
```

- In the above `httpd.yml` file, We added a new task to copy the `python_cgi_ip.py` file to the httpd server.
- We also added a new task to change the permission of the `python_cgi_ip.py` file to executable.
- Now, Let's run the `httpd.yml` file to copy the `python_cgi_ip.py` file to the httpd server.
```bash
ansible-playbook httpd.yml
```
- Now we can go to load balancer IP in the browser, and the load balancer will automatically route you to your backend targets, and you can verify this by looking into the printed IP of the server in your web app.


### Ansible roles

- Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content into roles, you can easily reuse them and share them with other users.
- Run `ansible-galaxy init role-name` to create a new role.
- After running the above command, You can see that a new directory called `role-name` is created with the following structure.
```
role-name
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   └── main.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml
```
- We just need the arrange the files in the above structure and then we can use the role in our playbook.

### Ansible Vault

- Ansible Vault is a feature of Ansible that allows you to keep sensitive data such as passwords or keys in encrypted files, rather than as plaintext in your playbooks or roles.
- You can use ansible-vault to encrypt the file and then you can use the file in your playbook.
- Run `ansible-vault create file-name` to create a new encrypted file. It will ask for a password to encrypt the file.
- You can also put that password in another file and use that file to encrypt the file.
- Run `ansible-vault create file_name --vault-password-file file_name_where_your_passwdIsStored` to encrypt the file.
- If we used any encrypted file in our playbook, We need to use `ansible-playbook --vault-password-file playbook.yml` to run the playbook.

- **Note**: You can also use `ansible-vault edit file_name` to edit the encrypted file.
