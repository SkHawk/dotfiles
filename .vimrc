set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" https://github.com/tmux-plugins/vim-tmux
Plugin 'tmux-plugins/vim-tmux'

"" https://jeffkreeftmeijer.com/vim-number/
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

"" https://github.com/morhetz/gruvbox
Plugin 'morhetz/gruvbox'

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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

syntax on
set number
set relativenumber
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set t_Co=256 "colorscheme on terminal
set background=dark
