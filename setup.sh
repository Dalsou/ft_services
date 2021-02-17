# This file launches and setups minikube
# It builds all Docker images (Nginx, FTPS, MySQL, Wordpress, PHPmyAdmin, InfluxDB, Grafana & test)
# It also creates pods.

# Delete any old processes
minikube delete

# Starting minikube
echo "Starting minikube ..."
minikube --vm-driver=virtualbox start

# Enable addons
minikube addons enable ingress
minikube addons enable dashboard

# Dashboard
minikube dashboard