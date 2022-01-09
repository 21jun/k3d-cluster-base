# https://k3d.io/v5.2.2/usage/exposing_services/

k3d cluster create mycluster --api-port 6550 -p "8081:80@loadbalancer" --agents 2 --registry-create mycluster-registry
# 
k3d cluster create notraefik --api-port 6550 -p "8082:80@loadbalancer" --agents 2  --k3s-arg "--no-deploy=traefik@server:*"


kubectl create deployment nginx --image=nginx

kubectl create service clusterip nginx --tcp=80:80

# create depl, service



kubectl apply -f thatfile.yaml






# working example

kubectl apply -f simple-python-depl.yaml
kubectl apply -f simple-python-depl-2.yaml

kubectl create ns lee1jun
kubectl apply -f ingressRouter.yaml