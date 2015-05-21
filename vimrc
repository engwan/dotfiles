"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/engwan/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/engwan/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'Valloric/YouCompleteMe'

NeoBundle 'tpope/vim-rails'
NeoBundle 'dsawardekar/ember.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'adoy/vim-php-refactoring-toolbox'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|node_modules\|bower_components\|public\/images\|public\/system\|log$\|tmp$'}

let g:mustache_abbreviations = 1

let g:NERDTreeWinSize = 40

set lazyredraw

" Allow switching buffers without saving
set hidden

set nocompatible
set ruler

set autoindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1

" Numbers
set number
set relativenumber
set numberwidth=4

" PHP Settings
autocmd BufRead,BufNewFile *.php set sw=3 sts=3 ts=3

set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start

set hlsearch
set ignorecase
set smartcase

filetype plugin indent on
filetype detect

syntax on

set t_Co=256
colorscheme jellybeans

autocmd BufNewFile,BufRead *.axlsx  set syntax=ruby

" Hightlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufEnter * match ExtraWhitespace /\s\+$/

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

" Key Mappings
let mapleader = ","

noremap <C-o> :CtrlPMRU<cr>
noremap <C-n> :NERDTreeToggle<cr>

nnoremap <leader>a :Ack 
nnoremap <leader><space> :noh<cr>
nnoremap <leader><leader> :call TrimWhiteSpace()<cr>
nnoremap <leader>u :e ++ff=dos<cr>:setlocal ff=unix<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gr :Gread<cr>

nnoremap <leader>ga :Git add %:p<cr><cr>
nnoremap <leader>gaa :Git add -A<cr><cr>
nnoremap <leader>gc :Gcommit -v -q<cr>
nnoremap <leader>gt :Gcommit -v -q %:p<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gw :Gwrite<cr><cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :!git push<cr>
nnoremap <leader>gpl :!git pull --rebase<cr>

set showbreak=↪

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set undofile
set undodir=~/.vim/_undo/
set backupdir=~/.vim/_backup/
set directory=~/.vim/_swp/
