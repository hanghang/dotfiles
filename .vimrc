"---------------- plugin -----------------
source ~/dotfiles/.vim/plug.vim
"---------------- plugin -----------------

"---------------- keymap -----------------
source ~/dotfiles/.vim/keymap.vim
"---------------- keymap -----------------

"--{{{--------- ui,tabs,enc --------------
" --- every one likes ---
set nocompatible              " be vim
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set laststatus=2
set ruler
set wildmenu
set display+=lastline  " no more @@@s
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set sessionoptions-=options
set scrolloff=1
set sidescrolloff=5
set autoread
set history=500
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" --- every one likes ---

colo evening
"colo Tomorrow-Night
set magic
set number		" Line number
set foldenable		" auto fold code
set hlsearch		" highlite search
set ambiwidth=double 
set iminsert=0
set imsearch=0
set fileformats=unix,dos
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

set tabstop=4 
set softtabstop=4 
"set expandtab  
set shiftwidth=4
set cindent
"set smartindent
"set textwidth=70 " nice for plain text 
"set cursorline

set encoding=utf-8
set fencs=utf8,gbk,gb2312,gb18030,cp936

set completeopt=menu,longest

if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=LightRed
endif


if has("gui_running")
    set clipboard=unnamed
    winpos 400 1
    se lines=45
    se columns=130
    set dir=d:/
    set go=rmb 
    set gfn=Source\ Code\ Pro:h12
endif

if version >= 603
  set helplang=cn
endif

syntax on
filetype indent on
" --- }}} ---


"--{{{--------- abbr----------------------
" iabbrev <buffer> fori for (i = 0 ; i < var ; i++)<cr>\{<cr> <cr>\}<up><C-T>
"--}}}--------- abbr----------------------


"--------------- autocmd -----------------
"autocmd BufNewFile * silent! 0r $VIM/vimfiles/templates/%:e.tpl
"autocmd BufWritePre *.go :Fmt
"autocmd FileType go autocmd BufWritePre <buffer> Fmt


source ~/dotfiles/.vim/gitignored/dbconf.vim

" example
" let g:dbext_default_profile = 'usual'
" let g:dbext_default_profile_usual       = 'type=MYSQL:user=root:passwd=:host=localhost:dbname=test'
" let g:dbext_default_profile_localhost   = 'type=ORA:user=scott:passwd=tiger'
" let g:dbext_default_profile_PG = 'type=PGSQL:user=postgres:user=postgres:passwd=postgres:host=localhost:dbname=test'



"thx to
"https://dougblack.io/words/a-good-vimrc.html
"https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" vim:fdm=marker:


