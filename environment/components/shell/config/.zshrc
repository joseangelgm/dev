export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  #git,
  wd
)

source $ZSH/oh-my-zsh.sh

# Personal exports
export EDITOR=/usr/bin/vim
export SUDO_EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/chromium

# Example aliases
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
