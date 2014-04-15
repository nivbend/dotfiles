if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Disable XOFF.
stty -ixon

# Start ssh-agent.
SSH_ENV="$HOME/.ssh/environment"
SSH_FILES="github bitbucket"

function start_agent {
    # Start agent and store environment file.
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"

    source "${SSH_ENV}" > /dev/null

    # Add all keys.
    /usr/bin/ssh-add
    for key_file in $SSH_FILES; do
        /usr/bin/ssh-add $HOME/.ssh/$key_file
    done;
}

# Source SSH settings, if applicable.
if [ -f "${SSH_ENV}" ]; then
    source "${SSH_ENV}" > /dev/null

    # ps ${SSH_AGENT_PID} doesn't work under cywgin.
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
