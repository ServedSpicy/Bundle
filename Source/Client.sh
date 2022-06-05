#!/bin/sh

config="$HOME/.config/ServedSpicy"
plugins="$HOME/.cache/deno/plug"

base="$(dirname -- $(readlink -fn -- "$0"; echo x))/"


# echo ""
# echo "File Location: $base"
# echo ""


source="${base}/Client"
imports="${source}/Imports.json"
app="${source}/App.js"

interface="${base}/Interface"
desktopEntry="/usr/share/applications/ServedSpicy.desktop"

# echo ""
# echo "Interface Location: $interface"
# echo ""

readable="${config},${interface},${plugins},${source},${desktopEntry}"
writable="${config},${plugins},${desktopEntry}"

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
    $app                    \
    --webserverPort=$1      \
    --socketPort=$2         \
    release
