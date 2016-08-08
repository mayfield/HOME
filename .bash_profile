# .bash_profile

. "${HOME}/.bashrc"

PATH="$PATH:/usr/local/bin:/sbin:/usr/sbin:$HOME/bin"

BASH_ENV="${HOME}"/.bashrc
ENV="${BASH_ENV}"
ENV_FILE="${BASH_ENV}"
USERNAME="${LOGNAME}"
HISTSIZE=10000000
HISTFILESIZE=100000000
TMP=$HOME/tmp

stty intr ^C
stty erase ^?

export DISPLAY HISTSIZE HISTFILESIZE USERNAME BASH_ENV \
       PATH MANPATH HOME LD_RUN_PATH LD_LIBRARY_PATH ENV_FILE USERNAME USER \
       PS1 PS2 PS3 PS4 TMP

#if [ -z "$DOCKER_HOST" ] ; then
#    eval "$(docker-machine env local)"
#fi
#echo "Using docker machine: $(docker info | grep Name: | awk '{print $2}')"

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/usr/local/google-cloud-sdk/completion.bash.inc'
