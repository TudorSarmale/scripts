#!/bin/sh

name=$(cat /storage/emulated/0/iGO/nume.txt)
new="/storage/emulated/0/${name}"
mv /storage/emulated/0/iGO/ $new
