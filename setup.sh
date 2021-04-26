# This file launches and setups minikube
# It builds all Docker images (Nginx, FTPS, MySQL, Wordpress, PHPmyAdmin, InfluxDB, Grafana & test)
# It also applys pods.

if [ ! -f ~/.vm_setup ]; then
	minikube delete
	sudo apt update
	# Update minikube
	curl -LO  https://github.com/kubernetes/minikube/releases/download/v1.19.0/minikube_1.19.0-0_amd64.deb
	sudo rm /var/lib/dpkg/lock-frontend
	sudo rm /var/lib/apt/lists/lock
	sudo rm /var/cache/apt/archives/lock
	sudo rm /var/lib/dpkg/lock
	sudo rm -f /usr/local/bin/minikube
	sudo apt install ./minikube_1.19.0-0_amd64.deb
	sudo rm minikube_1.19.0-0_amd64.deb
	# Update kubectl
	sudo rm -f /usr/local/bin/kubectl
	curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
	sudo chmod +x kubectl
	sudo cp kubectl /usr/local/bin
	sudo chmod +x /usr/local/bin/kubectl
	sudo rm kubectl
	touch ~/.vm_setup
	sudo usermod -aG docker user42; newgrp docker
fi

# Delete any old processes
minikube stop
minikube delete

# Starting minikube
echo "Starting minikube ..."
minikube start --driver=docker

# Use the docker daemon from minikube
eval $(minikube docker-env)

# Enable addons & config MetalLB
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml

# Open dashboard
minikube dashboard &

# # Build docker images
echo "Docker build init ..."
docker build -t my_nginx ./srcs/nginx > /dev/null 2>&1
echo "Nginx completed !"
docker build -t my_ftps ./srcs/ftps > /dev/null 2>&1
echo "FTPS completed !"
docker build -t my_mysql ./srcs/mysql > /dev/null 2>&1
echo "MySQL completed !"
docker build -t my_wordpress ./srcs/wordpress > /dev/null 2>&1
echo "Wordpress completed !"
docker build -t my_phpmyadmin ./srcs/phpmyadmin > /dev/null 2>&1
echo "PHPmyAdmin completed !"
docker build -t my_grafana ./srcs/grafana > /dev/null 2>&1
echo "Grafana completed !"
docker build -t my_influxdb ./srcs/influxdb > /dev/null 2>&1
echo "InfluxDB completed !"
echo "Docker build completed !"

# Deploy service
echo "Deployment init ..."
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/grafana.yaml
kubectl apply -f ./srcs/influxdb.yaml
echo "Deployment completed !"