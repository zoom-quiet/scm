#!/bin/sh
# base incoming hooks API auto deploy new content from gitcafe
#=========================================================== var defines
#VER="ffsplit.sh v160412"
DATE=`date "+%y%m%d"`
#NOW=$(date +"%Y-%m-%d")
#GIT=$( which git)
#=========================================================== path defines
#LOGF="/opt/logs/cron/$DATE-git-cn-pycon.log"
#RESPATH="/opt/www/PyConChina.github.io"
#=========================================================== action defines

if [ -z $1 ] || [ -z $2 ]; then
   echo "Usage:$0 START DURATION exp.NAME inVideo"
   echo "   eg. $0 10 80 exp2.mp4 foo.avi"
   echo "   eg. $0 00:00:10 00:01:20 exp2.mp4 foo.avi"
   exit
fi

echo "ffmpeg -i $4 -ss $1 -t $2 $3"
ffmpeg -i "$4" -ss $1 -t $2 $3

#=========================================================== action DONE
#exit  0
