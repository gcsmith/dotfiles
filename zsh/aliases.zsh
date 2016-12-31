uname_value=`uname`

alias grep='grep --colour=auto'
alias tmux='TERM=screen-256color tmux'

if [[ "$uname_value" == 'Darwin' ]]; then
    alias ls='gls --color=auto -G'
    alias ll='gls --color=auto -l --group-directories-first'
    alias la='gls --color=auto -Al'
else
    alias ls='ls --color=auto -G'
    alias ll='ls --color=auto -l --group-directories-first'
    alias la='ls --color=auto -Al'
fi

