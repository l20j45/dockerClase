#!/bin/bash

vuelta=5000
while IFS= read -r line
do
  sudo docker run -it -d -p $(($vuelta)):22 -p $(($vuelta+1)):80 -p $(($vuelta+2)):3306 --name "$line" l20j45/ubuntu:PlataformasOperativasPi
vuelta=$(($vuelta+2))
done < nombres.dat
