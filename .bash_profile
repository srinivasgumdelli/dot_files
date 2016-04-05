alias enable_jrebel='export MAVEN_OPTS="-XX:MaxPermSize=256m -Xmx1024m -d32 -noverify -javaagent:/Applications/ZeroTurnaround/JRebel/jrebel.jar"'

function set_window_and_tab_title
{
    local title="$1"
    if [[ -z "$title" ]]; then
        title="root"
    fi

    local tmpdir=~/Library/Caches/${FUNCNAME}_temp
    local cmdfile="$tmpdir/$title"

    # Set window title
    echo -n -e "\e]0;${title}\a"

    # Set tab title
    if [[ -n ${CURRENT_TAB_TITLE_PID:+1} ]]; then
        kill $CURRENT_TAB_TITLE_PID
    fi
    mkdir -p $tmpdir
    ln /bin/sleep "$cmdfile"
    "$cmdfile" 10 &
    CURRENT_TAB_TITLE_PID=$(jobs -x echo %+)
    disown %+
    kill -STOP $CURRENT_TAB_TITLE_PID
    command rm -f "$cmdfile"
}

function parse_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/' 
}

PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
RED="\[\033[0;31m\]"
DEFAULT="\[\033[0m\]"
PS1="[\$CurDir]$RED\$(parse_git_branch)$DEFAULT \$ "

if [[ $PATH != /usr/local/bin* ]]; then
    export PATH=/usr/local/bin:$PATH
fi

if [[ $PATH != */go/storm* ]]; then
    export PATH=$PATH:/usr/local/go/storm-0.5.3/bin
fi

if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
fi

# options that may be used
set -o vi
source ~/.rvm/scripts/rvm

# all export vars
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export JAVA_HOME=$(/usr/libexec/java_home) 
export GOPATH=/Users/gumdelli/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$GOPATH/bin:$PATH

# all aliases
alias ll="ls -al"
alias Repos="cd ~/Repos"
alias pull_rebase="git pull --rebase upstream master"
alias desktop="cd ~/Desktop"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias reload="source ~/.bash_profile"
alias prettyenv="env | awk -F \":\" '{print|\"$1 sort -n\"}'"
alias vimrc="vim ~/.vimrc"
alias bashprofile="vim ~/.bash_profile"

# for thefuck script
eval "$(thefuck --alias)"
alias fu="fuck"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
