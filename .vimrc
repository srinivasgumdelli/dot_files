set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
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

filetype plugin indent on     " required!
filetype on

syntax on
syntax enable
let g:solarized_termtrans = 1
set background=dark
set t_Co=256
let g:solarized_termcolors=256

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

let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:airline#extensions#tabline#enabled = 1

autocmd filetype python set expandtab
autocmd FileType python setlocal textwidth=78

nnoremap <F6> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
map <C-o> :NERDTreeToggle<CR>
