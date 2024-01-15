##############################################################################
# Mark's .bashrc
##############################################################################

# OS Specific Settings
OSKERNELNAME="$(uname -s)"

if [[ $OSKERNELNAME == "Darwin" ]]
then
    BASH_COMPLETION_D="/opt/homebrew/etc/bash_completion.d"
    export CLICOLOR=1
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
if [[ -d $BASH_COMPLETION_D ]]
then
    . $BASH_COMPLETION_D/git-completion.bash
    . $BASH_COMPLETION_D/git-prompt.sh
fi

# Show Git state in PS1
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWCOLORHINTS=true

# Add additonal bin directories to PATH
BIN_DIRS="$HOME/bin $HOME/.local/bin $HOME/go/bin /opt/homebrew/bin /usr/local/bin"
for BIN_DIR in $BIN_DIRS 
do
    if [[ ! $PATH =~ $BIN_DIR ]]
    then
        if [[ -d $BIN_DIR ]]
        then
            PATH=$PATH:$BIN_DIR
        fi
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
export PATH

# Export any modified variables
export PATH
export PROMPT_COMMAND='__git_ps1 "\h:\w" "\$ "'

# Source local .bashrc
if [[ -f $HOME/.bashrc_local ]]
then
    . $HOME/.bashrc_local
fi

