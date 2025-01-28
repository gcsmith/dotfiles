HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

command -v dircolors >/dev/null && eval `dircolors -b`
command -v gdircolors >/dev/null && eval `gdircolors -b`

autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U promptinit && promptinit

# prompt gentoo
export PS1="$(print '%{\e[1;32m%}%n%{\e[0m%}'):$(print '%{\e[1;34m%}%~%{\e[0m%}')$ "
export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

export PAGER=less
export EDITOR=vim
export CVSEDITOR=vim
export BROWSER=links
export XTERM="aterm +sb -geometry 80x29 -fg black -bg lightgoldenrodyellow -fn -xos4-terminus-medium-*-normal-*-14-*-*-*-*-*-iso8859-15"
export PATH=/usr/local/share/python:/usr/local/sbin:/usr/local/bin:$PATH

unsetopt beep
unsetopt BG_NICE
unsetopt correctall
setopt extendedglob
setopt hist_ignore_all_dups
setopt hist_ignore_space

# disable control flow (ctrl+q/ctrl+s -- interferes with tmux)
setopt noflowcontrol
stty -ixon -ixoff

# set input mode to VI, but still give me the bash/emacs style CTRL+A / CTRL+E
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward

zstyle :compinstall filename '/home/garrett/.zshrc'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

function mkcd() { mkdir -p $1 && cd $1 }

# LANG=POSIX
KEYTIMEOUT=1

export DC_ARM_BASE=/Users/garrett/Projects/cadcdev/toolchain/sh-elf

