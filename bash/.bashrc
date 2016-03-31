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

# Foreground Colors {{{
#darkgrey=$(tput setaf 0)
#darkred=$(tput setaf 1)
#darkgreen=$(tput setaf 2)
#darkyellow=$(tput setaf 3)
#darkblue=$(tput setaf 4)
#darkpurple=$(tput setaf 5)
#darkcyan=$(tput setaf 6)
#lightgrey=$(tput setaf 7)
#grey=$(tput setaf 8)
#red=$(tput setaf 9)
#green=$(tput setaf 10)
#yellow=$(tput setaf 11)
#blue=$(tput setaf 12)
#purple=$(tput setaf 13)
#cyan=$(tput setaf 14)
#white=$(tput setaf 15)
#black=$(tput setaf 16)
# }}}
# Background Colors {{{
#bdarkgrey=$(tput setab 0)
#bdarkred=$(tput setab 1)
#bdarkgreen=$(tput setab 2)
#bdarkyellow=$(tput setab 3)
#bdarkblue=$(tput setab 4)
#bdarkpurple=$(tput setab 5)
#bdarkcyan=$(tput setab 6)
#blightgrey=$(tput setab 7)
#bgrey=$(tput setab 8)
#bred=$(tput setab 9)
#bgreen=$(tput setab 10)
#byellow=$(tput setab 11)
#bblue=$(tput setab 12)
#bpurple=$(tput setab 13)
#bcyan=$(tput setab 14)
#bwhite=$(tput setab 15)
# }}}
# Modifiers {{{
#dark=$(tput dim)
#bold=$(tput bold)
#underline=$(tput smul)
#end_underline=$(tput rmul)
#rev=$(tput rev)
#reset=$(tput sgr0)
# }}}

# }}}
# Prompt {{{

# Statusbar {{{
echo -ne "$(tput rmam)" # disable line wrapping
echo -ne "╭"
echo -ne "$(tput bold)"
echo -ne "$(tput setab 15)$(tput setaf 0) $HOSTNAME "
echo -ne "$(tput setab 7)[$HOSTTYPE]"
echo -ne "$(tput setab 8)$(tput setaf 15) $USER "
echo -ne "$(tput setab 0)$(tput setaf 6) $(date "+%d/%m/%Y %T") "
echo -ne "$(tput sgr0)$(tput setaf 8) Bash ${BASH_VERSION}"
echo -ne "$(tput sgr0)\n"
echo -ne "$(tput smam)" # enable line wrapping
# }}}
# Banner {{{
echo -ne "$(tput rmam)" # disable line wrapping
if [ -r ~/.bashrc_banner ]
then
    source ~/.bashrc_banner
fi
echo -ne "$(tput smam)" # enable line wrapping
# }}}
PROMPT_COMMAND='' # command to execute before prompting PS1
PROMPT_DIRTRIM=3 # number of trailing directory when expand \w
# Prompt 1 {{{
if [[ ${USER} == "root" ]]
then
    color0="\[$(tput setaf 1)\]"
    color1="\[$(tput setaf 9)\]"
    color2="\[$(tput setaf 3)\]"
    color3="\[$(tput setaf 8)\]"
    color4="\[$(tput setaf 11)\]"
    color5="\[$(tput setaf 15)\]"
    color6="\[$(tput setaf 5)\]"
else
    color0="\[$(tput setaf 2)\]"
    color1="\[$(tput setaf 6)\]"
    color2="\[$(tput setaf 4)\]"
    color3="\[$(tput setaf 8)\]"
    color4="\[$(tput setaf 12)\]"
    color5="\[$(tput setaf 15)\]"
    color6="\[$(tput setaf 5)\]"
fi
PS1="\[$(tput sgr0)\]"
PS1+='╰$(if [[ $? == 0 ]]; '
PS1+='then echo "\[$(tput setaf 10)\]\342\234\223"; '
PS1+='else echo "\[$(tput setaf 9)\]\342\234\227"; fi)'
PS1+="${color0}╓${color1}─"
PS1+="┤\t├"
PS1+="${color1}─"
PS1+="${color2}─"
PS1+="${color2}┤\u"
SSH_CONNECTION+= # Prevent nounset warning
if [ -n "${SSH_CONNECTION}" ]
then
    PS1+="\[$(tput setaf 7)\]@"
else
    PS1+="\[$(tput setaf 8)\]@"
fi
PS1+="${color4}\h"
PS1+="${color3}:"
PS1+="${color5}\w "
# Git prompt if it exists
if [ -r /usr/share/git/completion/git-prompt.sh ] 
then
    source /usr/share/git/completion/git-prompt.sh
    PS1+="${color6}"'$(__git_ps1 "{%s}")'
