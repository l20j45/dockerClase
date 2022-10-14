#!/bin/bash
echo "Bajamos el script de internet"
curl -sSL https://get.docker.com/ | sh
echo "termino la instalacion y ahora damos permiso al usuario"
sudo usermod -aG docker ${USER}
echo "ingresamos con el usuario para cargar el grupo"
su - ${USER}
echo "vemos a que grupos pertenecemos"
id -nG
