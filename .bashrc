#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s histappend
shopt -s globstar
shopt -s checkwinsize
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [[ -f /etc/bash_completion ]]; then
    /etc/bash_completion # for some reasons it is in /usr/share/...
fi

if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi

if [[ -x /use/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ls='ls --color=auto'
alias l='ls -F'
alias :q='exit'
alias vimf='vim $(fzf)'

# Pacman aliases
alias pac="sudo pacman" # Base alias for sudo pacman
alias pacs="pac -S" # Install package
alias pacss="pac -Ss" # Search for package
alias pacu="pac -Syu" # Update package database and upgrade packages
alias pacr="pac -Rns" # Remove package and its dependencies
alias pacq="pac -Qi" # Query installed package information
alias pacl="pac -Ql" # List files in a package
# Pacman cache management aliases
alias paccc="pac -Sc" # Remove all cached versions of uninstalled packages
alias pacccc="pac -Scc" # Remove all files from the cache (use carefully!)
alias pacclean="paccache -r" # Remove all cached versions of installed and uninstalled packages, except for the most recent 3 versions
alias paccleanold="paccache -rk1" # Keep only one version of each package in the cache
alias pacdirsize="du -sh /var/cache/pacman/pkg/" # Show the size of the pacman cache directory
alias pacorphans="pac -Qtdq" # List all packages that were installed as dependencies but are no longer required by any installed package
alias pacrmorphans="pac -Rns $(pacman -Qtdq)" # Remove all orphaned packages

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

CDPATH=:~:~/Documents/:~/Programming/
#eval "$(stack --bash-completion-script stack)" # for haskell stack
# HDD stack path
HDD_LOCAL_STACK_PATH=/run/media/pierbezuhoff/10B8AA4EB8AA3260/Projects/.stack/
if [ -d "$HDD_LOCAL_STACK_PATH" ]; then
    export STACK_ROOT="$HDD_LOCAL_STACK_PATH"
fi

export VISUAL="emacs"

PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
#eval $(opam env) # for ocaml (coq)
# eval "$(zoxide init bash)"

# local proxy to bypass dpi @127.0.0.1 port 1080 via SOCKS 5
# byedpi --disorder 1 --auto=torst --tlsrec 1+s &