fi
PS1+="\n"
PS1+="${color0}\\$"'$(if [ $(jobs | wc -l) -gt "0" ]; '
PS1+='then echo "═╩═>"; '
PS1+='else echo "─╨─>"; fi)'
PS1+=" \[$(tput sgr0)\]"

# old PS1
#PS1='\[$(tput sgr0)\]\[$(tput setaf 6)\][\t]\[$(tput setaf 4)\]\u:\[$(tput setaf 15)\]\w \[$(tput setaf 5)\]$(__git_ps1 "{%s}")\n$(if [[ $? == 0 ]]; then echo "\[$(tput setaf 2)\]\342\234\223"; else echo "\[${red}\]\342\234\227"; fi)\[$(tput setaf 2)\] \$ →\[$(tput sgr0)\] '
# }}}
# Prompt 2,3,4 {{{
PS2="\[$(tput setaf 2)\]╰─>\[$(tput sgr0)\]"
PS3="\[$(tput setaf 2)\]╰>\[$(tput sgr0)\]"
PS4="\[$(tput setaf 2)\]╰\[$(tput sgr0)\]"
# }}}
# Exit message {{{
function _exit()
{
    echo -en '╷'
    for i in $(seq $(( $SHLVL - 2 )))
    do
        echo -en '╴'
    done;
    echo -e "$(tput setaf 8)[Shell level: $(( $SHLVL - 1 ))]$(tput sgr0)"
}
trap _exit EXIT
# }}}

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

DOTFILES_DIR+= # Prevent nounset warning

shopt -s sourcepath # Use the value of $PATH
[[ -d "${DOTFILES_DIR}/bin" ]] && export PATH=${PATH}:${DOTFILES_DIR}/bin

# Output format of time command
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'

#export HISTFILE=~/.bash_history
#export HISTFILESIZE=500
export HISTSIZE=500
export HISTIGNORE="&:bg:fg:ll:h:echo" # Commands to ignore
export HISTCONTROL=ignoreboth # ignoredups & ignorespace
export HISTTIMEFORMAT="$(echo -e $(tput setaf 7))[%d/%m %H:%M:%S]\
$(echo -e $(tput sgr0)) "

DISPLAY+= # Prevent nounset warning
if [ -n "$DISPLAY" ]
then
    export BROWSER=firefox
else
    export BROWSER=links
fi

#  }}}
# Functions {{{

# template {{{
# Create a file based on a template (detected with the suffixe)
if [[ -d "${DOTFILES_DIR}/templates" ]]
then
    local TEMPLATE_DIR=${PATH}:${DOTFILES_DIR}/templates
    function template()
    {
	    [[ $1 ]]    || { echo "Missing operand" >&2; return 1; }

	    if [[ -e $1 ]]
        then
            echo "The file already exists, it will be opened"
            echo -n "Press ENTER to resume"
            read
	        ${EDITOR} "$1";
	    else
            local TEMPLATE_FILE=$(ls ${TEMPLATE_DIR} | grep -E "*.${1/*.}$")
            if [[ -z ${TEMPLATE_FILE} ]]
            then
                echo "No template found in '${TEMPLATE_DIR}' with the extension '${1/*.}'"
                echo -n "Press ENTER to resume"
                read
            else
                if [ ${EDITOR} == "vim" ]
                then
                    # Pour vim, on laisse le soins à l'utilisateur 
                    # de créer le fichier en enregistrant via vim
                    ${EDITOR} -c ":0read ! cat \"${TEMPLATE_DIR}/${TEMPLATE_FILE}\"" "$1"
                else
                    cp "${TEMPLATE_DIR}/${TEMPLATE_FILE}" "$1"
                    ${EDITOR} "$1"
                fi
            fi
	    fi;
	    return 0;
    }
