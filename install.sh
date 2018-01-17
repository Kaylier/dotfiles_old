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

# Update dotfiles
if [ -d "${DOTFILES_DIR}/.git" ]
then 
    echo "Pull repository..."
	git --work-tree="${DOTFILES_DIR}" --git-dir="${DOTFILES_DIR}/.git" pull origin master
    if [[ $? -neq 0 ]]
    then
        echo "Unable to update dotfiles."
        local ans
        echo -n "Do you want to resume ? [y/N] "
        read ans
        case "$ans" in
        y*|Y*) ;;
        *) exit 1;;
        esac
    fi
else
	echo "Missing git repository: ${DOTFILES_DIR}/.git"
    echo "Unable to update dotfiles."
    local ans
    echo -n "Do you want to resume ? [y/N] "
    read ans
    case "$ans" in
        y*|Y*) ;;
        *) exit 1;;
    esac
fi

echo
echo "Link configuration files..."
ln -sfv ${DOTFILES_DIR}/git/gitconfig       ${HOME}/.gitconfig
ln -sfv ${DOTFILES_DIR}/i3/config           ${HOME}/.config/i3/config
ln -sfv ${DOTFILES_DIR}/i3/i3bar            ${HOME}/.config/i3/i3bar
ln -sfv ${DOTFILES_DIR}/i3/workspace1.json  ${HOME}/.config/i3/workspace1.json
ln -sfv ${DOTFILES_DIR}/i3/workspace2.json  ${HOME}/.config/i3/workspace2.json
ln -sfv ${DOTFILES_DIR}/i3/workspace3.json  ${HOME}/.config/i3/workspace3.json
ln -sfv ${DOTFILES_DIR}/i3/workspace4.json  ${HOME}/.config/i3/workspace4.json
ln -sfv ${DOTFILES_DIR}/urxvt/Xresources    ${HOME}/.Xresources

echo "Link system-wide configuration files..."

sudo ln -sfv ${DOTFILES_DIR}/vim/vimrc           /etc/vimrc
sudo ln -sfv ${DOTFILES_DIR}/zsh/zlogin          /etc/zsh/zlogin
sudo ln -sfv ${DOTFILES_DIR}/zsh/zlogout         /etc/zsh/zlogout
sudo ln -sfv ${DOTFILES_DIR}/zsh/zprofile        /etc/zsh/zprofile
sudo ln -sfv ${DOTFILES_DIR}/zsh/zshenv          /etc/zsh/zshenv
sudo ln -sfv ${DOTFILES_DIR}/zsh/zshrc           /etc/zsh/zshrc
sudo ln -sfv ${DOTFILES_DIR}/zsh/zshrc_aliases   /etc/zsh/zshrc_aliases
sudo ln -sfv ${DOTFILES_DIR}/zsh/zshrc_functions /etc/zsh/zshrc_functions
sudo ln -sfv ${DOTFILES_DIR}/zsh/zshrc_prompts   /etc/zsh/zshrc_prompts
sudo ln -sfv ${DOTFILES_DIR}/systemd/suspend     /etc/systemd/system/suspend@.service


exit 0



# vim:filetype=sh:syntax=sh
# vim:foldmethod=marker:foldlevel=0
