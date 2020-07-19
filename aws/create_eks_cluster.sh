eksctl create cluster \
--name bn-prod \
--version 1.15 \
--nodegroup-name standard-workers \
--node-type t2.micro \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto
--region us-west-2
