runtime! archlinux.vim " Ensure compatibilities with the Vim-related packages

" General {{{

set nocompatible " Disable Vi compatibility restrictions
set showmode " Display the mode
"set insertmode " Make Insert mode the default
if has('mouse')
    set mouse=a " Mouse activated in All Modes
endif
set history=100 " Number of lines of history
filetype plugin on
set report& " Threshold for reporting number of lines changed

set browsedir& " Directory to use for file browser
set autochdir " Change working directory when a file is opened
set autoread " When the file is changed outside but not in vim, read again
"set autowrite " Write the file on many commands
"set autowriteall " Write the file on much more commands

set nobackup " Make a backup before overwriting a file
set writebackup " Make a backup before overwriting a file, removed after
set backupcopy=auto " Create a copy before overwriting
set backupdir=/tmp " Backup directory
set backupext=.bak " Extension of backup file
set backupskip& " Types of files to not backup

set swapfile& " Use a swapfile for the buffer
set directory& " List of directory names for the swap file
set suffixes& " Suffixes of low-priority files
set updatecount& " Number of character before the swap file is written to disk

set undofile& " Save history in an undo file
set undodir& " Directory of undo files
set undolevels& " Maximum of changes that can be undone

set encoding=utf-8 " The encoding displayed
set casemap& " Details about changing the case of letters
set ambiwidth=single " Width of special characters
set digraph& " Enable the entering of digraphs
set fileencoding=utf-8 " The encoding written to file
set nobomb " Prepend a BOM (Byte Order Mark) to the file
set fileformat=unix " The format of the file

set cryptmethod=blowfish2 " Encryption method
set secure " Secure the external command aspect

"set revins " Insert backward
"set rightleft " Display from right to left

" }}}
" Comportement {{{

set nopaste " Desactive le mode collage
set pastetoggle=<F2> " Touche de modification de mode collage

set scrolljump& " Number of lines to scroll when the cursor gets off the screen
set scrolloff=7 " Always keep n lines after or before when side scrolling
"set sidescrolloff=7 " Always keep n lines after or before when side scrolling
set display=uhex " Change the way the text is displayed

set backspace=indent,eol,start " The normal behaviour of backspace
set esckeys " Authorize keys beginning with <Esc> in Insertion mode
"set virtualedit=onemore " Allow the cursor just past the end of the line
set selectmode=cmd,mouse " Active le mode Selection avec la souris
set selection=inclusive " Selection behavior

set allowrevins " Allow CTRL-_ in Insert and Command-line mode

" }}}
" Indentation {{{

filetype indent on
"set cindent
"set autoindent
set smartindent
"set indentexpr= " Personalized indentation
set expandtab " Replace tabs with spaces
set smarttab " Smart choice in replacement (useful if tabstop != softtabstop)
set softtabstop=4 " Insert n spaces
set tabstop=4 " Draw reals tabs with n spaces
set shiftwidth=4 " Indent with n spaces
set shiftround " When using > and <, round to the nearest tabstop

set copyindent " Re-indent when copying
set preserveindent " Keep the indentation

" }}}
" Recherche {{{

set incsearch " Search before pressing Enter
set hlsearch " Highligh search results
set gdefault " The substitute flag 'g' is on

set ignorecase " Search case-insensitive
set smartcase " Search smart (case-sensitive if Maj in the word)
set magic " regular expressions

" }}}
" Auto-completion {{{

set wildmenu " Better command-line completion
set wildchar=<Tab> " Character to type to start wildcard expansion
set wildignorecase " Ignore case when completing file names

"set omnifunc=syntaxcomplete#Complete
set wildmode=list:longest,list:full
set wildmode=longest,list
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz
set menuitems& " Maximum number of items in a menu
set pumheight=0 " Maximum number of items to show in the popup menu

set showfulltag " Show full template for C completion
set dictionary& " List of file names used for completion

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
setlocal spelllang=en,fr
"setlocal spell
set spellfile& " List of word list files
set infercase " Automatic case in completion

" }}}
" Repliement {{{

set foldenable
set foldlevelstart=50 " 0 : tout est foldé, 99 : rien n'est foldé
set foldmethod=indent
set foldignore& " Lines starting with theses characters are ignored
set foldminlines=1 " Minimum of line to be considered as foldable
set foldclose= " When set to all, auto close when the cursor moves out
set foldcolumn& " When 1, show a column on the side showing folds
set foldopen& " Commands for which folds will be opened
nnoremap <space> za
set foldtext& " Expression displayed for closed folds

"set concealcursor=nvc " Conceal the text in normal, visual and command modes
"set conceallevel=1

" }}}
" Optimisations {{{

