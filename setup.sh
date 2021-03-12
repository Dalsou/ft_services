# This file launches and setups minikube
# It builds all Docker images (Nginx, FTPS, MySQL, Wordpress, PHPmyAdmin, InfluxDB, Grafana & test)
# It also creates pods.

# Starting minikube
echo "Starting minikube ..."
minikube --vm-driver=docker start

# Enable addons
minikube addons enable dashboard
minikube addons enable metrics-server

# Use the docker daemon from minikube
eval $(minikube docker-env)

# Build docker images
docker build -t my_nginx ./srcs/nginx
#docker build -t my_ftps ./srcs/ftps
#docker build -t my_wordpress ./srcs/wordpress
#docker build -t my_mysql ./srcs/mysql
#docker build -t my_phpmyadmin ./srcs/phpmyadmin

# Apply yaml resources
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml
kubectl apply -f ./srcs/nginx.yaml
#kubectl apply -f ./srcs/ftps.yaml
#kubectl apply -f ./srcs/wordpress.yaml
#kubectl apply -f ./srcs/mysql.yaml
#kubectl apply -f ./srcs/phpmyadmin.yaml

# Open dashboard
minikube dashboard &

