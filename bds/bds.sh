#!/bin/bash



chstoneDir="chstone"

echo "~ Initializing Bug Detection."

echo "~ Changing Directory: $chstoneDir/"
cd ../$chstoneDir/

for d in */; do
	cd $d
    make clean
	clpamake.pl -sources=. -root=.
	cd logic
	# for a in ~/clpa/analysis/*/; do

	#     clpa --no-fixpoint --timeout 60 ~/clpa/analysis/null/null.clp
	clpa --no-fixpoint --timeout 60 ~/clpa/analysis/aliasing/aliasing.clp

	cd ../
    rm *.txt
    rm -r tmp
    rm -r logic
	cd ../
done