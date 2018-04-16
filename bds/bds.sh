#!/bin/bash



chstoneDir="chstone"
clpaDir="$HOME/clpa"

echo "~ Initializing Bug Detection."

echo "~ Changing Directory: $chstoneDir/"
cd ../$chstoneDir/

for d in */; do
	cd $d
    make clean
	clpamake.pl -sources=. -root=.
	cd logic
	clpa --no-fixpoint --timeout 60 ~/clpa/analysis/null/null.clp
	clpa --no-fixpoint --timeout 60 ~/clpa/analysis/aliasing/aliasingcheck.clp
	cd ../
    rm *.txt
    rm -r tmp
    rm -r logic

    for i in `find -type f`; do 
        if [[ "$i" != *".h" && "$i" != *".c" && "$i" != "./Makefile" ]]; then
            [ -x $i ] && echo "$i is executable";
            valgrind -v $i
        fi
    done
	cd ../
done
