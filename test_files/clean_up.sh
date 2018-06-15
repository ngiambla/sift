#!/bin/bash

echo "Cleaning Up.";
cd ../chstone

for d in */; do

	cd $d
	make clean

	rm *.bc *.ll;

	cd ../
done
