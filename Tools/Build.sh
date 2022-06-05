#!/bin/sh

clear

echo "Bundling ServedSpicy"


#   Paths

base="$(dirname -- $(readlink -fn -- "$0"; echo x))/../"
tools="${base}/Source"
root="${base}/../"

build="${base}/Build"
bundle="${build}/ServedSpicy"

interface="${root}/Interface/Source/"
client="${root}/Client/Source/"
serial="${root}/Serial"

icon="${tools}/Logo.png"
webserver_launcher="${tools}/Client.sh"
serial_library="${serial}/Build/Serial.so"

build_serial="${serial}/Tools/Build.sh"



#   Create Build Folder

rm $build --recursive

sleep 0.2

mkdir $bundle --parents
mkdir $bundle/Icons

sleep 0.2


#   Build Serial Library

$build_serial


#   Copy Content

cp $icon "${bundle}/Icons/App.png"
cp $interface "${bundle}/Interface/" --recursive
cp $client "${bundle}/Client/" --recursive
cp $webserver_launcher "${bundle}/Client.sh"
cp $serial_library "${bundle}/Serial.so"


echo "Finished Bundling ServedSpicy"