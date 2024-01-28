# Git Commands

## Git Reset

- **git reset --soft HEAD~1**: Resets the commit history to the previous commit, Will keep the changes in the staging area, and will not make any changes on the working area
- **git reset --mixed HEAD~1**: Resets the commit history to the previous commit, It will unstage the changes, and will not make any changes to the working area 
- **git reset --hard HEAD~1**: Resets the commit history to the previous commit, discarding changes from everywhere.
- In soft and mixed reset, changes remain in the staging area and working directory, respectively, allowing for recommit.
- In a hard reset, changes are lost, and the commit history cannot be recovered.
- Soft and mixed reset allow retrieval of commit history with the old commit ID.

## Git Revert

- **git revert <commit-id>**: Preserves commit history by creating a new commit that undoes changes.

## Git Stash

- **git stash**: Saves changes in the stash, leaving the working directory clean.
- **git stash list**: Lists all stashes.
- **git stash save "message"**: Saves changes in the stash with a message.
- **git stash show stash@{0}**: Shows changes in the stash with stash id=0.
- **git stash pop stash@{0}**: Adds stash changes to the working directory, deleting the stash.
- **git stash apply stash@{0}**: Adds stash changes to the working directory, preserving the stash.
- **git stash drop stash@{0}**: Deletes the stash with stash id=0.

## .gitignore file

.gitignore is used to ignore files and folders in the git repository. Entries in .gitignore prevent these files and folders from being tracked.

---

# Docker
Before going into Docker, Let's understand How companies used to deploy applications in a server. They have different methods for deploying applications:

- Bare Metal Servers involve installing the operating system directly on a physical server, making recovery slow in case of application crashes, and it could take around 30 minutes. With Virtual Machines like AWS EC2, a hypervisor manages virtual machines, reducing downtime but still taking around 5 minutes to restart. Docker, a containerization technology, uses images to create lightweight and isolated containers, allowing for instant recovery within seconds if the application crashes.
  
## What is Docker?

Docker is a tool designed to create, deploy, and run applications using containers. Containers package an application with its dependencies, allowing it to run consistently across various environments.

## What is Docker Image?

Docker Image is a template for creating Docker containers. It contains all dependencies and libraries needed to run an application. We can create a Docker image by using Dockerfile or by using the docker commit command. It is like a Package that contains all the dependencies and libraries required to run the application.

## What is a Docker Container?

A Docker Container is a running instance of a Docker image. We can create a Docker container from a Docker image. It is similar to a virtual machine but more lightweight.
<br>

For more reference, [Click Here](https://www.docker.com/resources/what-container/)<br>

### Docker Commands

- **docker version**: Shows Docker version.
- **docker info**: Displays Docker information.
- **docker images**: Lists all Docker images.
- **docker ps**: Shows running Docker containers.
- **docker ps -a**: Lists all Docker containers.
- **docker pull <image-name>**: Pulls a Docker image from the Docker Hub.
- **docker run <image-name>**: Runs a Docker image, creating a Docker container.
- **docker run -it <image-name>**: Runs a Docker image, creating a Docker container with an open interactive terminal.
- **docker run -it -d <image-name>**: Create a  Docker container but run it in background( detach mode).
- **docker run -it -d -p 8080:80 <image-name>**: Runs a Docker image, creating a background Docker container, mapping port 8080 on the host to port 80 on the container.
- **docker attach <container-id>**: Attaches the terminal to a Docker container.
- **docker exec -it <container-id> bash**: Opens a terminal in a Docker container.
- **docker stop <container-id>**: Stops a Docker container.
- **docker start <container-id>**: Starts a Docker container.
- **docker rm <container-id>**: Deletes a Docker container.
- **docker rmi <image-id>**: Deletes a Docker image.
- **docker commit <container-id> <image-name>**: Creates a Docker image from a Docker container.
- **docker rm -f <container-id>**: Deletes a Docker container forcefully.
- **docker rm -f $(docker ps -a -q)**: Deletes all Docker containers forcefully.
- **docker rmi -f <image-id>**: Deletes a Docker image forcefully.
- **netstat -tnlp**: Displays all ports running on the host machine.
- **ctrl+p+q**: Detaches the terminal from the Docker container without stopping it.

