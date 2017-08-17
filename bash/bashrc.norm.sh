#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ env. <<< prompt
# 101105 http://stevelosh.com/blog/2009/03/mercurial-bash-prompts/
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'
#export PS1='\n${PINK}\u${D} @ ${ORANGE}\H ${D}in ${GREEN}\w \n# '
#export PS1='${PINK}\u${D} @ ${ORANGE}\H ${D} ${GREEN}\w ${D}\n# '
export PS1='${PINK}\u${D} @ ${ORANGE}\H ${D} ${GREEN}\w ${D}\n$ '

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ env. <<< hostory
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias matter
#bind '"\e[A": history-search-backward'
#bind '"\e[B": history-search-forward'
# some more ls aliases
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lah'
alias l='ls -CF'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< daily
#alias netusaged='netstat -tulnp '
#alias netstatLISTEN='netstat -an | grep LISTEN'
alias pysimpleHTTPcrt='python -m SimpleHTTPServer '
#100927 via Buzz @lidaobing
alias go4cafe='cat /dev/urandom | hexdump -C | grep --color "ca fe"'
#101104 base http://wowubuntu.com/linux_shell_3.html
wiki() { dig +short txt $1.wp.dg.cx; }
hothistory() { history | awk '{a[$2]++}END{for(i in a){print a[i] "\t" i}}' | sort -rn | head; }
#100927 via Buzz @lidaobing
alias go4cafe='cat /dev/urandom | hexdump -C | grep --color "ca fe"'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< Ubuntu
alias acs='apt-cache search'
alias agu='sudo apt-get update'
#alias agu='sudo apt-fast update'
alias agg='sudo apt-get upgrade'
#alias agg='sudo apt-fast upgrade'
#	alias agd='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
#alias agi='sudo apt-fast install'
alias agclean='sudo apt-get clean && sudo apt-get autoclean'
#	alias agr='sudo apt-get remove'
#   alias agin='sudo aptitude install'
## 070211 zoomq::usage aptitude  replace apt
alias apse='aptitude search'
alias apsh='sudo aptitude show'
alias apu='sudo aptitude update'
alias apg='sudo aptitude safe-upgrade'
#alias apd='sudo aptitude dist-upgrade'
alias api='sudo apt-get install'
alias aprm='sudo aptitude remove'
alias apclean='sudo aptitude autoclean'


### 091201:zoomq append auickly action for Ubuntu PPA
alias ppaddkey='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
