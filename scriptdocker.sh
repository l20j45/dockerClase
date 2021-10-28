#!/bin/bash

vuelta=5000
while IFS= read -r line
do
  sudo docker run -it -d -p $(($vuelta+1)):22 -p $(($vuelta+2)):80 -p $(($vuelta+3)):3306 --name "$line" l20j45/ubuntu:plantillaclase
vuelta=$(($vuelta+3))
done < nombres.dat
