#!/bin/sh
#jump2selfROOT.sh
MHD="MacintoshHD/Users/zoomq"
PWD=`pwd`
#FIXPATH="/Users/zoomq/.zoomq/bin/jump2self.py $PWD"
#SWD=`python $FIXPATH`
#echo $MHD
#echo $PWD
#if [[ "$SWD" = *"$MHD"* ]]; then  
if echo $PWD|grep -q $MHD;then
    #echo "as MHD"
    ASHOME=$(echo $PWD | cut -d '/' -f 6-) 
    #echo $ASHOME
    cd ~/$ASHOME
    #pwd
    #cd $ASHOME
#else  
#    echo "as OK" 
#    #cd ~/$SWD
fi    

#echo "back ~/$SWD"
#cd ~/$SWD

#exit 0
