# Delete any old processes
minikube delete
docker rmi -f $(docker images -q)

