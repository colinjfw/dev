#!/bin/bash

function git_branch() {
  git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ /[/" | sed "s/$/]/"
}

NORMAL="\[\e[0m\]"
GREEN="\[\e[1;30m\]"
BRANCH=$(git_branch)

export PS1="$GREEN\W $BRANCH \$ $NORMAL"

function to() {
  arg="$1/$2"
  if [ "$1" == "c" ]; then arg="coldog"; fi
  cd $HOME/Workspace/src/github.com/$arg
}

alias com="git add -A && git commit -m"

export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"

set -o vi

# Since I am using a non-POSIX locale this is needed so that sort produces reliable output.
export LC_ALL=C
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

if [ -x "$(command -v bat)" ]; then
  alias cat="bat"
fi

source /etc/profile.d/bash_completion.sh
