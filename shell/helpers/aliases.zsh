# typing aliases should print all the set aliases
alias aliases='alias'

# ls
alias ls="ls -A --classify --color=auto" # change the default behaviour to print "almost all".
alias l="ls -1A --classify --color=auto" # print 1 file per line, almost all files
alias ll="ls -lAh --classify --color=auto" # print long form, almost all, humar readable.
alias lll="ls -lah --classify --color=auto" # print long form, all, human readable
alias lt="ls -lAtrh --classify --color=auto" # print long form, almost all, ordered by time modified (oldest first) and human readable

# safer commands. add the "-i" option by default to cp, mv and rm.
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

# utils
alias dud='du -d 1 -h' # disk utilization for all directories
alias duf='du -sh *' # disk utilization for all files and directories
alias findd='find . -type d -iname' # find file by name (case-insensitive)
alias findf='find . -type f -iname' # find directory by name (case insensitive)

# grep, egrep and fgrep
__GREP_OPTIONS="--color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
alias grep="grep ${__GREP_OPTIONS}"
alias egrep="egrep ${__GREP_OPTIONS}"
alias fgrep="fgrep ${__GREP_OPTIONS}"

# z aliases
alias j='z'
alias jj='z -c'
alias zz='z'

# history
alias h='history'
alias hs='history | grep -i --color'

# git
alias g='git'

# docker
alias d="docker"
alias dc="docker-compose"

# copy paste
alias c=pbcopy
alias v=pbpaste

# sugar
# alias grep='grep --color'
# alias egrep='egrep --color'
alias -g E2OUT='2>&1'
alias yqc='yq -PC e -'
