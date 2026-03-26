# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vim=nvim
alias g='git log --oneline --graph --all'

# Directory bookmarks
alias mark="pwd > ~/.sd"
alias port='cd $(cat ~/.sd)'

# Bash completion framework
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# fzf integration
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
[ -f /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

# Environment
export EDITOR=nvim
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# Prompt with exit code indicator
PS1='\[\033[34m\]\u@\h\[\033[0m\] \[\033[36m\]\w\[\033[0m\] $(if [ $? = 0 ]; then echo "\[\033[32m\]✓"; else echo "\[\033[31m\]✗"; fi)\[\033[0m\] > '

# Source machine-specific config
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
