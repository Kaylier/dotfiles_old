#! /bin/bash

export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Update dotfiles
if [ -d "${DOTFILES_DIR}/.git" ]
then 
	git --work-tree="${DOTFILES_DIR}" --git-dir="${DOTFILES_DIR}/.git" pull origin master
else
	echo "Missing git repository: ${DOTFILES_DIR}/.git"
    exit 1
fi


# Bash {{{

# /etc/profile
#   The systemwide initialization file, executed for login shells
#ln -sfv ${DOTFILES_DIR}/bash/profile /etc/profile

# ~/.bash_profile
#   The personal initialisation file, executed for login shells
ln -sfv ${DOTFILES_DIR}/bash/.bash_profile ~/.bash_profile

# /etc/bash.bashrc
#   The systemwide startup file
#ln -sfv ${DOTFILES_DIR}/bash/.bashrc /etc/bash.bashrc
#ln -sfv ${DOTFILES_DIR}/bash/.bashrc_prompts /etc/.bashrc_prompts
#ln -sfv ${DOTFILES_DIR}/bash/.bashrc_functions /etc/.bashrc_functions
#ln -sfv ${DOTFILES_DIR}/bash/.bashrc_aliases /etc/.bashrc_aliases
#ln -sfv ${DOTFILES_DIR}/bash/.bashrc_completion /etc/.bashrc_completion

# ~/.bashrc
#   The individual per-interactive-shell startup file
ln -sfv ${DOTFILES_DIR}/bash/.bashrc ~/.bashrc
ln -sfv ${DOTFILES_DIR}/bash/.bashrc_prompts ~/.bashrc_prompts
ln -sfv ${DOTFILES_DIR}/bash/.bashrc_functions ~/.bashrc_functions
ln -sfv ${DOTFILES_DIR}/bash/.bashrc_aliases ~/.bashrc_aliases
ln -sfv ${DOTFILES_DIR}/bash/.bashrc_completion ~/.bashrc_completion

# ~/.bash_logout
#   The individual login shell cleanup file, executed when a login shell exits
ln -sfv ${DOTFILES_DIR}/bash/.bash_logout ~/.bash_logout

# }}}

# ~/.inputrc
#   Individual readline initialization file
#ln -sfv ${DOTFILES_DIR}/bash/.inputrc ~/.input

# ~/.xinitrc
# ~/.vimrc
#   Vim configuration file
ln -sfv ${DOTFILES_DIR}/vim/.vimrc ~/.vimrc

# ~/.gitconfig
# ~/.conkyrc
# ~/.config/i3/config
# ~/.config/i3/conky-i3bar.sh
# ~/.config/i3/conky-i3bar
# /etc/mopidy/mopidy.conf
# /etc/pacman.conf

# vim:filetype=sh:syntax=sh
# vim:foldmethod=marker:foldlevel=0
