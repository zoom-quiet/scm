#!/bin/sh
#=========================================================== action bath
# base ffmpeg make nature video as time_lapse
#
# 200625 merge BGM loop
# 200624 merge BGM
# 200623 ask push
# 200622 init.
#=========================================================== action bath
RES=$1
AIM=$2
VNAME=`echo $RES | cut -d "." -f 1`
echo "got filename : $VNAME"
echo "exp. as : $AIM.mp4"

#ffmpeg -i $RES  -filter_complex "[0:v]setpts=0.32*PTS[v]" -map "[v]" "$AIM-zip.mp4"

ffmpeg -i $RES -filter_complex "[0:v]setpts=0.25*PTS[v];[0:a]atempo=4[a]" -map "[v]" -map "[a]" "$AIM-zip.mp4"


ffmpeg -i "$AIM-zip.mp4" -stream_loop -1 -i "06_part_of_life.mp3" -filter_complex [0:a][1:a]amix -shortest "$AIM-click+mu.mp4"

# ༄  ffmpeg -i 210808-563d-acts-22.3-7-0bgm.mp4  -stream_loop -1 -i "06_part_of_life.mp3" -filter_complex [0:a][1:a]amix -shortest  210808-563d-acts-22.3-7-0bgm-zip-mu-1.mp4


echo "Usage:"
echo "\t 源视频文件(含后缀) 目标视频名(不用后缀)"
echo "try:"
echo "\t $RES -> $AIM-zip + BGM-> $AIM-zip-mu \n"


exit  0

# 用ffmpeg添加重复的背景音频 - 码客 
#    https://oomake.com/question/1489367 

# ffmpeg具有有前景的-loop_input标志，但它还不支持音频输入。 我建议sox和-shortest选项ffmpeg作为解决方案。

#sox -i short_audio.mp3 looped_audio.mp3 repeat 1000 # adjust count as necessary
#ffmpeg -i input_video.mp4 -i looped_audio.mp3 -shortest output_video.mp4
#sox命令将循环输入，ffmpeg命令将其用于音频，但在视频处理完毕时停止。

# 保留原声合并音视频 ffmpeg -i bgm.mp3 -i input.mp4 -filter_complex amix=inputs=2:duration=first:dropout_transition=2 output.mp4

# (注意:inputs=输入流数量, duration=决定流的结束,dropout_transition= 输入流结束时,容量重整时间, (longest最长输入时间,shortest最短,first第一个输入持续的时间)) 

# Ffmpeg实例，为视频添加一个循环播放的背景音乐_张雨的博客-CSDN博客_ffmpeg 背景音乐
# https://blog.csdn.net/yu540135101/article/details/85936923
#方案2（推荐）（混声）
#
#   ffmpeg -i video.mp4 -stream_loop -1 -i audio.wav -filter_complex [0:a][1:a]amix -t 60 -y out.mp4

#其中
#-stream_loop -1 -i audio.wav
#-stream_loop -1 参数-1代表循环输入源
#[0:a][1:a]amix 将0和1号的音频流进行混合
#-t 60 裁剪60秒

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
-filter_complex "[0:v]copy [vout];
[0:a]volume=volume=0 [aout0];
[1:a]volume=volume=1 [aout1];
[aout1]aloop=loop=-1:size=2e+09,atrim=0:43[aconcat]; 
[aout0][aconcat]amix=inputs=2:duration=longest:dropout_transition=0 [aout]" 

-map [vout] 
-map [aout] 
-y


echo "Usage:"
echo "\t 源视频文件(含后缀) 目标视频名(不用后缀)"
echo "try:"
echo "\t $RES -> $AIM-zip + BGM-> $AIM-zip-mu \n"


#=========================================================== action DONE
exit  0
#   refer.
#
# 201201 contect many movies
#   FFMpeg无损合并视频的多种方法 - 简书
#   https://www.jianshu.com/p/a9bccc12229b
#  ffmpeg -f concat -i filelist.txt -c copy output.mkv
# 同时对视频和音频倍速播放：

#ffmpeg -i input.mkv -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" output.mkv
# ffmpeg.exe -ss 00:48:39.883 -to 01:09:26.143 -i F:\a.mp4 -c:v h264_nvenc -filter_complex "[0:v]setpts=0.6666667*PTS[v];[0:a]atempo=1.5[a]" -map "[v]" -map "[a]" -r 25 F:\b.mp4
# 0.89 1.12359551
# 0.32 3.125
#    音量调整为当前音量的1.5倍

#ffmpeg -i input.wav -filter:a "volume=1.5" output.wav

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



