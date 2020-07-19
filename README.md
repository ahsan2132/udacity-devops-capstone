
<h3> EKS Stack Setup</h3>
# use eksctl to create EKS cluster

display available options and properties:

```bash
eksctl create cluster --help
```

## creation

create cluster by using yaml config file:

```bash
eksctl create cluster -f aws/eks-cluster.yaml
```

## post-install check

eksctl also creates the config file for _kubectl_. This means we can immediately fire up a check like:

```
kubectl get nodes
```

<h3> Docker Setup</h3>

Go to blue directory and build image using following command
#./run_docker.sh 

Upload image
#./upload_docker.sh 

Now go to green directory and build image using following command
#./run_docker.sh 

Upload image
#./upload_docker.sh 

Create replication controller for blue Image
#kubectl apply -f ./blue/blue-controller2.json 

Create replication controller for green Image
#kubectl apply -f ./green/green-controller3.json 

Now create the service
#kubectl apply -f ./blue-green-service.json 

Check the LB URL
#kubectl get svc

Now open the service file and update selector label to green
app=green3


#kubectl apply -f ./blue-green-service.json 
#test



