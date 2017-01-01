alias grep='grep --colour=auto'
alias tmux='TERM=screen-256color tmux'

uname_value=`uname`
if [[ "$uname_value" == 'Darwin' ]]; then
    alias ls='gls --color=auto -G'
else
    alias ls='ls --color=auto -G'
fi

alias ll='ls --group-directories-first -l'
alias la='ll -A'

