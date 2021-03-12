# ft_services

docker build -t ftps .
docker run -d --name=ftps_1 -p 21:21 ftps
docker stop ftps_1 && docker system prune


docker ps
docker stop
docker image rm ID

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

À faire :

- harmoniser sous dossier
- Grafana + InfluxDB + Telegraf
- Ports (donne deux ports diff, peut-etre inter et externe)
- nginx ssl beug

