#!/bin/sh
# Change log
#   v15.10.10 upgrade fro EI Captain
#       as http://blog.csdn.net/wqhjfree/article/details/39032533
#       http://stackoverflow.com/questions/11287564/getting-sed-error-illegal-byte-sequence-in-bash
#   v15.4.10 upgrade fro Yosemite
#   v12.6.27 can usage

export LC_COLLATE='C'
export LC_CTYPE='C'

VER="zhmark2en.sh {v15.10.10}"
SED="$(which sed)"

echo "\t powered from $VER"
echo "Number of arguments: $#"

if [ "$#" -lt 1 ]; then
    echo "usage: zhmark2en FILEexNAME(txt/md/...)"
    exit 0
fi
if [ "$#" -gt 2 ]; then
    echo "usage: zhmark2en FILEexNAME(txt/md/...)"
    exit 0
fi

# -eq 等于
# -ne 不等于
# -le 小于等于
# -ge 大于等于
# -lt 小于
# -gt 大于

#echo "?" $0
#echo "??" $1
#echo "???" $2
#echo "????" $3
PATH=$(pwd) #$2
FEX=$1  #$3

echo $PATH $FEX
echo "walk @\t" $PATH
echo "will clean Chinese Mark in :" 
echo *.$FEX
#cd $PATH

#$SED -ig "s/。/. /g" `/usr/bin/grep 。 -rl ./`
#$SED -i "s/。/. /g; \
#$SED -i.orig "s/。/. /g; \
$SED -i "" "s/。/. /g; \
    s/，/,/g; \
    s/、/,/g; \
    s/？/\?/g; \
    s/！/\!/g; \
    s/；/;/g; \
    s/：/:/g; \
    s/……/... /g; \
    s/…/... /g; \

    s/“/\"/g; \
    s/”/\"/g; \
    s/‘/\'/g; \
    s/’/\'/g; \

    s/（/(/g; \
    s/）/)/g; \
    s/｛/{/g; \
    s/｝/}/g; \

    s/《/\"/g; \
    s/》/\"/g; \
    s/〈/\'/g; \
    s/〉/\'/g; \

    s/〔/\[/g; \
    s/〕/\]/g; \
    s/［/\[/g; \
    s/］/\]/g; \
    s/【/\[/g; \
    s/】/\]/g; \
    s/〖/\[/g; \
    s/〗/\]/g; \

    s/『/\"/g; \
    s/』/\"/g; \
    s/「/\'/g; \
    s/」/\'/g; \

    s/﹃/\"/g; \
    s/﹄/\"/g; \
    s/﹁/\'/g; \
    s/﹂/\'/g; \
    s/——/---/g" \
    $PATH/*.$FEX

#echo "###::end@ " `date +"%Y/%m/%d %H:%M:%S"` 
echo "\t $VER transformed all Chinese Mark into en. ;-)"
exit 0
