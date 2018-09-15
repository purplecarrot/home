##############################################################################
# .bashrc
##############################################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# OS Specific Settings
OSKERNELNAME="$(uname -s)"

if [[ $OSKERNELNAME == "Darwin" ]]
then
    BASH_COMPLETION_D="/usr/local/etc/bash_completion.d"
fi

if [[ $OSKERNELNAME == "Linux" ]]
then
    CA_BUNDLE="/etc/pki/tls/certs/ca-bundle.crt"
    BASH_COMPLETION_D="/usr/share/doc/git/contrib/completion"
fi

# Bash completions
. $BASH_COMPLETION_D/git-completion.bash
. $BASH_COMPLETION_D/git-prompt.sh

# Show Git state in PS1
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true

# Add local bin directory to PATH
if [[ -d $HOME/bin ]]
then
    PATH=$HOME/bin:$PATH
fi

# Source local .bashrc
if [[ -f $HOME/.bashrc_local ]]
then
    . $HOME/.bashrc_local
fi

# Aliases
alias vir='rmate'
alias grep='grep --color=auto'
alias githome="/usr/bin/git --git-dir=$HOME/.githome/ --work-tree=$HOME"

# Environment Variables
export EDITOR="vim"
export GIT_EDITOR="vim"
export TMOUT=0
export SYSTEMD_PAGER=
export LESS='-C -M -I -j10 -#4 -R'

# Export any modified variables
export PATH
export PS1='\h:\w$(__git_ps1)\$ ' 

