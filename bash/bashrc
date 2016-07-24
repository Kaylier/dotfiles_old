################################################################
#
# PERSONAL $HOME/.bashrc FILE for bash-4.0 (or later)
# By Kaylier [kaylier@openmailbox.org]
# 
# Many parts are inspired or based on code found on Internet,
#  for instance:
# https://www.gnu.org/software/bash/manual/bash.html
# http://tldp.org/LDP/abs/html/sample-bashrc.html
#
#
#
################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors {{{

# Enable 256 color if possible
if [ -e /usr/share/terminfo/x/xterm-256color ]
then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# }}}
# Terminal behaviour {{{

#set -o posix # Force to match the standard POSIX
#  Shortcuts {{{
stty -ixon # Disable Ctrl-S and Ctrl-Q for stop and resume (obsolete...)
#set -o ignoreeof # Prevent exiting on <Ctrl>D
# }}}
# Jobs {{{
shopt -s checkjobs # Check jobs before exiting (exit again to force)
shopt -s huponexit # Send a SIGHUP to all jobs when exiting
# }}}
# Security {{{
#set -o noclobber # Prevent overwritting with '>'
#set -o nounset # error on uninitialized variables
set -o physical # Do not resolve symbolic links (with cd for example)
#ulimit -S -c 0 # Prevent coredumps
# }}}
# Expansions {{{
#set -o braceexpand # Perform brace expansion
set -o histexpand # Enable '!' style history substitution
#set -o noglob # Disable pathname expansion
# }}}
# Editor style {{{
set -o emacs # Use the emacs-style editing interface
#set -o vi # Use the vi-style editing interface
# }}}
# Debuggage {{{
#set -o verbose # write input to standard error
#set -o xtrace # write every executed commands to standard error
#set -o allexport # export all variables

#set -o errexit # Ignore next commands when one fail
#set -o onecmd # Exit after reading and executing one command
#set -o noexec # The shell read commands but doesn't execute them
#set -o pipefail # Return the last non-zero status
# }}}

# }}}
# History behaviour {{{

#set -o history # Authorize commands in history
#set -o nolog # Prevent function def to be into the history

shopt -s cmdhist # Consider multilines commands as one in the history
shopt -s lithist # Multilines are embedded, not semicoloned

shopt -u histappend # Append the history file instead of overwritting it
shopt -s histreedit # Enable the user to re-edit a history substitution
shopt -s histverify # Allow further modification

# }}}
# Scripts behaviour {{{

shopt -s interactive_comments # Allow comments in terminal (with '#')
shopt -u nocasematch # Case insensitive match in 'case' statement
shopt -s shift_verbose # Print an error message when the argument shift is over
shopt -s xpg_echo # echo expand backslash by default

# }}}
# Variables {{{

export DOTFILES_DIR=~/.dotfiles

shopt -s sourcepath # Use the value of $PATH
[[ -d "${DOTFILES_DIR-}/bin" ]] && export PATH=${PATH}:${DOTFILES_DIR-}/bin

# Output format of time command
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'

#export HISTFILE=~/.bash_history
#export HISTFILESIZE=500
export HISTSIZE=500
export HISTIGNORE="&:bg:fg:ll:h:echo" # Commands to ignore
export HISTCONTROL=ignoreboth # ignoredups & ignorespace
export HISTTIMEFORMAT="$(echo -e $(tput setaf 7))[%d/%m %H:%M:%S]\
$(echo -e $(tput sgr0)) "

if [ -n "${DISPLAY-}" ]
then
    export BROWSER=firefox
else
    export BROWSER=links
fi

#  }}}

[ -r ~/.bashrc_prompts ]    && source ~/.bashrc_prompts
[ -r ~/.bashrc_functions ]  && source ~/.bashrc_functions
[ -r ~/.bashrc_aliases ]    && source ~/.bashrc_aliases
[ -r ~/.bashrc_completion ] && source ~/.bashrc_completion

# vim:filetype=sh:syntax=sh
# vim:foldmethod=marker:foldlevel=0
