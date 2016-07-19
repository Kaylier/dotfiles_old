# Dotfiles

## Overview
![Screenshot of desktop](TODO)
These configuration files are not intended to work for everybody, however everybody is free to get some inspiration in thoses.


## Bash
This is old config files, not maintained anymore.
History is configured to ignore some commands (see variable `HISTIGNORE`). It also ignore every commands beginning with a space (see variable `HISTCONTROL`).
The pattern `**` match all files.
When no files matches a `*`, raise an error.
Correction of minor errors.


## Git
* `git l` prints a short log of recent commits
* `git s` prints a short format of status
* `git d` show the diff since the last commit
* `git di <n>` show the diff since n last revisions
* `git cps` fast commit, push and show status


## i3 Window Manager
Every shortcuts except for exiting use the Meta key as modifier. Here are most importants : 
* `Meta+Shift+r` restart i3
* `Ctrl+Alt+Backspace` exit i3
* `Meta+Return` execute dmenu to launch a program
* `Meta+t` launch a terminal
* `Ctrl+Space` pause music (via mpc)
* `Ctrl+Right` next music (via mpc)
* `Ctrl+Left` precedent music (via mpc)
* `²` show scratchpad
* `Shift+²` create scratchpad
* `Meta+q` kill the window
* `Meta+(hjkl)` change focus (also works with arrows)
* `Meta+Shift+(hjkl)` move window (also works with arrows)
* `Meta+f` toggle fullscreen
* `Meta+g` prepare an horizontal split
* `Meta+v` prepare a vertical split
* `Meta+e` toggle split
* `Meta+s` stack windows
* `Meta+d` tab windows
* `Meta+Space` show floating windows
* `Meta+Shift+Space` toggle floating window
* `Meta+(<wxcbn,;:!)` move to a certain workspace
* `Meta+Shift+(<wxcbn,;:!)` move the window to a certain workspace
* `Meta+Backspace` enter in system mode
* `Meta+*` enter in launch mode (beta)
* `Meta+r` enter in resize mode
The music is managed via MPC, and informations in status bar are ask to a mpd client (mopidy works, too).
The locker comes from [i3-extras by ashinkarov](https://github.com/ashinkarov/i3-extras) and is very nice ;)


## Templates
This folder contains different kind of files, named after the corresponding suffix : 
* `c` C source
* `h` C header
* `cpp` C++ source
* `hpp` C++ header
* `Makefile` An incredible out-of-the-box Makefile for C/C++
* `py` Python file
* `tex` example of LaTeX file, with the compiled result : `tex.pdf`
* `xhtml` example of a XHTML 5 file


## Urxvt
Color style, behaviour with scroll, urls...


## Vim
![Screenshot of vim](TODO)
* The indentation is smart, and set to 4 spaces
* `<F2>` activate the paste mode (useful to prevent shitty indent)
* The search is improved
* Autocompletion is smart, with the `<TAB>` key
* Folding is enable. You can manage the folding level globally with `set foldlevel=n` where n is between 0 (everything folded) and 99 (nothing folded), or else just open/close with `space`
* `<Enter>` activate the Insert mode
* `kj` escape the Insert mode
* You can go to the beginning or to the end of the line with shortcuts `<C-a>` and `<C-e>`.
* Therefor `<C-w>` replace the original shortcut for incrementation
* Command `:W` save with root privileged when you forgot to write sudo...
* `<C-s>` and `<C-c>` respectively save and quit the file
* You can toggle between relative and absolute numbers with `,` 
* Columns over 80 are highlight to respect linux coding style


## Zsh
![Screenshot of my prompt](TODO)

### Aliases
Modified commands, new ones, error corrector... See the file to know more.

### Functions
#### template
Edit a new file pre-filled with the content of the associate template in `templates` folder.
#### compile
Auto-compile C++, C and ADA source code, execute it and delete the executable.
#### extract
Auto-extract an archive. Needs `tar`, `bunzip2`, `unrar`, `gunzip`, `unzip`, `uncompress`, `7z` installed to work perfectly.
#### swap
Swap two files.
#### repeat n command
Repeat n times the command.
#### \_info
Print informations on the system, CPU stats, memory stats, disk usage, open connections.
Useful to have a brief overview.


