#!/usr/bin/env bash
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ env. <<< hostory
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 101028 zhouqi appended for gread history usage
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTFILESIZE=100000000
export HISTSIZE=1000000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
## zoomq::090630 for LaTeX
#export TEXINPUTS=/opt/mylatex/
## zoomq::070318 for
#set complete=enhance
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< 超技
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias devSAE='dev_server.py --kvdb-file=logs/kv.db'
alias clock2tinker='watch -t -n.01 "gdate +%s.%6N | figlet -f tinker-toy"'
alias clock4banner='watch -t -n.01 "gdate +%s.%6N | figlet -f banner"'


#150203 ttygif
#alias concat2gif='~/Works/_CLI/ttygif/concat_osx.sh '

#100927 via Buzz @lidaobing
alias go4cafe='cat /dev/urandom | hexdump -C | grep --color "ca fe"'
##Zoomq::101104 for hgtip book
alias hyde="python /home/zoomq/workspace/5git/hyde/hyde.py"
hydegen() { hyde -g -s $1; }
hydeweb() { hyde -w -s $1; }

alias top10cli="history | ~/.zoomq/bin/top10cli.sh "
#101104 base http://wowubuntu.com/linux_shell_3.html
wiki() { dig +short txt $1.wp.dg.cx; }
hothistory() { history | awk '{a[$2]++}END{for(i in a){print a[i] "\t" i}}' | sort -rn | head; }

#alias treesh="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias tree="/usr/local/bin/tree"


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias matter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias lsusb='system_profiler SPUSBDataType'

alias gfhstart='git flow hotfix start '
alias gfhend='git flow hotfix finish '

# 160911 aria2c
alias aria2rpc='aria2c --conf-path=${HOME}/.aria2/aria2.conf -D'

# some more ls aliases
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lah'
#alias l='ls -CF'
alias df='df -h'
alias du='du -hs'
alias netusaged='netstat -tulnp '
alias pysimpleHTTPcrt='python -m SimpleHTTPServer '
alias netstatLISTEN='netstat -an | grep LISTEN'

#   120301 Emacs !!!
#EMACS="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs"
#alias ed="$EMACS --daemon"
#alias et='emacsclient -nw -t "$@" -a ""'
#alias ex='emacsclient -nc "$@" -a ""'

#   141217 npm from taobao
#alias for cnpm\nalias 
cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

#   141217 npm from taobao
#alias rsync='/usr/bin/rsync -avzP4 --safe-links -e ssh '
alias srsync='/usr/bin/rsync -avzP4 --safe-links -e ssh '
alias drsync='/usr/bin/rsync -avzP4 --delete --safe-links -e ssh '
alias rsynclimi='rsync --bwlimit=24 '
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< 精简
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### zoomq define for mac env.
alias leolanch="python /opt/bin/leo/launchLeo.py >> /dev/null 2>&1 &"
#   170524 qShell
alias qrsync="/opt/bin/qshell qupload 4 " #ipynb_7niu.json

#   161129 .pyo
alias pyOO="python -OO -m compileall "

#   150216 for revert tmux
alias tmuxrevert="tmux attach-session -t "
#   131231 for PyEnv matters
alias pygment4lexer="./pygmentize -L lexers | grep '^*'"

#   120718 PyLint usage
alias pylintit="pylint --rcfile=~/.pylintrc "

# Added by Canopy installer on 2014-06-03
alias canopy="source /Users/zoomq/Library/Enthought/Canopy_64bit/User/bin/activate"

#   121214 for git matters
#alias gitpu2hub="git pu -u github master"
#alias gitpl4hub="git pl github master"
#alias gitpu2cafe="git pu -u cafe master"
#alias gitpl4cafe="git pl cafe master"

#   111217 for check site-packages 's path'
alias py2path4sitepackes='python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'

