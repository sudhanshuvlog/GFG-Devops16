# DevOps

## Traditional vs DevOps

### Traditional

- **Development Team**:
  - Business Requirements -> Application Code -> Store the Code on a centralise location -> Notify the Operations Team
- **Operations Team**:
  - Download the Code from GitHub -> Perform Manual Testing -> Deploy the Application on the Server

- Involves two distinct teams: Development and Operations.
- **Development Team**: Responsible for application development.
- **Operations Team**: Responsible for testing and deploying the application.

#### How Traditional Works?

The development team develops the application code and stores it in a centralized location on the Internet. They notify the operations team via email about the code completion. The operations team then downloads the code, conducts manual testing, and deploys the application to the server. This model keeps development and operations teams working separately.

#### Disadvantages of Traditional

- Manual process, leading to time-consuming tasks.
- Prone to errors.
- Longer Time to Market (TTM), making it unsuitable for fast-growing companies.

### DevOps

- **DevOps Team**:
  - Business Requirements -> Application Code -> Store the Code on GitHub -> Automated Testing -> Deploy the Application on the Server

- Consists of a single DevOps team responsible for both development and deployment.

#### How DevOps Works?

DevOps is a methodology that integrates development and operations into a single team. The DevOps team collaboratively develops and deploys applications quickly and with fewer bugs.

DevOps utilizes various tools to automate the development and deployment processes, ensuring efficiency.

#### Advantages of DevOps

- Automated process, reducing time consumption.
- Less error-prone.
- Shorter Time to Market (TTM), suitable for fast-growing companies.

#### DevOps Tools

- **Git**: Version control system for code storage and change tracking.
- **Jenkins**: Continuous integration tool for automating code building, testing, and deployment.
- **Docker**: Containerization tool for automated application deployment.
- **Kubernetes**: Container orchestration tool for managing and scaling applications.
- **Ansible**: Configuration management tool for automating application configuration.
- **Terraform**: Infrastructure provisioning tool for automating infrastructure management.
- **Monitoring tools**: Grafana, Prometheus, Nagios, etc., for application and infrastructure monitoring.

---

## Git

### What is Git?

Git is a version control system used to track changes in a local development environment.

### Why Git?

Git is essential for storing code and tracking code changes.

### Basic Git Commands

- **git init**: Initializes a Git repository.
- **git status**: Checks the status of the Git repository.
- **git add**: Adds files to the staging area.

---

## Linux

### What is Linux OS?

Linux is an open-source operating system known for its free, secure, flexible, and stable nature. It is used in servers, desktops, and mobiles.

### Basic Linux Commands

- **pwd**: Prints the current working directory.
- **ls**: Lists files and directories.
- **cd**: Changes the directory.
- **mkdir**: Creates a directory.
- **touch**: Creates a file.
- **cat**: Prints the content of a file.
- **id**: Prints user and group IDs.

### Linux File System

In Linux, all files and directories are stored in the root directory (/).

### How to Install Linux OS (Any Distribution)?

1. **Bare Metal**: Install Linux OS directly on the hardware.
2. **Virtualization**: Install Linux OS on a virtual machine using tools like VirtualBox or Hyper-V.
3. **Cloud**: Install Linux OS on the cloud using providers like AWS, Azure, or GCP.
4. **Container**: Install Linux OS on containers using tools like Docker or Kubernetes.

### Hosting Apache HTTPD Web Server on Redhat Linux OS

- Use the below command to install Apache web server on Linux OS:
```
sudo yum install -y httpd
```

- Use the below Command to edit the index.html file:
```
sudo vi /var/www/html/index.html
```

- Use the below command to start the Apache web server:
```
sudo systemctl start httpd
```

- Use the below command to stop the Apache web server:
```
sudo systemctl stop httpd
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
