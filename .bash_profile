# .bash_profile

. "${HOME}/.bashrc"

export BASH_ENV="${HOME}"/.bashrc
export ENV="${BASH_ENV}"
export ENV_FILE="${BASH_ENV}"
export USERNAME="${LOGNAME}"
export HISTSIZE=10000000
export HISTFILESIZE=100000000
export HISTCONTROL=ignoredups:erasedups:ignorespace
export LESS="-i -X -R -F"
export EDITOR=vim
export SYSTEMD_COLORS=false

shopt -s histappend  # append to history file instead of replace
# Write history file on each command
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a"

stty intr ^C
stty erase ^?

alias vi='vim'
alias reboot='echo use full path to reboot'
alias ll='ls -alrt'
alias ls='ls -F'
alias lr='ls -Frt'
alias grep='grep --color --line-buffered'
alias psg='ps -aef | grep -v psg | grep -v grep | grep'
alias mps='ps -eo pid,ppid,user,bsdstart,bsdtime,tty,ni,pcpu,rss,comm --sort c'
alias awkfirst='awk -F "[ :\t#]" "{print \$1}"'
alias awsconsole='aws --output text ec2 get-console-output --instance-id'

if which colordiff 1>/dev/null 2>&1 ; then
    alias diff=colordiff
fi

function pytags() {
    find $(grealpath 2>/dev/null -s $@ || realpath -s $@) -follow -type f -name \*.py > .pyfiles && \
    pycscope -i .pyfiles
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
    STATUS=$(git status -b -uno --porcelain 2>/dev/null | head -n1)
    AHEAD=$(echo $STATUS | grep '\[ahead ' |
            sed -e 's/.* \[ahead \([0-9][0-9]*\)\].*/\1/')
    BRANCH=$(echo $STATUS | sed -e 's/## \([^\.][^\.]*\).*/\1/')
    if [ "$BRANCH" != "master" ] && [ "$BRANCH" != "main" ] && [ "$BRANCH" != "HEAD (no branch)" ]; then
        BRANCH_SUFFIX="${BOLD}#${BRANCH}${NORM}"
    elif [ "$BRANCH" == "HEAD (no branch)" ]; then
        BRANCH_SUFFIX="${BOLD}@$(git describe --tags)${NORM}"
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
    echo -e "$(basename $(dirname ${ORIGIN}))/$(basename ${ORIGIN})${BRANCH_SUFFIX}($STATUS)"
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

if [ -f /usr/local/etc/bash_completion ] ; then
    . /usr/local/etc/bash_completion
fi

[ -r ~/.bash_profile_local ] && . ~/.bash_profile_local
