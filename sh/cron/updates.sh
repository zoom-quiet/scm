#!/bin/sh
# Is there a preferred way to use pyenv in a shell script? · Issue #492 · pyenv/pyenv https://github.com/pyenv/pyenv/issues/492
### changelog::
#   170818:ZQ refactory for N3160 miniPC Aoi
#   150803:ZQ re-pub with github
#   141022:ZQ creat base hook-deploy-by-git.sh
#=========================================================== var defines
VER="updates.sh v18.8.18.2242"
DATE=`date "+%y%m%d"`
#NOW=$(date +"%Y-%m-%d")
GIT=$( which git)
PY=$( which python)
#=========================================================== path defines
LOGF="/opt/log/cron/$DATE-planet.log"
RESPATH="/opt/www/planet"
#=========================================================== action defines
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $LOGF
echo "###::$VER Hooks log 4 auto update planet for DU"  >> $LOGF
echo "###::run@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGF
echo "<<<   trigging crontab tasks"  >> $LOGF

cd $RESPATH
pwd         >> $LOGF 2>&1
$GIT pl   >> $LOGF 2>&1

$PY code/planet.py config/du.ini >> $LOGF 2>&1

$GIT st   >> $LOGF 2>&1
$GIT add .   >> $LOGF 2>&1
$GIT ci -am "upgrade(planet) auto by crontab from Aoi in ZH"   >> $LOGF 2>&1
$GIT push   >> $LOGF 2>&1

echo "###::end@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGF
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  >> $LOGF
#=========================================================== action DONE
#exit  0
