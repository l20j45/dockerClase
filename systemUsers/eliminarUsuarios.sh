#!/bin/bash

while IFS= read -r line
do
	echo "$line"
	sudo userdel -r "$line"
done < nombres.dat
