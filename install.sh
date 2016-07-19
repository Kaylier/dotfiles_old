#! /bin/sh

export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Modify the condition if you have change the zsh/zshenv
if [[ "${DOTFILES_DIR}" != "${HOME}/.dotfiles" ]]
then
    echo "The file zsh/zshenv is not configured by default for ${DOTFILES_DIR}."
    echo "It may cause problem with calls to custom binaries and templates."
    echo

    local ans
    echo -n "Do you want to resume ? [y/N] "
    read ans
    case "$ans" in
        y*|Y*) ;;
        *) exit 1;;
    esac
fi

echo ${DOTFILES_DIR-}

# Update dotfiles
if [ -d "${DOTFILES_DIR}/.git" ]
then 
	echo git --work-tree="${DOTFILES_DIR}" --git-dir="${DOTFILES_DIR}/.git" pull origin master
else
	echo "Missing git repository: ${DOTFILES_DIR}/.git"
    exit 1
fi

echo ln -sbv ${DOTFILES_DIR}/git/gitconfig       ${HOME}/.gitconfig
echo ln -sbv ${DOTFILES_DIR}/i3/config           ${HOME}/.config/i3/config
echo ln -sbv ${DOTFILES_DIR}/i3/conky-i3bar      ${HOME}/.config/i3/conky-i3bar
echo ln -sbv ${DOTFILES_DIR}/i3/conky-i3bar.sh   ${HOME}/.config/i3/conky-i3bar.sh
echo ln -sbv ${DOTFILES_DIR}/i3/workspace1.json  ${HOME}/.config/i3/workspace1
echo ln -sbv ${DOTFILES_DIR}/i3/workspace3.json  ${HOME}/.config/i3/workspace3
echo ln -sbv ${DOTFILES_DIR}/i3/workspace4.json  ${HOME}/.config/i3/workspace4
echo ln -sbv ${DOTFILES_DIR}/urxvt/Xresources    ${HOME}/.Xresources
echo ln -sbv ${DOTFILES_DIR}/vim/vimrc           /etc/vimrc
echo ln -sbv ${DOTFILES_DIR}/zsh/zlogin          /etc/zsh/zlogin
echo ln -sbv ${DOTFILES_DIR}/zsh/zlogout         /etc/zsh/zlogout
echo ln -sbv ${DOTFILES_DIR}/zsh/zprofile        /etc/zsh/zprofile
echo ln -sbv ${DOTFILES_DIR}/zsh/zshenv          /etc/zsh/zshenv
echo ln -sbv ${DOTFILES_DIR}/zsh/zshrc           /etc/zsh/zshrc
echo ln -sbv ${DOTFILES_DIR}/zsh/zshrc_aliases   /etc/zsh/zshrc_aliases
echo ln -sbv ${DOTFILES_DIR}/zsh/zshrc_functions /etc/zsh/zshrc_functions
echo ln -sbv ${DOTFILES_DIR}/zsh/zshrc_prompts   /etc/zsh/zshrc_prompts


exit 0



# vim:filetype=sh:syntax=sh
# vim:foldmethod=marker:foldlevel=0
