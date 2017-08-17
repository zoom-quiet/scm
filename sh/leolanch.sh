#!/bin/sh
python /opt/bin/leo/launchLeo.py >> /var/log/leo/`date +%y%m%d`-launch.log 2>&1 &
echo "leo running by /opt/bin/leo/launchLeo.py !"

