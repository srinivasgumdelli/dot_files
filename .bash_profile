export GRAILS_OPTS="-XX:MaxPermSize=256m -Xmx512m"
export MAVEN_OPTS="-XX:MaxPermSize=256m -Xmx1024m -d32"
export JAVA_OPTS="-Dfile.encoding=UTF-8"

alias mvn2='/usr/local/Cellar/maven/2.2.1/bin/mvn'
alias mvn3='/usr/local/Cellar/maven/3.0.3/bin/mvn'
alias java5='JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home;export JAVA_HOME'
alias java6='JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home;export JAVA_HOME'

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


#PROMPT_COMMAND='set_window_and_tab_title "${PWD##*/}"'
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

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
source ~/.rvm/scripts/rvm
