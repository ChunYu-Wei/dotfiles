set -o vi

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git aliases
alias g='git'

export EDITOR=vim

source .bash/prompt.sh
