#!/bin/sh

echo "Nume iGO:"

read name

if [ -d "/storage/emulated/0/iGO" ]

then

    echo "Directory /path/to/dir exists." && read t

else

    mv "/storage/emulated/0/${name}" /storage/emulated/0/iGO

fi
