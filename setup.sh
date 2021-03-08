# This file launches and setups minikube
# It builds all Docker images (Nginx, FTPS, MySQL, Wordpress, PHPmyAdmin, InfluxDB, Grafana & test)
# It also creates pods.

# Starting minikube
echo "Starting minikube ..."
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-25000

# Enable addons
minikube addons enable dashboard

# Dashboard
minikube dashboard &

docker build -t ftps ./srcs/ftps
docker build -t nginx ./srcs/nginx
docker build -t wordpress ./srcs/wordpress
docker build -t mysql ./srcs/mysql
docker build -t phpmyadmin ./srcs/phpmyadmin

kubectl create -f ./srcs/nginx.yaml
kubectl create -f ./srcs/ftps.yaml
kubectl create -f ./srcs/wordpress.yaml
kubectl create -f ./srcs/mysql.yaml
kubectl create -f ./srcs/phpmyadmin.yaml

