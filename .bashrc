# .bashrc

if [ -f /etc/bashrc ] && [ -r /etc/bashrc ] ; then
    . /etc/bashrc
fi

export TMP=$HOME/tmp
export LANG=en_US.UTF-8
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig
export GOPATH=~/project/.go
export PATH="$PATH:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/bin:$GOPATH/bin"

[ -r ~/.bashrc_local ] && . ~/.bashrc_local
