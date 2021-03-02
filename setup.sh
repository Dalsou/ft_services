# This file launches and setups minikube
# It builds all Docker images (Nginx, FTPS, MySQL, Wordpress, PHPmyAdmin, InfluxDB, Grafana & test)
# It also creates pods.

# Delete any old processes
#minikube delete

# Starting minikube
#echo "Starting minikube ..."
#minikube --vm-driver=virtualbox start

# Enable addons
#minikube addons enable ingress
#minikube addons enable dashboard

# Dashboard
#minikube dashboard

docker build -t ftps ./srcs/ftps
docker build -t nginx ./srcs/nginx
docker build -t wordpress ./srcs/wordpress
docker build -t mysql ./srcs/mysql
docker build -t phpmyadmin ./srcs/phpmyadmin

docker run -d -it --name=ftps_1 -p 21:21 ftps
docker run -d -it --name=nginx_1 -p 80:80 nginx
docker run -d -it --name=wordpress_1 -p 5050:5050 wordpress
docker run -d -it --name=mysql_1 -p 3306:3306 mysql
docker run -d -it --name=phpmyadmin_1 -p 5000:5000 phpmyadmin