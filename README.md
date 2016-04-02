# Kaylier's dotfiles

## Overview



## Installation



## Configurations
### Bin
TODO


### Templates
This folder contains different kind of files, named "(type).(type suffix)".
They are bases files for somes (ex: `c.c`, `python.py`...), and more cheat-sheet oriented for others (ex: `latex.tex`, `html5.xhtml`...).


### SLiM
TODO


### i3
TODO


### Urxvt
TODO


### Bash
#### Bash behaviour
For debug purposes, you would uncomment somes options in `.bashrc`. Each of them are shortly described.
I wanted to activate `nounset` and `noclobber` settings on everyday life, but it's a bit too intrusive because of scripts not strict enough in the system...
History is configured to ignore some commands (see variable `HISTIGNORE`). It also ignore every commands beginning with a space (see variable `HISTCONTROL`).

#### Prompt
![Screenshot of my prompt](TODO)

#### Functions
##### template
Edit a new file pre-filled with the content of the associate template in `templates` folder.
##### compile
Auto-compile C++, C and ADA source code, execute it and delete the executable.
##### extract
Auto-extract an archive. Needs `tar`, `bunzip2`, `unrar`, `gunzip`, `unzip`, `uncompress`, `7z` installed to work perfectly.
##### swap
Swap two files.
##### repeat n command
Repeat n times the command.
##### \_info
Print informations on the system, CPU stats, memory stats, disk usage, open connections.
Useful to have a brief overview.

#### Aliases
Modified commands, new ones, error corrector... See the file to know more.

#### Completion
The pattern `**` match all files.
When no files matches a `*`, raise an error.
Correction of minor errors.


### Vim
![Screenshot of vim](TODO)
* The indentation is smart, and set to 4 spaces
* `<F2>` activate the paste mode (useful to prevent shitty indent)
* The search is improved
* Autocompletion is smart, with the `<TAB>` key
* Folding is enable. You can manage the folding level globally with `set foldlevel=n` where n is between 0 (everything folded) and 99 (nothing folded), or else just open/close with `space`
* `<Enter>` activate the Insert mode
* `kj` escape the Insert mode
* You can go to the beginning or to the end of the line with bash shortcuts `<C-a>` and `<C-e>`.
* Therefor `<C-w>` replace the original shortcut for incrementation
* Command `:W` save with root privileged when you forgot to write sudo...
* `<C-s>` and `<C-c>` respectively save and quit the file
* You can toggle between relative and absolute numbers with `,` 


### Git
* `git l` prints a short log of recent commits
* `git s` prints a short format of status
* `git d` show the diff since the last commit
* `git cps` fast commit, push and show status


### Mopidy
TODO


### Pacman
TODO


