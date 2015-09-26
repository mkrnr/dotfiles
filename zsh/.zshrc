# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner <http://mkoerner.de/>

# zsh config file

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd extendedglob
bindkey -v

export KEYTIMEOUT=1

zstyle :compinstall filename '/home/martin/.zshrc'

autoload -Uz compinit
compinit


autoload -U colors && colors

# tab completion for both ends of the word
setopt completeinword

# case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# use the same colors as ls for completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# promt
PS1="%{$fg[green]%}%n@arch%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}%% "

export VISUAL="vim"

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1        ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1       ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1        ;;
      *.tbz2)      tar xjf $1      ;;
      *.tgz)       tar xzf $1       ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# open a file using the default editor
o () {
  if [ -z "$1" ] ; then
      echo "No argument supplied"
  else
    if [ -f $1 ] ; then
      xdg-open $1 &!
    else
      echo "'$1' is not a valid file"
    fi
  fi
}

# open a file using the default editor and close the terminal
oe () {
  if [ -z "$1" ] ; then
      echo "No argument supplied"
  else
    if [ -f $1 ] ; then
      xdg-open $1 &!
      exit 1
    else
      echo "'$1' is not a valid file"
    fi
  fi
}

# ls coloring
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# set vim as the default editor
export VISUAL=vim
export EDITOR="vim"

# path for bc config file
export BC_ENV_ARGS=~/.bcrc

alias  bc='bc -l'

# for mosesdecoder
export SCRIPTS_ROOTDIR=/opt/moses/moses-scripts

# reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
