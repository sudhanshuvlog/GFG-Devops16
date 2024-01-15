## DevOps

### Traditional vs DevOps

### Traditional

- **Development Team** - Bussiness Requirements -> Application Code -> Store the Code in Github -> Notify the Operations Team 
- **Operations Team**  - Download the Code from Github -> Do some manual testing ->  Deploy the Application in the Server

- It Consists of two teams: Development and Operations
- **Development team** - They are responsible for developing the application
- **Operations team** - They are responsible for deploying the application

### How Traditional Works?

- Development team will develop the application code and they will store the code somewhere in internet like github. Then, they notify the operation team through email that they have developed the application code and they have stored the code in github. 
- Then, the operation team will download the code from github and they will deploy the application in the server. So, the development and operations team will work separately to develop and deploy the application.

### Disadvantages of Traditional

- It is a manual process. So, it is time consuming.
- It is a error prone process.
- It have more TTM(Time to Market). So, it is not suitable for fast growing companies.

### DevOps

- **DevOps Team** - Bussiness Requirements -> Application Code -> Store the Code in Github -> Do some automated testing -> Deploy the Application in the Server

- It Consists of only one team: DevOps team
- **DevOps team** - They are responsible for developing and deploying the application

### How DevOps Works?

- DevOps is methodology which combines the development and operations team into one team. So, the development and operations team will work together to develop and deploy the application.

- DevOps is a umbrella which consists of multiple tools. So, we can use these tools to automate the process of developing and deploying the application.

### Advantages of DevOps

- It is a automated process. So, it is not time consuming.
- It is a less error prone process.
- It have less TTM(Time to Market). So, it is suitable for fast growing companies.

### DevOps Tools

- **Git** - It is a version control system. It is used to store the code in internet. It is used to track the changes in the code.
- **Jenkins** - It is a continuous integration tool. It is used to automate the process of building the code. It is used to automate the process of testing the code. It is used to automate the process of deploying the code.
- **Docker** - It is a containerization tool. It is used to automate the process of deploying the application.
- **Kubernetes** - It is a container orchestration tool. It is used to automate the process of deploying the application. It is used to automate the process of scaling the application. It is used to automate the process of managing the application.
- **Ansible** - It is a configuration management tool. It is used to automate the process of configuring the application. It is used to automate the process of managing the application.
- **Terraform** - It is a infrastructure provisioning tool. It is used to automate the process of provisioning the infrastructure. It is used to automate the process of managing the infrastructure.
- **Monitoring tools** - Graffana, Prometheus, Nagios, etc. It is used to monitor the application. It is used to monitor the infrastructure.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Git

### What is Git?

- Git is a version control system. It is used to store the code in internet. It is used to track the changes in the code.

### Why Git?

- If we want to store the code in internet then we have to use git. If we want to track the changes in the code then we have to use git.

### Basic Git Commands

- **git init** - It is used to initialize the git repository.
- **git status** - It is used to check the status of the git repository for tracking purpose.
- **git add** - It is used to add the files to the staging area.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Linux

### What is Linux OS?

- Linux is a open source operating system. It is a free operating system. It provides better Security, flexibility, stability, etc. It is used in servers, desktops, mobiles, etc.
- It Provides better Customization Support over Windows, Mac.
- There are various Linux Distribution like RedHat, Ubuntu, CentOS, etc. Each Linux Distribution has its own features and functionalities.
- In Linux, We can have command line interface and graphical user interface. We can use any one of them based on our requirement.
- In Linux, We can use command line interface to perform various operations.

### Basic Linux Commands

- **pwd** - It is used to print the current working directory.
- **ls** - It is used to list the files and directories in the current working directory.
- **cd** - It is used to change the directory.
- **mkdir** - It is used to create a directory.
- **touch** - It is used to create a file.
- **cat** - It is used to print the content of the file.
- **id** - It is used to print the user id and group id.

### Linux File System

- In Linux, We have a root director (/). All the files and directories are stored in the root directory.

### How to install Linux OS(any distribution)?

1. Bare Metal - Install Linux OS directly on the hardware.
2. Virtualization - Install Linux OS on the virtual machine. There are various virtualization tools like VirtualBox, Hyper-V, etc.
3. Cloud - Install Linux OS on the cloud. There are various cloud providers like AWS, Azure, GCP, etc.
4. Container - Install Linux OS on the container. There are various containerization tools like Docker, Kubernetes, etc.


### Hosting Apache Web Server on Linux OS

- Use the below command to install apache web server on Linux OS:
```
sudo yum install -y apache2
```

- Use the below Command to edit the index.html file:
```
sudo nano /var/www/html/index.html
```

- Use the below command to start the apache web server:
```
sudo systemctl start apache2
```

- Use the below command to stop the apache web server:
```
sudo systemctl stop apache2
```

### vi editor

- Use the below command to edit the file using vi editor:
```
vi <file-name>
```

- Use the below command to insert the text in the file:
```
i
```

- Use the below command to save the file:
```
:wq
```

- Use the below command to exit from the file without saving the file:
```
:q!
```