### Steps to Configure Jenkins Slave

- Launch an EC2 Instance with `t2.medium` Instance Type(We will configure it as our Jenkins Agent/Slave node)

- Run the below Command to download java JDK
`wget https://download.oracle.com/java/17/archive/jdk-17.0.10_linux-x64_bin.rpm`
`yum install jdk-17.0.10_linux-x64_bin.rpm -y`

- Start the agent and join it to the Jenkins Master Node(You will get the below commands, from Jenkins master while adding this node, Don't use the below one, They are for my server)

`curl -sO http://54.146.158.246:8080/jnlpJars/agent.jar`
`java -jar agent.jar -jnlpUrl http://54.146.158.246:8080/computer/ec2/jenkins-agent.jnlp -secret 557af3ada1a128916ce4cac68d93ce7eb1b6d5e186ac18f43972697165a9f0d8 -workDir "/" &`


- While configuring the Agent node, If you are stuck with the below error like "there is very little temp space available", so in this case we can increase the size.
<img width="630" alt="image" src="https://github.com/sudhanshuvlog/GFG-Devops16/assets/57751726/abb28db9-941c-4849-8770-3dc8a30639d9">

- `df -h` you will see currently I have only 979Mb available in the /tmp directory, which is causing the issue
<img width="624" alt="image" src="https://github.com/sudhanshuvlog/GFG-Devops16/assets/57751726/7e2b8d00-df54-46b3-aae5-f877711e51f5">

- `#vi /etc/fstab`
And add this line - `tmpfs /tmp tmpfs size=4G 0 0` and then save the file
<img width="638" alt="image" src="https://github.com/sudhanshuvlog/GFG-Devops16/assets/57751726/936a50b4-0c70-40a2-ba41-38f75385674d">

- Run - `mount -o remount /tmp` Remount the /tmp with updated size
<img width="631" alt="image" src="https://github.com/sudhanshuvlog/GFG-Devops16/assets/57751726/016a9f33-6a9a-413f-821f-418010a49197">

- Now we are good to go, Connect your agent again, and you will not face any errors now
<img width="633" alt="image" src="https://github.com/sudhanshuvlog/GFG-Devops16/assets/57751726/411df108-966b-4240-a569-008cf4f17c10">
