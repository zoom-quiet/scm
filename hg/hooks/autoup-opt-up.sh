#!/bin/sh
# autoup-loc-oss.sh base incoming hooks API auto up people's push
### changelog::
#   150721:Zoomq redefine for OBP
#   110112:Zoomq cancel push ijs44,had moved!
#   
#=========================================================== var defines
VER="autoup-opt-up.sh v15.7.21.1825"
DATE=`date "+%y%m%d"`
HG=$(which hg)
#"/usr/local/python/bin/hg"
#=========================================================== path defines
REPO="/opt"
LOGF="/opt/log/hooks/$DATE-hg-a2uploc.log"
if [ -e "${LOGF}" ]  
then  
    echo "...... hooks acting"  >> $LOGF
else
    echo ">>>>>> new daily Hg hooks logging"  >> $LOGF
    touch $LOGF
    sudo chmod 664 $LOGF
fi  
#=========================================================== action defines
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $LOGF
echo "###::$VER Hooks log 4 auto up loc"  >> $LOGF
echo "###::run@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGF

cd $REPO
sudo chmod 775 ./*
echo "<<<   up at /r/oss"  >> $LOGF
$HG up          >> $LOGF 2>&1
#echo ">>>   as kioss push into https://code.ijinshan.com/hg"  >> $LOGF
#$HG push -f     >> $LOGF 2>&1
#echo ">>>   as zhouqi push into ssh://219.232.254.50//data/app/hg/oss"  >> $LOGF
#$HG push -f ijs50   >> $LOGF 2>&1

echo "###::end@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGF
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  >> $LOGF
#=========================================================== action DONE
exit  0



