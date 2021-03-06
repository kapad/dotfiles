# ripped from oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/completion.zsh
# fixme - the load process here seems a bit bizarre
# WARN: take care not to add any compdef lines here because that would risk startup time.
zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

expand-or-complete-with-dots() {
    print -Pn "%F{red}…%f"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
# Set the function as the default tab completion widget
# bindkey -M emacs "^I" expand-or-complete-with-dots
# bindkey -M viins "^I" expand-or-complete-with-dots
# bindkey -M vicmd "^I" expand-or-complete-with-dots

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

#######################################################################################################################
# kubectl
# #######
# NOTE: Prefer using a customized file after generating it using kubectl completion zsh
#######################################################################################################################
# kubectl-ctx and kubectl-ns
# autoload -U -z +X _kubectx
# autoload -U -z +X _kubens
# compdef _kubectx 'kubectl-ctx'
# compdef kctx='kubectl-ctx'
# compdef _kubens 'kubectl-ns'
# compdef kns='kubectl-ns'
# autoload -U -z +X ${HELPERS_DIR}/completion/_kubectl.zsh
# compdef _kubectl.zsh kubectl
# kc
# autoload -U -z +X ${PLUGINS_DIR}/kc/completion/kc.zsh
# compdef kc.zsh kc
# kubech


#######################################################################################################################
# Notes
# #####
# Some other completions that I had copied from somewhere. I'm keeping this as a backup here in case any of these 
# completions are needed later.
#######################################################################################################################
# custom completion styles
# move this to the completion helper
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' special-dirs true
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# zstyle ':completion:*' use-cache yes
# zstyle ':completion:*' cache-path ${ZSH_CACHE_DIR}
# zstyle '*' single-ignored show
