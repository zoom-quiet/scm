#!/bin/sh
#
# 140618 fixed for GITHUB can not cfg in /etc/host
#
version='hosts-loc.sh v140618 for MBP'
offset="+0"
#TODAY="`date -d "$offset day" "+%y%m%d"`"
TODAY=`date +%y%m%d`
#
#SVN="$(which svn)"
GIT="$(which git)"
SED="$(which sed)"
#

ZQROOT="/Users/zoomq"
#/Users/zoomq/Works/4svn/@kingsoft/matter4peg/trunk/sa.defines/
BKPATH="$ZQROOT/.zoomq/_historic/lochosts"
STUFF="$BKPATH/_cache4clean-github.ini"
LOCHOSTS="/etc/hosts"
HOSTSMY="$ZQROOT/.zoomq/bin/hosts.ini"
#SMARTHOSTS="$ZQROOT/.zoomq/antigfw/smarthosts.googlecode"
SMARTHOSTS="$ZQROOT/.zoomq/antigfw/smarthosts_github/trunk"
ANTIGFW="$SMARTHOSTS/hosts"

#SMARTHOSTS="$ZQROOT/.zoomq/antigfw/imouto.host"
#ANTIGFW="$SMARTHOSTS/imouto.host.txt"
#ANTIGFW="$SMARTHOSTS/hosts_us"
#HOSTSV6="$ZQROOT/.zoomq/bin/hosts-ipv6.zq"
#HOSTSV6="$ZQROOT/.zoomq/antigfw/ipv6-hosts/hosts"
HOSTSKUP="$ZQROOT/Works/4svn/@kingsoft/matter4peg/trunk/sa.defines/hosts"

echo $TODAY
#echo "###--------------------------------###" >> $LOGFILE
#echo "###$version::start@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGFILE
echo "###$version\n::start flash /etc/hosts@" `date +"%Y/%m/%d %H:%M:%S"`
#echo "\t git pull smarthosts from github"
#cd $SMARTHOSTS
#$GIT pl
echo "\t backup /etc/hosts"
cp $LOCHOSTS $BKPATH/hosts-$TODAY.log
#   cat $HOSTSV6 >> $LOCHOSTS
cat $HOSTSMY > $STUFF
#   intra DNS cfg...
#cat $HOSTSKUP >> $STUFF

#echo "\t rebuild /etc/hosts by smarthosts"
#cat $ANTIGFW >> $STUFF
#echo "\t _cache4clean-github "
#$SED '/github/d' $STUFF > $LOCHOSTS

echo "\t rebuild /etc/hosts by My host.ini"
cat $STUFF > $LOCHOSTS


echo "###::end@" `date +"%Y/%m/%d %H:%M:%S"`
echo "Done! /etc/hosts flushed"
#echo "###--------------------------------###" >> $LOGFILE

exit  0


