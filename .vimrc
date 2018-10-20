" Set up Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Install plugin in Vim
" :PluginInstall

" Basics "

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'w0rp/ale'
Plugin 'junegunn/seoul256.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set number
set relativenumber
syntax on
filetype plugin indent on
filetype on
filetype indent on
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

set laststatus=2
" NERDTree plugin
map , <leader>
map - :NERDTreeToggle<cr> " open/close nerdtree window
map <leader>r :NERDTreeFind<cr> " this is the key to jump to the nerdtree window from any other window

map ] :NERDTreeFind<CR> " pressing this inside any open file in vim will jump to the nerdtree and highlight where that file is -> very useful when you have multiple files open at once

" Syntastic and Rubocop
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0 
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['rubocop']


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <c-a> :ALEToggle<cr>
let g:ale_enabled = 0

" color theme
let g:seoul256_background = 235
colo seoul256
