#!/bin/sh
###/bin/bash
version="amr2ogg.sh {v0.7 090819}"
if [ "$#" -ne 2 ]; then
    echo "usage: amr2ogg.sh test.amr 090819-xx[exp .ogg file name not .ext]"
    exit 0
fi

amrfn=$1
oggfn=$2
#echo $amrfn,$oggfn
#cmdSudo=$( which sudo)
cmdSOX=$( which sox)
cmdAMRNBDECODER=$( which amrnb-decoder)
#amrnb-decoder test.amr test.raw
#sox -r 8000 -s -2 test.raw -t ogg test.ogg
echo "###$version::start@ " `date +"%Y/%m/%d %H:%M:%S"` 
$cmdAMRNBDECODER $amrfn $oggfn.raw
$cmdSOX -r 8000 -s -2 $oggfn.raw -t ogg $oggfn.ogg

echo "###::end@ " `date +"%Y/%m/%d %H:%M:%S"` 
echo "$version transformed .amr recoder ;-)"
exit 0
