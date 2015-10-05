# .bash_profile

. "${HOME}/.bashrc"

######### Platform INdependent settings ############

PATH="${PATH}:/usr/local/bin:/sbin:/usr/sbin"

BASH_ENV="${HOME}"/.bashrc
ENV="${BASH_ENV}"
ENV_FILE="${BASH_ENV}"
USERNAME="${LOGNAME}"
HISTSIZE=10000000
HISTFILESIZE=100000000
TMP=$HOME/tmp

stty intr ^C
stty erase ^?

########### Platform DEpendent settings ###########

export DISPLAY HISTSIZE HISTFILESIZE USERNAME BASH_ENV \
       PATH MANPATH HOME LD_RUN_PATH LD_LIBRARY_PATH ENV_FILE USERNAME USER \
       PS1 PS2 PS3 PS4 TMP

#PATH=$PATH:/usr/local/Cellar/python3/3.4.2_1/Frameworks/Python.framework/Versions/3.4/bin
