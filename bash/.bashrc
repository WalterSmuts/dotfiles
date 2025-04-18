#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

source /usr/share/fzf/key-bindings.bash

export EDITOR=nvim
shopt -s autocd

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias g='git log --oneline --graph --all'
alias vim='nvim'
alias gdb='gdb -x ~/.gdbinit_x'
alias wifi='nmcli device wifi'
gr() {
	git grep -l "$1" | xargs sed -i "s/$1/$2/g"
}

export PATH=$HOME/Development/custom-scirpts/:$PATH
export PATH=$HOME/.pack/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.local/bin/:$PATH

[ -f "/home/walter/.ghcup/env" ] && source "/home/walter/.ghcup/env" # ghcup-env
