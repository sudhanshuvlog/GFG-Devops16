# Networking

## What is Networking?

Networking refers to the communication and information-sharing between two or more computers. This communication follows a set of rules known as protocols.

## Three Requirements for Devices to Communicate:

1. **IP Address**
2. **Wireless or Wired Connection**
3. **Being on the Same Network**

## Meaning of "Same Network":

Devices on the same network are connected to the same router or within the same subnet.

## What is an IP Address?

- A 32-bit number uniquely identifying a device on a network (e.g., **172.16.0.0**,  **13332433**).
- It can be divided into 4 octets of 8 bits each(We normally see IP in this format).
- Octets are converted to decimal numbers and separated by dots.
- IP adress examples are: **172.16.1.3**, **00001010.00010000.00000001.00000011**. These two are the known forms but we can also write in decimal form like **2886735875**, It's also a valid IP address.
- Dots are nothing but a way to separate the octets, They are not part of the IP address.
- Normally computers will see the IP address in binary form without dots. Example: **00001010000100000000000100000011**.

## How to Identify Whether Two Devices Are on the Same Network?

- Use a netmask to identify whether two devices are on the same network.
- Apply the & operator on the IP address and subnet mask to get the Network ID.
- If the results are the same for both devices, they are on the same network.

Example:
   IP Address: 172.16.1.3 (00001010.00010000.00000001.00000011)
   Subnet Mask: 255.255.0.0 (11111111.11111111.00000000.00000000)
   Network ID: 00001010.00010000.00000001.00000011

## Real-Life Scenario of Router

Consider a LAN (Local Area Network) with two computers connected. When sharing data within the network, private IP addresses are used with Switch Device. To communicate outside the network, a router is required.

### How Router Works:
- When we want to communicate with the outside network, we send the data to the router and the router sends the data to the outside network.
    - First, Let's Say we have System-A and it wants to share data on the internet(google.com).
    - Since because we don't have a public IP address, we cannot communicate with google.com.
    - So, we send the data to the router and the router sends the data to google.com.
    - When we send data, it will automatically create a network packet. A network packet is nothing but it contains the source IP address, destination IP address, and the data.
    - When the router receives the packet, it will change the source IP address to its own public IP address and send the packet to google.com.
    - When google.com receives the packet, it will send the data to the router.
    The router will change the destination IP address to the private IP address of System-A and send the data to System-A.
    - Inside the Router, it has a table called the NAT/PAT table. It contains the information about the network.
    - NAT stands for Network Address Translation. It is used to convert a private IP address to a public IP address and vice versa.
    - This is how a router works.

## Information about AWS Amazon Linux

- We can connect to an Amazon Linux Instance via the AWS Webui Instance connect option, It's not available for the other images.
- For other OS, you can use SSH to connect.

## Information about ICMP Protocol(Ping use ICMP Protocol)

- ICMP is blocked by default in AWS default Security Group.
- Create/Edit an existing security group by allowing ICMP traffic in the inbound rules to ping between instances.

---

# Git and GitHub
- Git is a version control system.
- GitHub is a cloud-based service that hosts Git repositories.
- GitHub is a Centralized Version Control System.
- We can use both Git and GitHub to track changes in our code.

## Git

Git is a version control system used to track changes in code. It is installed locally, and a `.git` folder is created when initializing a repository.

### .git folder
- When we initialize git in a folder, it will create a .git folder.
- Initialization means running `git init` command.
- If we want git to track changes in a folder, we have to initialize git in that folder.
- .git folder contains all the information about the changes that we made in our code.

### Git Commands

- **git init**: Initializes git in a folder.
- **git status**: Checks the status of git.
- **git add**: Adds files to the staging area.
- **git commit**: Commits changes.
- **git log**: Displays commit history.
- **git reset <commit-id>**: Resets code to a previous commit.
- **git checkout <commit-id>**: Switches between commits.
- **git diff**: Shows differences between current and previous code.
- **git checkout <branch-name>**: Switches between branches.
- **git branch <branch-name>**: Creates a new branch.
- **git merge <branch-name>**: Merges a branch with the master branch.
- **git clone <repo-url>**: Clones a repository from GitHub.
- **git remote add origin <repo-url>**: Adds a remote repository.
- **git push origin <branch-name>**: Pushes code to the remote repository.
- **git pull origin <branch-name>**: Pulls code from the remote repository.

## GitHub

GitHub hosts code facilitates collaboration, and tracks changes. Authentication can be done via HTTPS or SSH.

### Authentication in GitHub

- Use HTTPS with a username and password/Github token.
- For SSH, generate and add an SSH key with `ssh-keygen` command.

## GitKraken

GitKraken is a GUI tool for Git. It visualizes changes, branches, and commits.