## zoomq::070412 add chinese cd mount perfect support
#alias mcd2utf='sudo mount -o ro,norock,iocharset=utf8 /dev/scd0 /media/cdrom0'
## zoomq::071026 fro APE into FLAC
#alias apesplit2flac="shntool split -t '%n. %t' -o flac -f "
## zoomq::101018 fro MTS to avi 320x240
#alias ffmpeg4mts2avi="~/.zoomq/bin/ffmpeg4mts2avi.sh"

### zoomq::061105 for quick action
alias 7z7z='7z a -t7z '
alias 7zip='7z a -tzip '

### 060730::my wget:
#   wget各种选项分类列表
#       启动
#   
#   -V,  --version           显示wget的版#本后退出#
#   
#       记录和输入文件
#   
#   -o,  --output-file=FILE     把记录写到FILE文件中
#   -a,  --append-output=FILE   把记录追加到FILE文件中
#   -d,  --debug                打印调试输出
#   -q,  --quiet                安静模式(没有输出)
#   -v,  --verbose              冗长模式(这是缺省设置)
#   -nv, --non-verbose          关掉冗长模式，但不是安静模式
#   -i,  --input-file=FILE      下载在FILE文件中出现的URLs
#   -F,  --force-html           把输入文件当作HTML格式文件对待
#   
#       下载
#   
#   -t,  --tries=NUMBER           设定最大尝试链接次数(0 表示无限制).
#   -O   --output-document=FILE   把文档写到FILE文件中
#   -nc, --no-clobber             不要覆盖存在的文件或使用.#前缀
#   -c,  --continue               接着下载没下载完的文件
#   -N,  --timestamping           不要重新下载文件除非比本地文件新
#   -S,  --server-response        打印服务器的回应
#   --spider                 不下载任何东西
#   -T,  --timeout=SECONDS        设定响应超时的秒数
#   -w,  --wait=SECONDS           两次尝试之间间隔SECONDS秒
#   --waitretry=SECONDS      在重新链接之间等待1...SECONDS秒
#   --random-wait            在下载之间等待0...2*WAIT秒
#   -Y,  --proxy=on/off           打开或关闭代理
#   -Q,  --quota=NUMBER           设置下载的容量限制
#   --limit-rate=RATE        限定下载输率
#   
#       目录
#   
#   -nd  --no-directories            不创建目录
#   -x,  --force-directories         强制创建目录
#   -nH, --no-host-directories       不创建主机目录
#   -P,  --directory-prefix=PREFIX   将文件保存到目录 PREFIX/...
#   --cut-dirs=NUMBER           忽略 NUMBER层远程目录
#   
#       HTTP 选项
#   
#   --http-user=USER      设定HTTP用户名为 USER.
#   --http-passwd=PASS    设定http密码为 PASS.
#   -E,  --html-extension      将所有text/html文档以.html扩展名保存
#   -s,  --save-headers        保存HTTP头到文件
#   -U,  --user-agent=AGENT    设定代理的名称为 AGENT而不是 Wget/VERSION.
#   --cookies=off         不使用 cookies.
#   --load-cookies=FILE   在开始会话前从文件 FILE中加载cookie
#   --save-cookies=FILE   在会话结束后将 cookies保存到 FILE文件中
#   
#       递归下载
#   
#   -r,  --recursive          递归下载－－慎用!
#   -l,  --level=NUMBER       最大递归深度 (inf 或 0 代表无穷).
#   --delete-after       在现在完毕后局部删除文件
#   -k,  --convert-links      转换非相对链接为相对链接
#   -K,  --backup-converted   在转换文件X之前，将之备份为 X.orig
#   -m,  --mirror             等价于 -r -N -l inf -nr.
#   -p,  --page-requisites    下载显示HTML文件的所有图片
#   
#       递归下载中的包含和不包含(accept/reject)
#   
#   -A,  --accept=LIST                分号分隔的被接受扩展名的列表
#   -R,  --reject=LIST                分号分隔的不被接受的扩展名的列表
#   -D,  --domains=LIST               分号分隔的被接受域的列表
#   --exclude-domains=LIST       分号分隔的不被接受的域的列表
#   --follow-ftp                 跟踪HTML文档中的FTP链接
#   --follow-tags=LIST           分号分隔的被跟踪的HTML标签的列表
#   -G,  --ignore-tags=LIST           分号分隔的被忽略的HTML标签的列表
#   -H,  --span-hosts                 当递归时转到外部主机
#   -L,  --relative                   仅仅跟踪相对链接
#   -I,  --include-directories=LIST   允许目录的列表
#   -X,  --exclude-directories=LIST   不被包含目录的列表
#   -np, --no-parent                  不要追溯到父目录
alias wget='wget -e robots=off -U Mozilla'
alias wget4book='wget -m -nv -np -N -k'
#alias wgetcomics='wget -nv --random-wait -x -k '
### zoomq::060814 dl novel
#alias wgetnovel='wgetcomics -r -A.htm,.html -p '
#-l500 -I wenxue/2332 http://www.yesho.com/wenxue/2332/ &
# http://www.ranwen.net/files/article/10/10332/index.html

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ hosts matter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias sshvpnSORA='ssh -fnNq -D 7070 sora'
alias sshvpnOBP='ssh -fnNq -D 7070 obp'
#alias sshvpn1SSS='ssh -fnNq -D 7070 SS1'
#alias sshvpn2SSS='ssh -fnNq -D 7070 SSS2'
#alias sshvpn3SSS='ssh -fnNq -D 7070 SS3'
#alias sshvpnGCP='ssh -fnNq -D 7070 gcp4aa'
alias sshvpnUSEE='ssh -fnNq -D 7070 usee'


