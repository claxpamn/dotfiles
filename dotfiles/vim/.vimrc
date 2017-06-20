
" General
set nocompatible                                         " Off by default but better safe than sorry
set hidden                                               " Hide buffer instead of closing
set history=500                                          " Set history to 500
set lazyredraw                                           " Redraw only when we need to.
set ttyfast                                              " Optimize for fast terminal connections
set mouse=a                                              " Enable mouse in all modes
set noerrorbells                                         " Disable error bells
set nostartofline                                        " Don’t reset cursor to start of line when moving around
set title                                                " Show the filename in the window titlebar
set shortmess=atI                                        " Don’t show the intro message when starting Vim
set showmode                                             " Show the current mode
set encoding=utf8                                        " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                                     " Use Unix as the standard file type
set backspace=indent,eol,start                           " Allow backspace

" Plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

" UI
syntax enable                                            " Enable syntax processing
colorscheme dracula                                      " Set colorscheme to Dracula
set relativenumber                                       " Display relative line numbers
set number                                               " Display the absolute line number at the line you're on
set numberwidth=2                                        " Keep the line number gutter narrow so three digits is cozy
set cursorline                                           " Highlight current line
set ruler                                                " Show the cursor position
set colorcolumn=80                                       " Draw line at column 80 to prevent going too far
set showmatch                                            " Highlight matching [{()}]
set list                                                 " Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_                     " Invisibles

" Tabs and more
set tabstop=2                                            " number of visual spaces per TAB
set shiftwidth=2
set autoindent                                           " Indent at the same level of the previous line
set smartindent                                          " Turn on smart indents
set noexpandtab                                          " Use tabs instead of spaces
set wrap                                                 " Wrap lines

set showcmd                                              " Show the (partial) command as it’s being typed
set wildmenu                                             " Visual autocomplete for command menu. USAGE :e ~/.vim<TAB>

" Search
set incsearch                                            " Search as characters are entered
set hlsearch                                             " Highlight matches
set ignorecase                                           " Ignore case of searches
set smartcase                                            " Unless uppercase is used

" Folding
set foldenable                                           " Enable folding
set foldlevelstart=10                                    " Open most folds by default
set foldnestmax=10                                       " 10 nested fold max
set foldmethod=indent                                    " Fold based on indent level

" Backups, swaps and undos
call system('mkdir ~/.vim')                              " Creating .vim directories if they dont exist
call system('mkdir ~/.vim/backups')
call system('mkdir ~/.vim/swaps')
call system('mkdir ~/.vim/undo')
set backupdir=~/.vim/backups                             " Setting backup, swap and undo directories
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Mappings
let mapleader=","                                        " Set leader to ,
noremap <leader>W :w !sudo tee % > /dev/null<CR>         " Save a file as root (,W)
nnoremap <leader><space> :nohlsearch<CR>                 " Turn off search highlight
map j gj                                                 " Treat long lines as break lines (useful when moving around in them)
map k gk

" Automatic commands
if has("autocmd")
	filetype on                                                             " Enable file type detection
	filetype indent on                                                      " Enable file type indentation
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript    " Treat .json files as .js
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown              " Treat .md files as Markdown
endif

" Status line
set laststatus=2                                         " Always show the status line
set statusline=
set statusline+=%<\                                      " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\                       " flags and buffer number
set statusline+=%F\                                      " full file path
set statusline+=%=%1*%y%*%*\                             " file type
set statusline+=%10((%l,%c)%)\                           " line and column
set statusline+=(%p%%)                                   " percentage of file

" XA2WjJbmmoM
" Snippets
nnoremap ,html :1read $HOME/.vim/skeleton/html<CR>3jwf>a

