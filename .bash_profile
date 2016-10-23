# .bash_profile

. "${HOME}/.bashrc"

PATH="$PATH:/usr/local/bin:/sbin:/usr/sbin:$HOME/bin"

BASH_ENV="${HOME}"/.bashrc
ENV="${BASH_ENV}"
ENV_FILE="${BASH_ENV}"
USERNAME="${LOGNAME}"
HISTSIZE=10000000
HISTFILESIZE=100000000
HISTCONTROL=ignoredups:erasedups  
shopt -s histappend  # append to history file instead of replace
# Write history file on each command
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

TMP=$HOME/tmp

stty intr ^C
stty erase ^?

export DISPLAY HISTSIZE HISTFILESIZE HISTCONTROL USERNAME BASH_ENV \
       PATH MANPATH HOME LD_RUN_PATH LD_LIBRARY_PATH ENV_FILE USERNAME USER \
       PS1 PS2 PS3 PS4 TMP
