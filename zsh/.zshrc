# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner <http://mkoerner.de/>

# zsh config file



# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# for stu
export MANPATH="$HOME/man:$MANPATH"

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd extendedglob
bindkey -v

export TERM='xterm-256color'

export KEYTIMEOUT=1

# Ctrl-R for reverse incremental search
bindkey "^R" history-incremental-search-backward

zstyle :compinstall filename "$HOME/.zshrc"


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


# from Jerome Kunegis
git() {
    if [ $# -eq 0 ] ; then
        git log --oneline origin/master..HEAD && git status -s
    else
        command git "$@"
    fi
}

# ls coloring
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#add interactive mode
#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -i'

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


# vim mode visualization from: https://zeitkraut.de/posts/2014-06-29-howto-zsh-vi-style.html
setopt prompt_subst

# Set the colors to your liking
local vi_normal_marker="[%{$fg[green]%}%BN%b%{$reset_color%}]"
local vi_insert_marker="[%{$fg[cyan]%}%BI%b%{$reset_color%}]"
local vi_unknown_marker="[%{$fg[red]%}%BU%b%{$reset_color%}]"
local vi_mode="$vi_insert_marker"
vi_mode_indicator () {
  case ${KEYMAP} in
    (vicmd)      echo $vi_normal_marker ;;
    (main|viins) echo $vi_insert_marker ;;
    (*)          echo $vi_unknown_marker ;;
  esac
}

# run vtex from ./vim/bin/vtex
# open a file using the default editor
vtex () {
  if [ -z "$1" ] ; then
      echo "No argument supplied"
  else
    if [ -f $1 ] ; then
      ~/.vim/bin/vtex $1
    else
      echo "'$1' is not a valid file"
    fi
  fi
}


# Reset mode-marker and prompt whenever the keymap changes
function zle-line-init zle-keymap-select {
  vi_mode="$(vi_mode_indicator)"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Multiline-prompts don't quite work with reset-prompt; we work around this by
# printing the first line(s) via a precmd which is executed before the prompt
# is printed.  The following can be integrated into PROMPT for single-line
# prompts.
#
# Colorize freely
#local user_host='%B%n%b@%m'
#local current_dir='%~'
#precmd () print -rP "${user_host} ${current_dir}"

local return_code="%(?..[%{$fg[red]%}%?%{$reset_color%}] )"
PS1='${return_code}%{$fg[green]%}%n@arch%{$reset_color%}${vi_mode}:%{$fg[blue]%}%~%{$reset_color%}%% '

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

