set ts=4 sw=4
syntax on
set number
set hls
set ic
set is
set nofixendofline
set nospell
set spelllang=en_us 
set softtabstop=4
set expandtab
set rnu
set pastetoggle=<F10>

call plug#begin('~/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'ThePrimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'wellle/context.vim'
Plug 'tpope/vim-surround'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
call plug#end()

autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

set relativenumber

colorscheme gruvbox
set background=dark

set autoindent
set smartindent

set wrap
set smarttab
set mouse+=a
hi Normal ctermbg=none guibg=none

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim

set scrolloff=999

nnoremap <SPACE> <Nop>
let mapleader=" "

" remap for paste after
nnoremap <Leader>p "0p

" remap for paste before
nnoremap <Leader>b "0P

" paste in visual mode without deleting what is in the default paste register (at least i think this is what it does)
xnoremap <Leader>p "_dP

" searches for files in your project by name and displays a preview (uses regex like syntax too)
nnoremap <silent> <C-p> :GFiles<CR>

" searches your entire project for a phrase using regex like syntax
nnoremap <silent> <Leader>f :Rg<CR>

" searches your current buffer(s) for a phrase (uses regex like syntax too)
nnoremap <silent> <Leader>l :Lines<CR>

" displays your command history within vim and lets you choose one and edit it
" for immediate use
nnoremap <silent> <Leader>i :History:<CR>

" searches your current buffer(s) for a phrase (uses regex like syntax too)
nnoremap <silent> <Leader>z :NERDTree<CR>

" turns highlighting off
nnoremap <silent> <Leader>n :noh<CR>

" need to do this for some pesky reason (used to jump forward by a page in
" case you forgot)
nnoremap <C-f> <C-f> 

let g:rooter_manual_only = 1

" toggle vim-rooter
nnoremap <silent> <Leader>r :Rooter<CR>


" pbcopy paste to clipboard (FOR MACOS)
" xnoremap <silent> <Leader>m :w !pbcopy<CR><CR>
" FOR LINUX:
xnoremap <silent> <Leader>m :w !xsel -i -b<CR><CR>