#alias sshvpn2pycon='ssh -fnNq -D 17171 pyconzq'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< 专用
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   '/opt/bin/t2t/txt2tags '
alias t2t='~/zq.pyblosxom/zoomquiet/plugins/preformatter/txt2tags.py'
#   for PyBlosxom usage self t2t
alias t2t4pyb='~/zq.pyblosxom/zoomquiet/plugins/preformatter/txt2tags.py'
#   110225 ZQ:for usage webSequenceDiagram.com
alias webSequenceDiagram='python ~/Works/3hg/zqlib-tangle/webSequenceDiagram/getSequenceDiagram.py'

ZOOMQ="/opt/bin/.zoomq/bin"
#   131231 for PyEnv matters
#alias pyenv4upgrade="$ZOOMQ/pyEnv4upgrade.sh"
#   150708 jump /Volumes/Macintosh HD
alias jump2selfROOT="source $ZOOMQ/jump2selfROOT.sh"

#   120627 for OBP changed all Chinese marksa
alias zhmark2en="$ZOOMQ/zhmark2en.sh "
#   120907 for data uri img
alias data_uri="python $ZOOMQ/data_uri.py"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ESP. matter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   110914 for pythonbrew
#[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
#   111102 base hgtip
#bitb() {
#    local P="$(hg paths 2>/dev/null | grep 'bitbucket.org' | head -1)"
#    local URL="$(echo $P | sed -e's|.*\(bitbucket.org.*\)|http://\1|')"
#    [[ -n $URL ]] && /usr/bin/epiphany $URL || echo "No BitBucket path found!"
#}
#   160702
#alias cfGo2Shell="open -a Go2Shell --arg config"


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ENV. matter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   150211 for Pg
#export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
#   140103 for moc-2.5.0-beta1
#export PATH=/usr/local/Cellar/moc/2.5.0-beta1/bin:$PATH
#   140103 for cmus from github
#export PATH=$PATH:$HOME/bin/cmus/bin
#   140103 for vitunes from github
#export PATH=$HOME/bin/vitunes/bin:$PATH

#   151009 for New /Volumes/MacintoshHD/Users/zoomq/ as Home
#source ~/.zoomq/bin/jump2selfROOT.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< END
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
