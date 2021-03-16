# Delete any old processes
minikube delete
kubectl delete -f srcs/nginx.yaml
docker rmi -f $(docker images -q)

