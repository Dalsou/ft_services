# Delete any old processes
minikube stop
minikube delete
docker rmi -f $(docker images -q)

