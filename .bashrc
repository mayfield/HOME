# .bashrc
SHELL_SESSION_HISTORY=0
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f /etc/bashrc ] && [ -r /etc/bashrc ] ; then
    . /etc/bashrc
fi

if [ -f /usr/local/etc/bash_completion ] ; then
    . /usr/local/etc/bash_completion
fi

alias vi='vim'
alias reboot='echo use full path to reboot'
alias ll='ls -alrt'
alias ls='ls -F'
alias lr='ls -Frt'
#alias grep='grep --binary-files=text --color --line-buffered'
alias grep='grep --color --line-buffered'
alias psg='ps -aef | grep -v psg | grep -v grep | grep'
alias mps='ps -eo pid,ppid,user,bsdstart,bsdtime,tty,ni,pcpu,rss,comm --sort c'
alias awkfirst='awk "{ print \$1 }"'
alias dmake='make --debug=v'
alias sshecs='ssh -i ~/.ssh/ecs.pem -l ec2-user'
alias dockerenv='eval $(docker-machine env local)'
alias awsdockerenv='eval $(docker-machine env aws)'
alias dockviz="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias awsconsole="aws --output text ec2 get-console-output --instance-id"
alias sshecs='ssh -i ~/.ssh/ecs.pem -l ec2-user'
if which colordiff 1>/dev/null 2>&1 ; then alias diff=colordiff ; fi

function sshhome() {
    ssh -p 2222 $(ecmip home_gateway)
}

function ecmip() {
    NAME=$1
    shift
    IP=$(ecm routers search "name:$NAME" --csv --columns 7 --no-header $@)
    echo $IP | tr -d '\r'
}

function dpsg() {
    docker ps -a | grep "$@" | awk '{print $1}'
}

function denv() {
    if [ -z "$1" ] ; then
        OPT=default
    else
        OPT=
    fi
    eval $(docker-machine env $OPT$@)
}

function dflush() {
    RUNNING=$(docker ps -q)
    if [ -n "$RUNNING" ] ; then
        docker kill $RUNNING
    fi
    CONTAINERS=$(docker ps -aq)
    if [ -n "$CONTAINERS" ] ; then
        docker rm -f $CONTAINERS
    fi
    IMAGES=$(docker images -aq)
    if [ -n "$IMAGES" ] ; then
        docker rmi -f $IMAGES
    fi
}


function pytags() {
    find $(grealpath 2>/dev/null -s $@ || realpath -s $@) -follow -type f -name \*.py > .pyfiles && \
    pycscope -i .pyfiles -f .cscope_db
    rm -f .pyfiles
}

function filewatch() {
    inotifywait --exclude '\.(swx|swp)' -e modify -e delete -e create -e move -r $@ 1>/dev/null 2>&1
}


function git-repo-status() {
    #ORIGIN=$(basename $(git config remote.origin.url 2>/dev/null) 2>/dev/null)
    URL=$(git config remote.origin.url 2>/dev/null)
    if [ -z "$URL" ] ; then
        return
    fi
    if (echo $URL | grep -qE '\w+:\/\/') ; then
        ORIGIN=$(echo $URL | sed -E 's/[a-zA-Z]+:\/\/[^\/]+\/([^\.]*).*/\1/')
    else
        ORIGIN=$(echo $URL | sed -E 's/[a-zA-Z]+@[^:]+:([^\.]*).*/\1/')
    fi
    NORM="\033[0m"
    BOLD="\033[1m"
    RED="\033[31m"
    GREEN="\033[32m"
    CYAN="\033[36m"
    BLUE="\033[34m"
    STATUS=$(git status -b -uno --porcelain 2>/dev/null)
    AHEAD=$(echo $STATUS | grep '\[ahead ' |
            sed -e 's/.* \[ahead \([0-9][0-9]*\)\].*/\1/')
    BRANCH=$(echo $STATUS | sed -e 's/## \([^\.][^\.]*\).*/\1/')
    if [ "$BRANCH" != "master" ] ; then
        BRANCH_SUFFIX="${BOLD}#${BRANCH}${NORM}"
    else
        BRANCH_SUFFIX=""
    fi
    DIFFSTAT=$(git diff --shortstat)
    STATUS=
    if [ -n "$DIFFSTAT" ] ; then
        DIFFADDED=$(echo $DIFFSTAT | grep insertion |
                    sed -e 's/.* \([0-9][0-9]*\) insertion.*/\1/')
        DIFFREMOVED=$(echo $DIFFSTAT | grep deletion | 
                      sed -e 's/.* \([0-9][0-9]*\) deletion.*/\1/')
        STATUS="$GREEN+${DIFFADDED:-0}$NORM/$RED-${DIFFREMOVED:-0}$NORM"
    fi
    if [ -n "$AHEAD" ] ; then
        AHEAD="$BLUE^$AHEAD$NORM"
        if [ -n "$STATUS" ] ; then
            STATUS="$STATUS/$AHEAD"
        else
            STATUS=$AHEAD
        fi
    fi
    echo -e "${ORIGIN}${BRANCH_SUFFIX}($STATUS)"
}

# shortcut to awk column selection based on spaces, colons and commas.
function column() {
    awk -F'[ \t,:]+' '{ print $'$1' }'
}

if [ -n "$(tty)" ] && [ -n "$TERM" ] && [ "$TERM" != "dumb" ]; then
	PS1=": $(tput smso)$LOGNAME$(tput rmso)@$(hostname -s) [\$(git-repo-status)] \${PWD#'$HOME'/} ;\n:; "
	PS2=": [.2] ; "
	PS3=": [.3] ; "
	PS4=": [.4] ; "
fi

export LESS="-i -X -R -F"
export EDITOR=vim
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig

export GOPATH=~/project/.go
PATH=$PATH:$GOPATH/bin
export CSCOPE_DB=.cscope_db

PATH=$PATH:~/project/odyssey/tools/bin

export ODYSSEY_DEFAULT_STACK=mayfield

[ -r ~/.bashrc_local ] && . ~/.bashrc_local