set shortmess+=I " No intro when starting Vim
set ttyfast " Faster redraw
set lazyredraw " Redraw only when we need to

set hidden " Hide the buffer instead of closing
set bufhidden& " What happens when a buffer is no longer display
set updatetime=4000 " Idle time before writting the swap to disk

" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=200
au InsertEnter * set timeout
au InsertLeave * set notimeout

" }}}
" Raccourcis/commandes personnalisées {{{

set remap " Allow recursive mappings

" Shortcut to Insert mode
nnoremap <Enter> i<Enter>
" Escape with kj
inoremap kj     <Esc>

" Increment (<C-a> is used for an other purpose)
nnoremap <C-w>  <C-a>
" Go to the beginning of the line
nnoremap <C-a>  ^
" Go at the end of the line
nnoremap <C-e>  $
" Go to the beginning of the line in Insert mode
inoremap <C-a>  <Esc>^i
" Go at the end of the line in Insert mode
inoremap <C-e>  <Esc>$a

" Enregistre avec les droits root
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Save with Ctrl+S and Quit with Ctrl+C
nmap <C-s>      :w<Enter>
imap <C-s>      <Esc>:w<Enter>a
nmap <C-c>      :q<Enter>
imap <C-c>      <Esc>:q<Enter>

map <F5>        :set background=light<Enter>
nmap <F6>       :set background=dark<Enter>

function! ToggleNumber()
    if (&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
nmap , :.call ToggleNumber()<cr>


" }}}
" Apparence {{{

syntax enable " Enable syntax highlights
set t_Co=256 " Enable 256 colors

highlight LineNR term=bold ctermfg=6 guifg=cyan

" Init of perso colors
highlight User0 cterm=bold ctermbg=16 ctermfg=15
highlight User1 cterm=bold ctermbg=11 ctermfg=16
highlight User2 cterm=bold ctermbg=15 ctermfg=16
highlight User3 cterm=bold ctermbg=7 ctermfg=16
highlight User4 cterm=bold ctermbg=12 ctermfg=15
highlight User5 cterm=bold ctermbg=4 ctermfg=15
highlight User6 cterm=bold ctermbg=16 ctermfg=15
highlight User7 cterm=bold ctermbg=none ctermfg=15
highlight User8 cterm=bold ctermbg=3 ctermfg=16
highlight User9 cterm=bold ctermbg=3 ctermfg=9

set laststatus=2
set statusline=
set statusline+=%9*%h                               " Help flag
set statusline+=%1*%m                               " Modified flag
set statusline+=%1*%r                               " Readonly flag
set statusline+=%8*%{strlen(&key)?'[X]':''}         " Encrypted flag
set statusline+=%2*\ %t\                            " File name (tail)
set statusline+=%3*%y                               " File type
set statusline+=%4*\ %{strlen(&fenc)?&fenc:&enc}\   " Encoding 
set statusline+=%4*%{&bomb?'\ ,BOM\ ':''}           " Encoding BOM (if defined)
set statusline+=%5*\ %{&ff}\                        " File format (dos/unix)
set statusline+=%6*\ %{&spelllang}\                 " Spell language
set statusline+=%7*%=
set statusline+=%1*%{&paste?'[P]':''}               " Paste mode flag
set statusline+=%5*\ L%l/%L\ (%03p%%)\              " Row number/total (%)
set statusline+=%4*\ c%02c\                         " Column number
set statusline+=%3*\ %P\                            " Top/Bottom 

set number " Show the line number
"set relativenumber " Show the line number relative to the cursor
"set ruler " Show the position of the cursor
"set rulerformat& " Determine the content of ruler string
"set cursorline " Highlight the cursor line
"set cursorcolumn " Highlight the cursor column

" Surligne en rouge les lignes trop longues
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

set showmatch " When a bracket is inserted, jump to the matching one
set matchpairs=(:),{:},[:],<:> " List of pairs to match
"set maxfuncdepth& " Max depth of function calls
set matchtime=3 " ... during this time (tenths of a second)

set wrap " Wrap the line when it's longer than the width of the window
set wrapscan " Search wrap around the end of the file
set showbreak=↳ " See this char when wrapping text
set whichwrap=b,s,<,>,[,]

"colorscheme koehler
set background=light

" }}}
" Fichiers spécifiques {{{

set modeline " Autorise les arguments dans les fichiers (ex:cf fin de celui-ci)
set modelines=10 " Number of lines that is checked from the end of the file
"set exrc " Enable the reading of a local ./.vimrc

autocmd FileType latex inoremap j gj
autocmd FileType latex inoremap k gk
autocmd BufEnter Makefile setlocal noexpandtab

" }}}

" vim:filetype=vim:syntax=vim
" vim:foldmethod=marker:foldlevel=0
