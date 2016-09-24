# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ls variations.
alias ls='ls --color=auto -F'
alias la='ls -la'
alias ll='ls -l'

# Set colors in grep.
alias grep='grep --color=auto'

# cd typos.
alias cd..='cd ..'

# Run tmux with 256 colors by default.
alias tmux='tmux -2'

alias cless='less --RAW-CONTROL-CHARS --chop-long-lines'
