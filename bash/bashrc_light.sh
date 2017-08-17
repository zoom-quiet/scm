# .bashrc
# 101105 http://stevelosh.com/blog/2009/03/mercurial-bash-prompts/
#export PS1='\n\u at \h in \w\n$ '
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'
export PS1='\n${PINK}\u${D} @ ${ORANGE}\H ${D}in ${GREEN}\w \n$ '

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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ alias <<<
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
#100927 via Buzz @lidaobing
alias go4cafe='cat /dev/urandom | hexdump -C | grep --color "ca fe"'
#101104 base http://wowubuntu.com/linux_shell_3.html
wiki() { dig +short txt $1.wp.dg.cx; }
hothistory() { history | awk '{a[$2]++}END{for(i in a){print a[i] "\t" i}}' | sort -rn | head; }


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
