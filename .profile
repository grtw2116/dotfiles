# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# bash 実行中の場合
if [ -n "$BASH_VERSION" ]; then
    # .bashrc が存在する場合は .bashrc を含める
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# "$HOME/bin" が存在するならば PATH に追加する
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# "$HOME/.local/bin" が存在するならば PATH に追加する
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ##################
#
# PATH
#
# ##################

# texlive
if [ -d "/usr/local/texlive/2023/bin/x86_64-linux" ] ; then
    PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
fi

# ##################
#
# MANPATH
#
# ##################

if [ -d "/usr/local/texlive/2023/texmf-dist/doc/man" ] ; then
    MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
fi

# ##################
#
# INFOPATH
#
# ##################

if [ -d "/usr/local/texlive/2023/texmf-dist/doc/info" ] ; then
    INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
fi
