#! /bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Update dotfiles
if [ -d "${BASEDIR}/.git" ]
then 
	git --work-tree="${BASEDIR}" --git-dir="${BASEDIR}/.git" pull origin master
else
	echo "Missing git repository: ${BASEDIR}/.git"
fi


# Bash {{{

# /etc/profile
#   The systemwide initialization file, executed for login shells
#ln -sfv ${BASEDIR}/bash/profile /etc/profile

# ~/.bash_profile
#   The personal initialisation file, executed for login shells
ln -sfv ${BASEDIR}/bash/.bash_profile ~/.bash_profile

# ~/.bashrc
#   The individual per-interactive-shell startup file
ln -sfv ${BASEDIR}/bash/.bashrc ~/.bashrc

# ~/.bash_logout
#   The individual login shell cleanup file, executed when a login shell exits
ln -sfv ${BASEDIR}/bash/.bash_logout ~/.bash_logout

# }}}

# ~/.inputrc
#   Individual readline initialization file
#ln -sfv ${BASEDIR}/bash/.inputrc ~/.input

# ~/.xinitrc
# ~/.vimrc
# ~/.gitconfig
# ~/.conkyrc
# ~/.config/i3/config
# ~/.config/i3/conky-i3bar.sh
# ~/.config/i3/conky-i3bar
# /etc/mopidy/mopidy.conf
# /etc/pacman.conf

# vim:filetype=sh:syntax=sh
# vim:foldmethod=marker:foldlevel=0
