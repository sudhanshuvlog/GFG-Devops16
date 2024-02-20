## Jenkins

### Important tips for Jenkins

- Instead of installing Jenkins in your local machine, which include a lot of configurations and dependencies, you can use Docker Image to run Jenkins.
- You can use the following command to run Jenkins in your local machine.

```bash
docker run -p 8080:8080 jenkins/jenkins:lts
```

### Why we need Jenkins Cluster(Or)Jenkins Master-Slave Architecture?

- **Jenkins Cluster** is nothing but a group of Jenkins servers.
- Let's consider a scenario where we have a Jenkins server and we have 1000 jobs to run.
- If we run all the jobs in a single Jenkins server, it will take a lot of resources from my master node and it will be difficult to manage.

**Example:**

- Let's say I have one Job and it involves downloading some big files from the internet.
- If I run it in my master server, it will consume lot of space and it difficult to manage.
- So, I can run it in a slave server and it will not affect my master server.

### Pipeline in Jenkins

- Instead of running a multiple stages in a multiple jobs, we can run all the stages in a single job using Jenkins Pipeline.
- **Pre-rquisties** - You need to install the `Pipeline plugin` in your Jenkins server.
- Before we installed the `Build pipeline plugin`, we used that plugin to run multiple jobs for multiple stages.
- But, after installing the `Pipeline plugin`, we can run all the stages in a single job.

### Jenkinsfile

- In Pipeline, we can write the stages in a file called `Jenkinsfile`.
- Syntax of Jenkinsfile is similar to the syntax of Groovy.
- We can write the stages in a `Jenkinsfile` and we can run all the stages in a single job.
- It uses Declarative approach.
- Example of Jenkinsfile:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
```

### Jenkins Pipeline Triggers

- Poll SCM - It will check the changes in the repository for every x minutes we mentioned.
- If we use `Poll SCM` trigger, It will waste lot of resources.
- So we can use `Webhook` trigger, which will trigger the Jenkins job whenever there is a change in the repository.

---

## GitHub Actions

Instead of creating Jenkins server, creating EC2 instance, installing Jenkins, and configuring Jenkins, we can use GitHub Actions to run our CI/CD pipeline.

### What is GitHub Actions?

- **GitHub Actions** is a CI/CD service provided by GitHub.
- It allows us to automate our workflow from the GitHub repository.

### GitHub Actions Workflow

- **Workflow** is an automated process that you can set up in your repository to build, test, package, release, or deploy any project on GitHub.
- We have to create .github/workflows directory in our repository and we have to write the workflow in a file called `YAML` file.
- We can write the workflow in a file called `YAML` file and we can run the workflow using the triggers.

### Example of GitHub Actions Workflow

```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
    build:
        runs-on: ubuntu-latest
    
        steps:
        - uses: xxxxxxxxxxxxxxxx@xx
        - name: Set up JDK 11
        uses: xxxxxxxxxxxxxxxxxx@xx
        with:
            java-version: '11'
        - name: Build with Maven
        run: mvn -B package --file pom.xml
```

### GitHub Actions Hosted Runners

- **GitHub Actions Hosted Runners** are virtual machines that are hosted by GitHub.
- We can use the GitHub Actions Hosted Runners to run our CI/CD pipeline.
- It's just like using Jenkins with EC2 instance.

We can always refer to the [official documentation](https://docs.github.com/en/actions) for more information.<br>

You can use this link to use already creted codes for GitHub Actions: https://github.com/actions 

---

## SonarQube

- It is a code qulaity analysis tool.
- It will give us report of our code quality.
- It store the report data in a database.
- We also have Sonar Scanner to scan the code and send the report to SonarQube server.

### How to install SonarQube?

- We can use Docker Image to run SonarQube.
- We can use the following command to run SonarQube in our local machine.

```bash
docker run -d --name sonarqube -p 9000:9000 sonarqube:latest
```

- We can access the SonarQube server using the following URL.

```
http://localhost:9000
```

- We can use the default username and password to login to the SonarQube server.

```
username: admin
password: admin
```

You can see the below image to do the login.

![net-9](https://github.com/mathesh-me/ci-cd-dotnet-app-deployment/assets/144098846/20b90d39-025f-4900-8c3d-9e602c3c1803)


- Login to SonarQube using the default credentials.
```
Username: admin
Password: admin
```
![net-10](https://github.com/mathesh-me/ci-cd-dotnet-app-deployment/assets/144098846/a87ca754-43e7-4ac3-a159-cd8b6dba7d6e)
![net-11](https://github.com/mathesh-me/ci-cd-dotnet-app-deployment/assets/144098846/015f8636-ff1a-47e8-b578-1b3e7a5369b3)
![net-12](https://github.com/mathesh-me/ci-cd-dotnet-app-deployment/assets/144098846/4a887ab7-17bd-4a0d-8e4c-dca18d562863)

---

## Mergify

Mergify is a tool that allows you to automatically merge your pull requests when they are ready. It is a great tool to use when you have a lot of pull requests and you want to automate the process of merging them.

### How to install Mergify?

- We can use the following steps to install Mergify in our GitHub repository.

1. Go to the [Mergify website](https://mergify.io/) and sign in with your GitHub account.
2. Once you are signed in, you can install Mergify in your GitHub repository.
3. After installing Mergify, you can configure it to automatically merge your pull requests when they are ready.
4. You can also configure Mergify to automatically close your pull requests when they are not ready to be merged.
5. You can also configure Mergify to automatically label your pull requests when they are ready to be merged.
6. You can also configure Mergify to automatically assign your pull requests to the person who is responsible for merging them.

### Mergify Rules

- We can write the rules in a file called `.mergify.yml` and we can configure Mergify to automatically merge our pull requests based on the rules we have written in the `.mergify.yml` file.

### Example of Mergify Rules

```yaml
pull_request_rules:
  - name: Automatically merge pull requests
    conditions:
      - base=main
      - label=ready-to-merge
    actions:
      merge:
        method: merge
```