# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=true;;
esac

if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=true
else
    color_prompt=false
fi

# Supported since bash 4. Trim more than X directory levels in prompt.
export PROMPT_DIRTRIM=3

if $color_prompt; then
    declare -a ps1_parts=(
        '${debian_chroot:+($debian_chroot)}'
        '\[\033[1;32m\]\u'
        '@'
        '\[\033[1;34m\]\h'
        ':'
        '\[\033[36m\]\w'
        '$ '
    )

    PS1="$(printf '%s\[\033[0m\]' "${ps1_parts[@]}")"
    unset ps1_parts
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Disable XOFF.
stty -ixon

# Append history in multi-session scenarios.
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

for alias_script in ~/.aliases/*.sh; do
    source $alias_script
done

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

tmux_completion="$HOME/.config/tmux_completion.sh"
if [[ -f "$tmux_completion" ]]; then
    source "$tmux_completion"
fi

if [[ -f "$HOME/.bashrc.local" ]]; then
    source "$HOME/.bashrc.local"
fi

# Bootstrap homeshick.
if [ -d "$HOME/.homesick" ]; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

    # Update configurations.
    homeshick --quiet refresh
fi

if [[ -f "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    source "/usr/local/bin/virtualenvwrapper.sh"
fi

# todo.txt
if [ -x "$HOME/.local/bin/todo.sh" ]; then
    alias t="$HOME/.bin/todo.sh"
    complete -F _todo t
fi

if [[ $(command -v direnv > /dev/null 2>&1) -eq 0 ]]; then
    eval "$(direnv hook bash)"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
    source "$HOME/.cargo/env"
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
