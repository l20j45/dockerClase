#!/bin/bash

vuelta=5000
while IFS= read -r line
do
  sudo docker start "$line" 
vuelta=$(($vuelta+3))
done < nombres.dat
