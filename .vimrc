set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'yegappan/mru'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'vim-scripts/c.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'andrewstuart/vim-kubernetes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
let g:syntastic_cpp_check_header = 1
" Configure the project file
syntax on
set background=dark
"Airline theme, also always show status bar
:set laststatus=2
let g:airline_powerline_fonts=1
:set guifont=Meslo\ LG\ S\ for\ Powerline\ 10
"Weird quirky tab completion w/ menu
"set wildmode=longest,list,full
"set wildmenu
"For just bash style tab completion
set wildmode=longest,list
if has("gui_running")
	" GUI is running or is about to start.
	" Maximize gvim window, set colorscheme to solarized
	let g:airline_theme='solarized'
	set lines=110 columns=250
	colorscheme solarized
endif
" Go to last file(s) if invoked without arguments.
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * SyntasticReset
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
			\ call mkdir($HOME . "/.vim") |
			\ endif |
			\ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
			\ execute "source " . $HOME . "/.vim/Session.vim" 
autocmd vimenter * NERDTree
