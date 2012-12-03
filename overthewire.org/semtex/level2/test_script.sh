#!/bin/bash

# This script is for testing library-injection, locally

# test compile script (for 32bit cpu as in the server)
gcc -m32 -o test test.c
gcc -m32 -fPIC -c -o libtestinject.o testinject.c 
gcc -m32 -shared -Wl,-soname,libtestinject.so -o libtestinject.so.1 libtestinject.o
LD_PRELOAD=./libtestinject.so.1 ./test

echo "Cleaning up"
rm test libtestinject.so.1 libtestinject.o 
