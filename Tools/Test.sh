#!/bin/sh

base="$(dirname -- $(readlink -fn -- "$0"; echo x))/"


${base}/Build.sh

rm -r $HOME/.ServedSpicy/App/
cp -r ${base}/../Build/ServedSpicy $HOME/.ServedSpicy/App/

$HOME/.ServedSpicy/App/Client.sh 2424 2425

# ${base}/../Build/ServedSpicy/Client.sh 2424 2425
