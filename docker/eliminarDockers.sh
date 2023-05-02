#!/bin/bash

vuelta=5000
while IFS= read -r line
do
  sudo docker rm "$line"
done < nombres.dat
