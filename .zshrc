# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

plugins=(git ruby)

# User configuration

source $ZSH/oh-my-zsh.sh
prompt_context () { }

# Customizations
clone ()
{
    git clone $1
}

if [[ $PATH != /usr/local/bin* ]]; then
    export PATH=/usr/local/bin:$PATH
fi

# options that may be used
set -o vi
source ~/.rvm/scripts/rvm

# all export vars
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export JAVA_HOME=$(/usr/libexec/java_home) 
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$GOPATH/bin:$PATH

# all aliases
alias ll="ls -al"
alias repos="cd ~/Repos"
alias pull_rebase="git pull --rebase upstream master"
alias desktop="cd ~/Desktop"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias reload="source ~/.zshrc"
alias prettyenv="env | awk -F \":\" '{print|\"$1 sort -n\"}'"
alias vimrc="vim ~/.vimrc"
alias zshprofile="vim ~/.zshrc"
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias vim="/usr/local/Cellar/vim/7.4.1847_1/bin/vim"

# for thefuck script
eval "$(thefuck --alias)"
alias fu="fuck"
