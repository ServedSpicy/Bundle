#!/bin/sh


#   Base Folders

folder="$HOME/.ServedSpicy"
config="$HOME/.config/ServedSpicy"
plugin="$HOME/.cache/deno/plug"


#   Deno Binary

deno="$HOME/.deno/bin/deno"


#   Logging

logs="${folder}/Logs"
log="${logs}/Log.txt"

mkdir $logs


echo "Starting ServedSpicy" > $log
echo "Folder: ${folder}" >> $log
echo "Config: ${config}" >> $log
echo "Plugin: ${plugin}" >> $log


app="${folder}/App"
source="${app}/Client"
imports="${source}/Imports.json"
launcher="${source}/App.js"

interface="${app}/Interface"


readable="${config},${interface},${plugin},${source}"
writable="${config},${plugin}"

echo "Readable: ${readable}" >> $log
echo "Writable: ${writable}" >> $log

i=1 ; while [ $i -le 100 ]; do echo ""; i=$(( i +1 )); done

clear

deno run                    \
    --allow-run="gio"       \
    --allow-net             \
    --allow-env             \
    --allow-ffi             \
    --allow-write=$writable \
    --allow-read=$readable  \
    --importmap=$imports    \
    --unstable              \
    $launcher               \
    --webserverPort=$1      \
    --socketPort=$2         \
    release
