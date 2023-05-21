# .bash_profile

. "${HOME}/.bashrc"

PATH="$PATH:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/bin"

SHELL_SESSION_HISTORY=0  # macOS per/term session history
BASH_SILENCE_DEPRECATION_WARNING=1
BASH_ENV="${HOME}"/.bashrc
ENV="${BASH_ENV}"
ENV_FILE="${BASH_ENV}"
USERNAME="${LOGNAME}"
HISTSIZE=10000000
HISTFILESIZE=100000000
HISTCONTROL=ignoredups:erasedups:ignorespace
LANG=en_US.UTF-8
shopt -s histappend  # append to history file instead of replace
# Write history file on each command
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a"

TMP=$HOME/tmp

stty intr ^C
stty erase ^?

export DISPLAY HISTSIZE HISTFILESIZE HISTCONTROL USERNAME BASH_ENV \
       PATH MANPATH HOME LD_RUN_PATH LD_LIBRARY_PATH ENV_FILE USERNAME USER \
       PS1 PS2 PS3 PS4 TMP LANG

[ -r ~/.bash_profile_local ] && . ~/.bash_profile_local
