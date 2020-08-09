#!/bin/sh
#=========================================================== action bath
# base ffmpeg make nature video as time_lapse
#
# 200625 merge BGM loop
# 200624 merge BGM
# 200623 ask push
# 200622 init.
#
#=========================================================== action bath
RES=$1
AIM=$2
VNAME=`echo $RES | cut -d "." -f 1`
echo "got filename : $VNAME"
echo "exp. as : $AIM.mp4"

ffmpeg -i $RES  -filter_complex "[0:v]setpts=0.42*PTS[v]" -map "[v]" "$AIM-zip.mp4"

#ffmpeg -i "$AIM-zip.mp4" -i "11_sleep_with_snow.mp3" -filter_complex [1:a]aloop=loop=10  "$AIM-mu.mp4"
ffmpeg -y -stream_loop -1 -i "11_sleep_with_snow.mp3" -i "$AIM-zip.mp4" -map 0:a:0 -map 1:v:0 -c:v copy -c:a aac -ac 2 -shortest "$AIM-mu.mp4"


echo "Usage:"
echo "\t 源视频文件(含后缀) 目标视频名(不用后缀)"
echo "try:"
echo "\t $RES -> $AIM-zip + BGM-> $AIM-zip-mu \n"


exit  0



#=========================================================== action bath
#   ask and actions
#=========================================================== action bath
read -r -p "Are You OK? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        read -p "源视频文件 目标视频名 > " RES AIM
        echo $RES
        echo $AIM
        ffmpeg -i $RES  -filter_complex "[0:v]setpts=0.42*PTS[v]" -map "[v]" "$AIM.mp4"
        ;;

    [nN][oO]|[nN])
        echo "No"
        ;;

    *)
        echo "Invalid input..."
        exit 1
        ;;
esac

exit  0

#=========================================================== action bath
#   ask and actions
#=========================================================== action bath
RES=$1
AIM=$2
VNAME=`echo $RES | cut -d "." -f 1`
echo "got filename : $VNAME"
echo "exp. as : $AIM.mp4"

ffmpeg -i $RES  -filter_complex "[0:v]setpts=0.42*PTS[v]" -map "[v]" "$AIM-zip.mp4"

ffmpeg -i "$AIM-zip.mp4" -i "11_sleep_with_snow.mp3" -filter_complex [1:a]aloop=loop=-1  "$AIM-zip-mu.mp4"


echo "Usage:"
echo "\t 源视频文件(含后缀) 目标视频名(不用后缀)"
echo "try:"
echo "\t $RES -> $AIM-zip + BGM-> $AIM-zip-mu \n"


#=========================================================== action DONE
exit  0
#   refer.
#
# -filter_complex "[0:v]setpts=0.42*PTS[v]" -map "[v]"
# 如何使用ffmpeg将新音频（不混音）添加到视频中？ - 问答 - 云+社区 - 腾讯云
#       https://cloud.tencent.com/developer/ask/101444
#   将音频添加到视频：流式复制
#   
#       ffmpeg -i video.avi -i audio.mp3 -codec copy -shortest output.avi
#   将音频添加到视频：重新编码
#   如果您的输出不像原始格式，或者您想更改格式，则可以指定编码器：
#       ffmpeg -i video.avi -i audio.mp3 -c:v libx264 -c:a libvorbis \
#       -shortest output.mkv
#   
#   手动选择特定的流
#   有时默认流选择不会给你你想要的结果。
#   在这个例子中video.mp4有视频和音频，audio.m4a只有音频。
#   用于-map从以下位置选择视频video.mp4和音频audio.m4a：
#       ffmpeg -i video.mp4 -i audio.m4a -map 0:v -map 1:a -c copy \
#       -shortest output.mp4
#   
#   -map 0:v- 从输入0（第一个输入，即video.mp4）选择v视频流。
#   -map 1:a- 从输入1（第二个输入，即audio.m4a）选择a音频流（s）。
#
#
#如何用ffmpeg在一段视频里加入循环播放的背景音乐，并且让背景音乐中间没有间断？ 
#       - 知乎 https://www.zhihu.com/question/332558461
#   使用参数 -stream_loop [n], n 可以写大一点的数，比如 10000
#
#
#   ffmpeg //输入视频，最好选一个大于一分钟的尝试 
#   -i E:\1\subtitle\out3.mp4 //输入背景音，最好短一点，方便测试是否循环 
#   -i E:\1\subtitle\music3D.wav 
#   -filter_complex //将背景音无限循环 
#   [1:a]aloop=loop=-1:size=2e+09[out]; //将背景音和视频中的音频混合 
#   [out][0:a]amix //裁剪总时长，裁剪到60秒 
#   -ss 0 -t 60 //输出 
#   -y out.mp4
#   ————————————————
#   版权声明：本文为CSDN博主「张雨明」的原创文章，
#       遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
#   原文链接：https://blog.csdn.net/yu540135101/article/details/85936923
#
#
# -filter_complex [1:a]aloop=loop=-1:size=2e+09[out];[out][0:a]amix 
#
# -map 0:v -map 1:a -filter_complex [1:a]aloop=loop=-1 -c copy
#
# How to add repeated audio background to video using FFmpeg? - Video Production Stack Exchange
#   https://video.stackexchange.com/questions/28636/how-to-add-repeated-audio-background-to-video-using-ffmpeg
#
# ffmpeg -y -stream_loop -1 -i "bg.mp3" -i "video.mp4" \
# -map 0:a:0 -map 1:v:0 -c:v copy -c:a aac -ac 2 -shortest out.mp4









