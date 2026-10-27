# .bash_profile

. "${HOME}/.bashrc"

shopt -s histappend  # append to history file instead of replace

export BASH_ENV="${HOME}"/.bashrc
export ENV="${BASH_ENV}"
export ENV_FILE="${BASH_ENV}"
export USERNAME="${LOGNAME}"
export HISTSIZE=1000000000
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTTIMEFORMAT="%F %T "

export LESS="-i -X -R -F -j10"
export EDITOR=vim
export SYSTEMD_COLORS=false
export HOSTNAME_SHORT=$(hostname -s)
export CURRENT_TITLE='...'

stty intr ^C
stty erase ^?

alias vi='vim'
alias reboot='echo use full path to reboot'
alias ll='ls -alrt'
alias ls='ls -F'
alias lr='ls -Frt'
alias grep='grep --color --line-buffered'
alias awkfirst='awk -F "[ :\t#]" "{print \$1}"'
alias awsconsole='aws --output text ec2 get-console-output --instance-id'

if which colordiff 1>/dev/null 2>&1 ; then
    alias diff=colordiff
fi


function _inject_title_addendum() {
    local abort_signal pid cmd last_pid iterations backoff
    abort_signal=$(mktemp -d "${TMPDIR:-/tmp}/bash-term-title.XXXXXX")
    if [ -z "$abort_signal" ] ; then
        return
    fi

    # Must be run in background to get correct ps info.
    # Uses tmp file/dir for lock/signal sync with parent
    (
        iterations=0
        while [ $((iterations++)) -lt 100 ] ; do
            if [ ! -d "$abort_signal" ] ; then
                return
            fi
            pid=$(ps -o tpgid= -p $$ 2>/dev/null | tr -d ' ')
            if [ "$pid" == "$$" ] ; then
                # we're too early
                sleep 0.010
                continue
            elif [ "$pid" != "$last_pid" ] ; then
                cmd=$(ps -o args= -p "$pid" 2>/dev/null)
                # "-bash" means the child process is still fork/exec-ing
                if [ -n "$cmd" ] && [ "$cmd" != "-bash" ] ; then
                    if [ ! -d "$abort_signal" ] ; then
                        return
                    fi
                    set_term_title "$CURRENT_TITLE :: $cmd [$pid]"
                    last_pid="$pid"
                    iterations=0
                fi
            fi
            backoff="$((50 * $iterations / 1000))"
            sleep "$backoff.200"
        done
        rmdir "$abort_signal" 2>/dev/null
    ) </dev/null >/dev/null 2>/dev/null &

    echo "$abort_signal"
}


function _reset_title() {
    # Prevent stale title update from background process..
    local abort_signal="$_ps0_abort_signal"
    unset _ps0_abort_signal
    if [ -d "$abort_signal" ] ; then
        rmdir "$abort_signal" 2>/dev/null
    fi
    # set this publicly so vim/etc can use it
    CURRENT_TITLE="$USERNAME@$HOSTNAME_SHORT:$PWD"
    set_term_title "$CURRENT_TITLE"
}


function grepll() {
    SEARCH=$1
    shift
    grep -oE ".{0,20}${SEARCH}.{0,20}" "$@" | grep ${SEARCH}
}


function psg() {
    if [ $# -lt 1 ] ; then
        echo "Usage psg SEARCH [SEARCH...]"
        return 1
    fi
    queries=()
    for x in "$@" ; do 
        queries+=("-e" "$x")
    done
    # NOTE: added ^USER in the grep includes the header..
    ps aux | \
        grep -v psg | \
        grep -v grep | \
        grep -e '^USER' "${queries[@]}"
}


function psgkill() {
    if [ $# -lt 1 ] ; then
        echo "Usage: psgkill [SIG] SEARCH [SEARCH...]"
        return 1
    fi
    SIG=
    if [ "$1" -eq "$1" ] 2>/dev/null && [ "$1" -lt 0 ] ; then
        echo found signal? $1
        SIG=$1
        shift
    fi
    queries=()
    for x in "$@" ; do 
        queries+=("-e" "$x")
    done
    ps --no-headers aux | \
        grep -v psgkill | \
        grep -v grep | \
        grep "${queries[@]}" | \
        awk '{print $2}' | \
        xargs kill $SIG
}


function set_term_title() {
    printf '\033]0;%s\007' "$*" > /dev/tty
}


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
    if (echo $URL | grep -qE '\w+://') ; then
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
    BRANCH=$(echo $STATUS | awk -F '## ' '{print $2}' | awk -F '\\.\\.\\.' '{print $1}')
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

if [ -n "$(tty)" ] && [ -n "$TERM" ] && [ "$TERM" != "dumb" ] ; then
    if (( BASH_VERSINFO[0] > 5 ||
      (BASH_VERSINFO[0] == 5 && BASH_VERSINFO[1] >= 3) )); then
	    PS0='${ history -a; _ps0_abort_signal=$(_inject_title_addendum); }'
    fi
	PS1=": $(tput smso)$LOGNAME$(tput rmso)@$(hostname -s) [\$(git-repo-status)] \${PWD#'$HOME'/} ;\n:; "
	PS2=": [.2] ; "
	PS3=": [.3] ; "
	PS4=": [.4] ; "
fi

if [[ "${PROMPT_COMMAND[*]}" != *"_reset_title"* ]] ; then
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}_reset_title"
fi

if [ -f /usr/local/etc/bash_completion ] ; then
    . /usr/local/etc/bash_completion
fi

[ -r ~/.bash_profile_local ] && . ~/.bash_profile_local
