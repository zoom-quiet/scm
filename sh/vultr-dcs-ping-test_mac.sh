#!/bin/bash
#=========================================================== var defines

#=========================================================== path defines
NOW_TIME_STAMP=$(date "+%y%m%d.%H%M%S")
LOGD="./vultr-dcs-ping-test_mac_$NOW_TIME_STAMP.log"
#=========================================================== action defines
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  > $LOGD
echo "###::auto ping all vultr region for choice"  >> $LOGD
echo "###::run@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGD
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $LOGD

echo "=======================================" >> $LOGD
echo "From Local to Vultr 17 DCs Ping Test.RC" >> $LOGD
echo "    Copyright 2020 www.vultrcn.com" >> $LOGD
echo "=======================================" >> $LOGD

echo "======================================="
echo "From Local to Vultr 17 DCs Ping Test.RC"
echo "    Copyright 2020 www.vultrcn.com"
echo "======================================="

echo "---------------------------------------"
echo "01 Tokyo"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "01 Tokyo" >> $LOGD
/sbin/ping hnd-jp-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "02 Singapore "

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "02 Singapore " >> $LOGD
/sbin/ping sgp-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "03 Seoul"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "03 Seoul" >> $LOGD
/sbin/ping sel-kor-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "04 Amsterdam"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "04 Amsterdam" >> $LOGD
/sbin/ping ams-nl-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "05 Paris"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "05 Paris" >> $LOGD
/sbin/ping par-fr-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "06 Frankfurt"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "06 Frankfurt" >> $LOGD
/sbin/ping fra-de-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "07 London"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "07 London" >> $LOGD
/sbin/ping lon-gb-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "08 Atlanta"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "08 Atlanta" >> $LOGD
/sbin/ping ga-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "09 New York (New Jersey)"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "09 New York (New Jer sey)" >> $LOGD
/sbin/ping nj-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "10 Chicago"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "10 Chicago" >> $LOGD
/sbin/ping il-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "11 Dallas"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "11 Dallas" >> $LOGD
/sbin/ping tx-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "12 Los Angeles"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "12 Los Angeles" >> $LOGD
/sbin/ping lax-ca-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "13 Miami"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "13 Miami" >> $LOGD
/sbin/ping fl-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "14 Seattle"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "14 Seattle" >> $LOGD
/sbin/ping wa-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "15 Silicon Valley"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "15 Silicon Valley" >> $LOGD
/sbin/ping sjo-ca-us-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "16 Toronto"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "16 Toronto" >> $LOGD
/sbin/ping tor-ca-ping.vultr.com  -c 10 >> $LOGD

echo "---------------------------------------"
echo "17 Sydney"

echo >> $LOGD 
echo >> $LOGD 
echo "---------------------------------------" >> $LOGD
echo "17 Sydney" >> $LOGD
/sbin/ping syd-au-ping.vultr.com  -c 10 >> $LOGD

echo "======================================="
echo "###::end@" `date +"%Y/%m/%d %H:%M:%S"` >> $LOGD
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"  >> $LOGD
#=========================================================== action DONE
exit  0



