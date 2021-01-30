##############################################################################
# .bashrc
##############################################################################

# OS Specific Settings
OSKERNELNAME="$(uname -s)"

if [[ $OSKERNELNAME == "Darwin" ]]
then
    BASH_COMPLETION_D="/usr/local/etc/bash_completion.d"
fi

if [[ $OSKERNELNAME == "Linux" ]]
then
    CA_BUNDLE="/etc/pki/tls/certs/ca-bundle.crt"
    GIT_DOC_DIR="/usr/share/doc/git"
    if [[ ! -d $GIT_DOC_DIR && ! -L $GIT_DOC_DIR ]]
    then
        GIT_DOC_DIR="$(ls -1rtd ${GIT_DOC_DIR}* | head -1)"
    fi
    BASH_COMPLETION_D="$GIT_DOC_DIR/contrib/completion"
fi

# Bash completions
. $BASH_COMPLETION_D/git-completion.bash
. $BASH_COMPLETION_D/git-prompt.sh

# Show Git state in PS1
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWCOLORHINTS=true

# Add additonal bin directories to PATH
for BINDIR in "$HOME/bin $HOME/.local/bin /usr/local/bin"
do
    if [[ -d $BINDIR ]]
    then
        PATH=$HOME/bin:$BINDIR
    fi
done


# Aliases
alias vir='rmate'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Environment Variables
export EDITOR="vim"
export GIT_EDITOR="vim"
export TMOUT=0
export SYSTEMD_PAGER=
export LESS='-C -M -I -j10 -#4 -R'

# Export any modified variables
export PATH
export PROMPT_COMMAND='__git_ps1 "\h:\w" "\$ "'

# Source local .bashrc
if [[ -f $HOME/.bashrc_local ]]
then
    . $HOME/.bashrc_local
fi
