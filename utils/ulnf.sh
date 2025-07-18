#! /bin/bash

# Compile nf_meter

# set -x

sudo killall portsdown5 >/dev/null 2>/dev/null
sudo killall limeview >/dev/null 2>/dev/null
sudo killall sa_if >/dev/null 2>/dev/null
sudo killall sa_bv >/dev/null 2>/dev/null
sudo killall nf_meter >/dev/null 2>/dev/null

echo Compiling nf_meter.c

cd /home/pi/portsdown/src/nf_meter

touch nf_meter.c

make -j 4 -O 
if [ $? != "0" ]; then
  echo
  echo "failed install"
  cd /home/pi
  exit
fi

cd /home/pi

mv /home/pi/portsdown/src/nf_meter/nf_meter /home/pi/portsdown/bin/nf_meter

/home/pi/portsdown/bin/nf_meter


