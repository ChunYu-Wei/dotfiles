# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Custom plugins added to $ZSH_CUSTOM/plugins/
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Customized prompt
[[ ! -f $ZSH/.p10k.zsh ]] || source $ZSH/.p10k.zsh

# Alias
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

alias cp='cp -i'
alias mv='mv -i'

alias g='git'
