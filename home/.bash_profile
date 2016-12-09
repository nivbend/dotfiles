export LC_ALL=C
export EDITOR=vim
export WORKON_HOME="$HOME/.venvs"
export PROJECT_HOME="$HOME/projects"
export PROMPT_COMMAND="history -a"

if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

if [ -f "$HOME/.bashrc" ]; then
    source $HOME/.bashrc
fi
