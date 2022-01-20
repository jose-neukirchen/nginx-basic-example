#/bin/bash
docker stop $(docker ps -aqf "name=mynginx0")
docker container prune   
docker rmi -f mynginx-image0
docker build -t mynginx-image0 .
docker run --name mynginx0 -p 80:80 -d mynginx-image0 
sleep 5
docker container ps
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=mynginx0")
#Servico1
cd servico1/
docker stop $(docker ps -aqf "name=mynginx1")
docker container prune   
docker rmi -f mynginx-image1
docker build -t mynginx-image1 .
docker run --name mynginx1 -p 8001:8001 -d mynginx-image1  
sleep 5
docker container ps 
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=mynginx1")
#Servico2
cd ../servico2/
docker stop $(docker ps -aqf "name=mynginx2")
docker container prune   
docker rmi -f mynginx-image2
docker build -t mynginx-image2 .
docker run --name mynginx2 -p 8002:8002 -d mynginx-image2  
sleep 5
docker container ps
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=mynginx2") 
#Load Balancer
cd ../lb/
docker stop $(docker ps -aqf "name=mynginx3")
docker container prune   
docker rmi -f mynginx-image3
docker build -t mynginx-image3 .
docker run --name mynginx3 -p 8003:8003 -d mynginx-image3  
sleep 5
docker container ps
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=mynginx3") 