## Networking

### What is a networking?
Networking refers to two or more computers sharing information and communicate with each other. It follows a set of rules to communicate called protocols.

### For devices to communicate with one other three things are required:
1. IP Address
2. Wireless or wired connection
3. To be on the same network

### What does that Same network mean?
- It means that the devices are connected to the same router or within same subnet.

### What is a IP Address?
- It is 32 bit number that uniquely identifies a device on a network. Example:**172.16.0.0**
- It is divided into 4 octets of 8 bits each.
- Each octet is converted to decimal number and separated by a dot.
- It is divided into two parts: Network ID and Host ID.
- Network ID identifies the network and Host ID identifies the host or you can say like it defines the range of IP addresses that can be assigned to hosts.
- IP adress examples are: **172.16.1.3**, **00001010.00010000.00000001.00000011**. This two are the known forms but we can also write in decimal form like **2886735875**, It's also a valid IP address.
- Dots are nothing but a way to separate the octets, They are not part of the IP address.
- Normally computers will see the IP address in binary form without dots. Example: **00001010000100000000000100000011**.

### How to identify whether two devices are on the same network?
- We can use netmask to identify whether two devices are on the same network or not.
- We can use & operator on IP address and subnet mask to get the network ID.
- We have to do & on operation on both the devices and if the result is same then they are on the same network.
- Example: **
    IP Address: 172.16.1.3 (00001010.00010000.00000001.00000011)
    Subnet Mask: 255.255.0.0 (11111111.11111111.00000000.00000000)
    Network ID: 00001010.00010000.00000001.00000011

### Real Life Scenario of Router
- Let's consoder a scenario where we have a LAN(Local Area Network) and we have two computers inside the network.
- These two computers are connected to each with wired or wireless connection inside the network.
- When we want to share data between these two computers, it uses private ip address to communicate with each other.
- But when we want to share data with other computers outside the network, we need a router.
- Router is a device that connects two or more networks.
- **How Router Works?**
    - When we want communicate with outside network, we send the data to router and router sends the data to the outside network.
    - Fisrt, Let's Say we have System-A and it wnat to share data on internet(google.com).
    - Since because we don't have a public IP address, we cannot communicate with google.com.
    - So, we send the data to router and router sends the data to google.com.
    - When we send data, it will automatically create network packet. Network packet is nothing but it contains the source IP address, destination IP address and the data.
    - When the router receives the packet, it will change the source IP address to it's own public IP address and sends the packet to google.com.
    - When google.com receives the packet, it will send the data to router.
    - Router will change the destination IP address to the private IP address of System-A and sends the data to System-A.
    - Inside Router, it has a table called routing table. It contains the information about the network.
    - And it also have NAT Gateway. NAT stands for Network Address Translation. It is used to convert the private IP address to public IP address and vice versa.
    - This is how router works.

### Some Information about AWS Amazon Linux:
- We can use instance connect only if we use Amazon Linux AMI.
- For other OS, we have to use SSH.

### Some Information about ICMP:
- Even though, if we create two instance in same subnet, we cannot ping one instance from another instance.
- Because ICMP is blocked by default in AWS.
- We have to create a security group and allow ICMP traffic to ping one instance from another instance.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Git and GitHub:
- Git is a version control system.
- GitHub is a cloud based service that hosts Git repositories.
- GitHub is a Centralized Version Control System.
- We can use both Git and GitHub to track changes in our code.

### Git
- We can use Git to track changes in our code.
- We can install git and use it locally.

### .git folder
- When we initialize git in a folder, it will create a .git folder.
- Initialization means running `git init` command.
- If we want git to track changes in a folder, we have to initialize git in that folder.
- .git folder contains all the information about the changes that we made in our code.

### Git Commands
- **git init** :  It is used to initialize git in a folder.
- **git status** : It is used to check the status of the git.
- **git add** : It is used to add the files to the staging area.
- **git commit** : It is used to commit the changes.
- **git log** : It is used to check the commit history.
- **git reset <commit-id>** : It is used to reset the code to the previous commit.
- **git checkout <commit-id>** : It is used to switch between commits.
- **git diff** : It is used to check the difference between the current code and the previous code.
- **git checkout <branch-name>** : It is used to switch between branches.
- **git branch <branch-name>** : It is used to create a new branch.
- **git merge <branch-name>** : It is used to merge the branch with the master branch.
- **git clone <repo-url>** : It is used to clone a repository from GitHub.
- **git remote add origin <repo-url>** : It is used to add a remote repository.
- **git push origin <branch-name>** : It is used to push the code to the remote repository.
- **git pull origin <branch-name>** : It is used to pull the code from the remote repository.

### GitHub
- We can use GitHub to host our code, collaborate with others and track changes in our code.
- We can also use GitHub to deploy our code.

### Authentication in GitHub
- We can use HTTPS or SSH to authenticate with GitHub.
- For HTTPS, we have to enter our username and password everytime we push the code to GitHub.
- For SSH, we have to generate SSH key and add it to GitHub.
- We can generate SSH key using `ssh-keygen` command.

### GitKraken
- It is a GUI tool for Git.
- We can use it to visualize the changes, branches and commits.