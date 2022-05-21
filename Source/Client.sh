#!/bin/sh

config="$HOME/.config/ServedSpicy"
plugins="$HOME/.cache/deno/plug"

base="$(dirname -- $(readlink -fn -- "$0"; echo x))/"


echo ""
echo "File Location: $base"
echo ""


source="${base}/Client"
imports="${source}/Imports.json"
app="${source}/Server.js"

interface="${base}/Interface"

echo ""
echo "Interface Location: $interface"
echo ""

readable="${config},${interface},${plugins},${source}"
writable="${config}"


deno run                    \
    --allow-net             \
    --allow-env             \
    --allow-ffi             \
    --allow-read=$readable  \
    --allow-write=$writable \
    --importmap=$imports    \
    --unstable              \
    $app                    \
    --webserverPort=$1      \
    --socketPort=$2         \
    release
