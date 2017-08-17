# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ env. matter
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ env. <<< prompt
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\h:\w\$'
    ;;
*)
    PS1=':~\e[32;1m\$\[\e[0m\] '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac
# base http://rockhopper.dk/linux/software/zsh-bash-screen-and-urxvt-title/
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#PS1='\[\033[0;32m\]\h\[\033[00m\]:\w> '
#export PS1 PROMPT_COMMAND

# 101105 http://stevelosh.com/blog/2009/03/mercurial-bash-prompts/
#export PS1='\n\u at \h in \w\n$ '
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

hg_ps1() {
    #hg prompt "{${D} on ${PINK}{branch}}{${D} at ${ORANGE}{bookmark}}{${GREEN}{status}}" 2> /dev/null
    hg prompt "{${D}on ${PINK}{branch}}{${GREEN}{status}}" 2> /dev/null
}

export PS1='\n${PINK}\u${D} @ ${ORANGE}\h ${D}in ${GREEN}\w $(hg_ps1)${D}\n$ '


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

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

## zoomq::090630 for LaTeX
#export TEXINPUTS=/opt/mylatex/
## zoomq::070318 for 
#set complete=enhance
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias matter

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< 日常
# some more ls aliases
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lah'
alias l='ls -CF'
#alias df='df -h'
#alias du='du -hs'
alias netusaged='netstat -tulnp '
alias pysimpleHTTPcrt='python -m SimpleHTTPServer '
alias netstatLISTEN='netstat -an | grep LISTEN'
#100927 via Buzz @lidaobing
alias go4cafe='cat /dev/urandom | hexdump -C | grep --color "ca fe"'
#101104 base http://wowubuntu.com/linux_shell_3.html
wiki() { dig +short txt $1.wp.dg.cx; }
hothistory() { history | awk '{a[$2]++}END{for(i in a){print a[i] "\t" i}}' | sort -rn | head; }


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<< Ubuntu
### 060802 Zoomq::for apt usage
alias ses='sudo gedit /etc/apt/sources.list'
#   101019 Zoomq usage apt-fast replace apt-get
#   sudo add-apt-repository ppa:tldm217/tahutek.net
#   sudo apt-get update
#   sudo apt-get install apt-fast
alias acs='apt-cache search'
#alias agu='sudo apt-get update'
alias agu='sudo apt-fast update'
#	alias agg='sudo apt-get upgrade'
alias agg='sudo apt-fast upgrade'
#	alias agd='sudo apt-get dist-upgrade'
#alias agi='sudo apt-get install'
alias agi='sudo apt-fast install'
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
