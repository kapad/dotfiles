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

# fasd aliases
# I'm not using any of the other aliases, but they are commonly defined for shell jumping.
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection
# alias jj='fasd_cd -d -i' # cd with interactive selection. "jj" is faster to type than "zz".
# alias j='fasd_cd -d'     # cd, same functionality as j in autojump
# alias o='f -e open'      # quick opening files with open
# alias v='f -e vim'       # quick editing files with vim

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

# kubernetes
alias k="kubectl"
alias kctx="kubectl ctx"
alias kns="kubectl ns"

# sugar
# alias grep='grep --color'
# alias egrep='egrep --color'
alias -g E2OUT='2>&1'
alias yqc='yq -PC r -'

###########################
########## Notes ##########
###########################
# * https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
#   The common aliases plugin for zsh. I've ripped things from here, but don't want to use all of those aliases. 
# * I've also ripped some aliases from other zsh locations
#    * https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/history/history.plugin.zsh
# * Below are some good aliases from the zsh-lovers manpage
#           alias -g ...='../..'
#           alias -g ....='../../..'
#           alias -g .....='../../../..'
#           alias -g CA="2>&1 | cat -A"
#           alias -g C='| wc -l'
#           alias -g D="DISPLAY=:0.0"
#           alias -g DN=/dev/null
#           alias -g ED="export DISPLAY=:0.0"
#           alias -g EG='|& egrep'
#           alias -g EH='|& head'
#           alias -g EL='|& less'
#           alias -g ELS='|& less -S'
#           alias -g ETL='|& tail -20'
#           alias -g ET='|& tail'
#           alias -g F=' | fmt -'
#           alias -g G='| egrep'
#           alias -g H='| head'
#           alias -g HL='|& head -20'
#           alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
#           alias -g LL="2>&1 | less"
#           alias -g L="| less"
#           alias -g LS='| less -S'
#           alias -g MM='| most'
#           alias -g M='| more'
#           alias -g NE="2> /dev/null"
#           alias -g NS='| sort -n'
#           alias -g NUL="> /dev/null 2>&1"
#           alias -g PIPE='|'
#           alias -g R=' > /c/aaa/tee.txt '
#           alias -g RNS='| sort -nr'
#           alias -g S='| sort'
#           alias -g TL='| tail -20'
#           alias -g T='| tail'
#           alias -g US='| sort -u'
#           alias -g VM=/var/log/messages
#           alias -g X0G='| xargs -0 egrep'
#           alias -g X0='| xargs -0'
#           alias -g XG='| xargs egrep'
#           alias -g X='| xargs'
