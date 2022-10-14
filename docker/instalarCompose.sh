#!/bin/bash

echo "Bajamos el script de internet y lo mandamos a usr local bin, y ahi ponemos el compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo"le damos permiso de ejecucion al docker"
sudo chmod +x /usr/local/bin/docker-compose
echo "verificamos que se alla instalado"
docker-compose --version
