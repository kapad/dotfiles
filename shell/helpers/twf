# function that loads the twf widget with the provided config, and then inserts the selected text in the command editor.
twf-widget() {
    local selected=$(twf \
                    -height 0.5 \
                    -bind 'down::tree:next,up::tree:prev,right::tree:open,left::tree:close,shift-down::preview:down,shift-up::preview:up,shift-right::tree:openAll,shift-left::tree:closeAll' \
                    -locateCmd "fzf --height=50% --reverse --margin 3%")
    BUFFER="$BUFFER$selected"
    zle reset-prompt
    zle end-of-line
    return $ret
}

zle -N twf-widget
bindkey '^P' twf-widget


#fzf --height=50% --reverse --margin 3% --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
