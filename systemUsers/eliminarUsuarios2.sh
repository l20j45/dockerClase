#!/bin/bash

while IFS= read -r line
do
	echo "$line"
	sudo deluser --remove-all-files "$line"
done < nombres.dat
