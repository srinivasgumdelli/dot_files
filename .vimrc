set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'nvie/vim-flake8'
Bundle 'davidhalter/jedi-vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate'
Bundle 'bling/vim-airline'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdcommenter'
Bundle 'aquach/vim-http-client'
Bundle 'othree/xml.vim'
Bundle 'vim-scripts/paredit.vim'
Bundle 'weavejester/cljfmt'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/textutil.vim'
Bundle 'google/vim-maktaba'
Bundle 'google/vim-codefmt'
Bundle 'google/vim-glaive'
Bundle 'google/vim-colorscheme-primary'
Bundle 'Chiel92/vim-autoformat'
Bundle 'fatih/vim-go'
Bundle 'thanthese/Tortoise-Typing'

call glaive#Install()
Glaive codefmt plugin[mappings]

filetype plugin indent on     " required!
filetype on

syntax on
syntax enable
let g:solarized_termtrans = 1
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme primary

set autoread      " auto refresh files
set foldmethod=indent
set foldlevel=99
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start 		" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set smarttab      " insert tabs on the
set hlsearch      "
set incsearch     "
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set showcmd
set cursorline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set smartindent
set expandtab

let mapleader = ";"
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:airline#extensions#tabline#enabled = 1
autocmd filetype python set expandtab
autocmd FileType python setlocal textwidth=78

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
autocmd filetype crontab setlocal nobackup nowritebackup

map <leader>xml :call DoPrettyXML()<CR>
nnoremap <F6> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
map <leader>gn :bn<cr>
map <leader>gp :bp<cr>
map <leader>gd :bd<cr>  
map <C-o> :NERDTreeToggle<CR>
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <leader>bj :%!python -m json.tool<CR>
vmap <leader>y :w! /tmp/vitmp<CR>                                                                   
nmap <leader>p :r! cat /tmp/vitmp<CR>
nnoremap <silent> <F5> :!clear;python %<CR>
noremap <F3> :Autoformat<CR>
vnoremap // y/<C-R>"<CR>"
