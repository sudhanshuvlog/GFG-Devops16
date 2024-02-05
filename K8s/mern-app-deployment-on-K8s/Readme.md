## Kubernetes Configuration for Deploying a MERN App

To deploy your MERN (MongoDB, Express.js, React.js, Node.js) application on Kubernetes, follow the steps below:

Run the below commands in the order - 

### Create the Persistent Volume(PV)
`kubectl create -f pv.yml`
### Create the Persistent Volume Claim(PVC)
`kubectl create -f pvc.yml`
### Create Kubernetes Secret for MongoDB Credentials
`kubectl create -f secret.yml` 
### Create the MongoDB Deployment with ReplicaSet, It uses the secrets created above
`kubectl create -f mongo-app.yml`
### Expose MongoDB Service on ClusterIP (Internal Cluster Access Only)
`kubectl create -f mongo-service.yml`
### Create ConfigMap for MongoDB URL, Pointing to the MongoDB Service
`kubectl create -f mongo-config.yml`
### Create the mongo-express Deployment with ReplicaSet, It uses the secrets and ConfigMap created above
`kubectl create -f mongo-express-webapp.yml`
### Expose Webapp Service on NodePort (Port: 30111)
`kubectl create -f webapp-service.yml`

* Your Mongo-Express web app, built using Express, Node.js and MongoDB, is now accessible on NodePort 30111.

* Additional Steps for EC2 Instance:

If you deployed your Kubernetes cluster on an EC2 instance and want to access the web app from the internet, follow these additional steps:

### Install socat 
`yum install socat -y`

### Start socat for Routing Traffic
`socat TCP4-LISTEN:8080,fork,su=nobody TCP4:192.168.49.2:30111`

Now, accessing the public IP of your EC2 instance at port 8080 will route traffic to the web app on Kubernetes at port 30111.