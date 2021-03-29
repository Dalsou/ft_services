# This file launches and setups minikube
# It builds all Docker images (Nginx, FTPS, MySQL, Wordpress, PHPmyAdmin, InfluxDB, Grafana & test)
# It also applys pods.

#/usr/bin/env zsh
#sudo usermod -aG docker user42; newgrp docker

# Starting minikube
echo "Starting minikube ..."
minikube start --vm-driver=docker

# Use the docker daemon from minikube
eval $(minikube docker-env)

# Enable addons & config MetalLB
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml

# Open dashboard
minikube dashboard &

# Build docker images
docker build -t my_nginx ./srcs/nginx
docker build -t my_ftps ./srcs/ftps
docker build -t my_mysql ./srcs/mysql
docker build -t my_wordpress ./srcs/wordpress
docker build -t my_phpmyadmin ./srcs/phpmyadmin

# Deploy service
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml

