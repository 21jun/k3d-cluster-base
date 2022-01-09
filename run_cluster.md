
### 0. Start Cluster with registry

`k3d cluster create mycluster --api-port 6550 -p "8081:80@loadbalancer" --agents 2 --registry-create mycluster-registry`


### 1. check registry(mycluster-registry) port via `docker ps` 
	ex) eefaac5b3d23   registry:2   "/entrypoint.sh /etc…"   2 days ago    Up 19 hours  0.0.0.0:38791->5000/tcp   mycluster-registry 
### 2. change registry port in  deployment yaml files 
	ex) image: mycluster-registry:38791/fast-asr:latest



### start test api (python)
`kubectl apply -f simple-python-depl.yaml`
	
	this deployment's image is on dockerhub (docker.io)

### start asr api (python)
`kubectl apply -f simple-python-depl-2.yaml`
	
	this deployment's image needs to be built locally (or migrate it via tar.gz)
	docker build ...
	docker tag 21jun/fast-asr mycluster-registry.localhost:38791/fast-asr:latest
	docker push mycluster-registry.localhost:38791/fast-asr:latest 

-> push to `mycluster-registry.localhost:38791`
-> then mycluster can access image through mycluster-registry

### create namespace
`kubectl create ns lee1jun`
### create ingress router (traefik v2)
`kubectl apply -f ingressRouter.yam`



### dependencies

`21jun/fast-asr` : `8bb1f448aecf19ab0ff5f1251c9f36505bfa1aa7`
