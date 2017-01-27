syntax enable
set background=dark
colorscheme solarized
"Weird quirky tab completion w/ menu
"set wildmode=longest,list,full
"set wildmenu
"For just bash style tab completion
set wildmode=longest,list
set runtimepath^=~/.vim/bundle/ctrlp.vim,~/.vim/bundle/vim-fugitive
" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim" 
