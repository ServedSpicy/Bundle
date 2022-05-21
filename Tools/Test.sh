#!/bin/sh

base="$(dirname -- $(readlink -fn -- "$0"; echo x))/"


${base}/Build.sh

${base}/../Build/ServedSpicy/Client.sh 2424 2425