fi
# }}}
# compile {{{
# Compile a file and execute the result, before deleting it
function compile()
{
	[[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
	[[ -r $1 ]] || { printf "File %s is not readable" "$1" >&2; return 1; }

	local OUTPUT_PATH=${TMPDIR:-/tmp}/${1##*/};
	case $1 in
		*.cpp)	g++ "$1" -o "$OUTPUT_PATH" && "$OUTPUT_PATH" ;;
		*.c)	gcc "$1" -o "$OUTPUT_PATH" && "$OUTPUT_PATH" ;;
        *.adb)  gnatmake "$1" -o "$OUTPUT_PATH" && "$OUTPUT_PATH" ;;
		*)	    echo "$1 : unrecognized file extension" >&2
			continue;;
	esac
	[[ -e $OUTPUT_PATH ]] && { rm "$OUTPUT_PATH";}

}
# }}}
# xtitle  {{{
# Change the title of the terminal if possible
function xtitle()
{
    case "$TERM" in
        *term* | rxvt)
            echo -ne "\e]0;$*\a" ;;
        *)  ;;
    esac
}
# }}}
# extract {{{
# Detect type and extract
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via 'extract'" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
# }}}
# swap {{{
# Swap 2 filenames around, if they exist (from Uzi's bashrc).
function swap()
{
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}
# }}}
# repeat {{{
# 'repeat n command' repeat the command n times
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1 ; i <= max ; i++)); do
        eval "$@";
    done
}
# }}}
# ask {{{
function ask()
{
    local ans
    echo -n "$@" '[y/N] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}
# }}}
# maybe {{{
# after yes and no, maybe: print randomly 'y' or 'n'
function maybe()
{
    while true
    do
        if [ $(( $RANDOM % 2 )) -eq 0 ]
        then
            echo 'y'
        else
            echo 'n'
        fi
    done
}
# }}}

# _info {{{
# Get current host related info.
function _info()
{
    echo -e "\nYou are logged on $(tput setaf 9)$HOSTNAME"
    echo -e "\n$(tput setaf 9)Additionnal information:$(tput sgr0) " ; uname -a
    echo -e "\n$(tput setaf 9)Users logged on:$(tput sgr0) " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n$(tput setaf 9)Current date :$(tput sgr0) " ; date
    echo -e "\n$(tput setaf 9)Machine stats :$(tput sgr0) " ; uptime
    echo -e "\n$(tput setaf 9)Memory stats :$(tput sgr0) " ; free
    echo -e "\n$(tput setaf 9)Diskspace :$(tput sgr0) " ; df / $HOME
    echo -e "\n$(tput setaf 9)Open connections :$(tput sgr0) "; netstat -pan --inet;
    echo
}
# }}}

# }}}
# Autocompletition {{{

# Parameters {{{
shopt -s autocd # Execute directory names as if it's the argument of cd
shopt -s cdable_vars # If cd is called with a variable, the content is used
shopt -s cdspell # Correct minor errors
#shopt -s complete_fullquote # Quote all metacharacters when completing
#shopt -s direxpand # Expand wildcards on completion if possible
shopt -s dirspell #  Try to correct minor errors
shopt -u dotglob # Include hidden files in expansion
shopt -s expand_aliases # Expand aliases
shopt -s extglob # Extended pattern matching features
shopt -s extquote #  Enclose in double quote when $"string"
shopt -s failglob # Result in an error when no match
shopt -s force_fignore # Ignore $FIGNORE suffixes in completion
export FIGNORE='.o:.ali:~'
#shopt -s globasciiranges # Ranges with letters are set in the ASCII space
shopt -s globstar # Pattern '**' match all files
shopt -s hostcomplete # Complete after a @
shopt -s no_empty_cmd_completion # Doesn't try to complete empty line
shopt -s nocaseglob # Case insensitive expension
shopt -s nullglob # When no files matches, expand to a null string
shopt -s progcomp # Enable programmable completion facilities
shopt -s promptvars # prompt strings undergo everything else
# }}}
# Specific purposes {{{
complete -A hostname    rsh rcp telnet rlogin ftp ping disk
complete -A user        su

complete -A alias       alias unalias
complete -A variable    export local readonly unset
complete -A export      printenv
complete -A enabled     builtin
complete -A command     sudo man watch repeat
complete -A function    function

complete -A helptopic   help
complete -A shopt       shopt

complete -A stopped -P '%' bg
complete -A job -P '%'  fg jobs disown

complete -A directory   mkdir rmdir
complete -A directory   -o default cd

# Git completion
if [ -e /etc/bash_completion.d/git ]
then
    source /etc/bash_completion.d/git
fi
# }}}
# Compression {{{
complete -A file -o default -X '*.+(zip|ZIP)'       zip
complete -A file -o default -X '!*.+(zip|ZIP)'      unzip
complete -A file -o default -X '*.+(z|Z)'           compress
complete -A file -o default -X '!*.+(z|Z)'          uncompress
complete -A file -o default -X '*.+(gz|GZ)'         gzip
complete -A file -o default -X '!*.+(gz|GZ)'        gunzip
complete -A file -o default -X '*.+(bz2|BZ2)'       bzip2
complete -A file -o default -X '!*.+(bz2|BZ2)'      bunzip2
complete -A file -o default -X '!*.+(tgz|tar.gz|tbz2|tar.bz2)'   tar
complete -A file -o default -X \
    '!*.+(tar.bz2|tar.gz|bz2|rar|gz|tar|tbz2|tgz|zip|Z|7z)' extract
# }}}
# Documents {{{
complete -A file -o default -X '!*.+(ps|PS)'   gs ps2pdf ps2ascii
complete -A file -o default -X '!*.+(pdf|PDF)' evince pdf2ps
complete -A file -o default -X '!*.texi*'      makeinfo texi2dvi texi2pdf
complete -A file -o default -X '!*.tex'        tex latex
# }}}
# Multimedia {{{
complete -A file -o default -X \
    '!*.@(mp[234]|MP[234]|ogg|OGG|wav|WAV|pls|\
    m3u|xm|mod|s[3t]m|it|mtm|ult|flac|\
    mp?(e)g|MP?(E)G|wma|avi|AVI|\
    asf|vob|VOB|bin|dat|vcd|ps|pes|fli|viv|rm|ram|yuv|mov|MOV|qt|\
    QT|wmv|ogm|OGM|asx|ASX)' vlc
# }}}
# Scripts {{{
complete -A file -o default -X '!*.@(py|PY)' python
complete -A file -o default -X '!*.@(sh|SH)' bash
# }}}
# Make autocomplete {{{
_make()
{
    local mdef makef makef_dir="." makef_inc gcmd cur prev i;
    COMPREPLY=();
    cur=${COMP_WORDS[COMP_CWORD]};
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in
        -*f)
            COMPREPLY=($(compgen -f $cur ));
            return 0
            ;;
    esac;
    case "$cur" in
        -*)
            COMPREPLY=($(_get_longopts $1 $cur ));
            return 0
            ;;
    esac;

    # ... make reads
    #          GNUmakefile,
    #     then makefile
    #     then Makefile ...
    if [ -f ${makef_dir}/GNUmakefile ]; then
        makef=${makef_dir}/GNUmakefile
    elif [ -f ${makef_dir}/makefile ]; then
        makef=${makef_dir}/makefile
    elif [ -f ${makef_dir}/Makefile ]; then
        makef=${makef_dir}/Makefile
    else
        makef=${makef_dir}/*.mk         # Local convention.
    fi

    #  Before we scan for targets, see if a Makefile name was
    #+ specified with -f.
    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
        if [[ ${COMP_WORDS[i]} == -f ]]; then
            # eval for tilde expansion
            eval makef=${COMP_WORDS[i+1]}
            break
        fi
    done
    [ ! -f $makef ] && return 0

    # Deal with included Makefiles.
    makef_inc=$( grep -E '^-?include' $makef | sed -e "s,^.* ,"$makef_dir"/," )
    for file in $makef_inc; do
        [ -f $file ] && makef="$makef $file"
    done

    #  If we have a partial word to complete, restrict completions
    #+ to matches of that word.
    if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi

    COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' $makef 2>/dev/null | eval $gcmd  ))

}
complete -F _make -X '+($*|*.[cho])' make gmake pmake
# }}}

# }}}
# Modified commands {{{

alias df='df -Th'
alias du='du -ch'
alias grep='grep -TE --color=auto'
alias jobs='jobs -l'
alias less='less -iNMz-10'
alias ls='ls -bhF --color=auto'
alias mkdir='mkdir -pv'
alias peerflix='peerflix --vlc'
alias ping='ping -Abc 8 -D'
alias pushd='pushd . > /dev/null'
alias popd='popd > /dev/null'
#alias sudo='sudo -E'
alias vpnc='sudo vpnc --no-detach'

# }}}
# Reattributed commands {{{

alias clear='echo -ne "\033c"'
alias info='_info'
alias vi='vim'
alias view='vim -R'

function evince() { command evince "$@" & }
function firefox() { command firefox "$@" & }

# }}}
# New commands {{{

BACKASABLE_DIR=~/.backasable
[ -d "$BACKASABLE_DIR" ] && alias backasable='cd ${BACKASABLE_DIR}'
alias git-log='git log --graph --oneline'
alias h='history'
alias j='jobs -l'
alias ll='ls -l'
alias lr='ll -R'
alias la='ll -A'
alias lg='ll | grep'
alias lsd='command ls -hd */'
alias meminfo='free -hlt'
alias mounted='mount | column -t'
alias no='yes n'
alias path='echo -e ${PATH//:/\\n}'
alias timestamp='date "+%s"'

function lcd() { cd $@ && ls ; }
function fe() { find . -type f -iname '*'"${1:-}"'*' -exec ${2:-file} {} \; ; }
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ; }

# }}}
# Safety aliases {{{

alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp -i'
alias emacs='vim'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -Iv --one-file-system --preserve-root'
alias ssh='ssh -A'

# }}}
# Error corrector {{{

alias :q='exit'
alias pull='git pull'
alias push='git push'
alias commit='git commit'
alias fetch='git fetch'
alias status='git status'

# }}} 

# vim:filetype=sh:syntax=sh
# vim:foldmethod=marker:foldlevel=0
