if !has('win32unix')
"---------------- plugin -----------------
source ~/dotfiles/vimfiles/plug.vim
"---------------- plugin -----------------

"---------------- keymap -----------------
source ~/dotfiles/vimfiles/keymap.vim
"---------------- keymap -----------------

"--------------- playground --------------
" could be any thing, for test purpose
"
"--------------- playground --------------

"-------------- plugin opts --------------


let wiki = {}
"let wiki.nested_syntaxes = {'python': 'python','java': 'java','c++': 'cpp'}
if has('win32')
	"let g:vimwiki_list = [{'path': 'U:/private/vimwiki/', 'path_html': 'D:/wiki_html/', 'auto_export': 1}]
	let wiki.path = 'U:/private/vimwiki/'
	let wiki.path_html= 'D:/wiki_html/'
	let wiki.auto_export= 1
elseif has('macunix') || has('gui_macvim')
	let wiki.path = '~/mnt_crypto/private/vimwiki'
	let wiki.path_html= '~/wiki_html/'
	let wiki.auto_export= 1
elseif has('unix')
	"let wiki.path = '~/my_wiki/'
endif
let g:vimwiki_list = [wiki]

let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}
let g:quickrun_config.vimwiki = {
\   'command': ':Vimwiki2HTML',
\   'exec': '%C',
\   'runner': 'vimscript',
\ }
let g:quickrun_config.markdown = {
\ 'command': 'md2min',
\ 'exec': '%c -output stdout %o %s %a',
\ 'outputter': 'browser'
\ }
let g:quickrun_config.cmd = {
\   'command': 'cmd',
\   'exec': "%c ",
\ }
let g:quickrun_config.dot = {
\ 'command': 'dot',
\ 'exec': '%C -Tpng -O',
\ 'outputter': 'browser'
\ }


let g:quickrun_no_default_key_mappings = 1
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=4
let g:indent_guides_guide_size=1

let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'jsp' : {
\    'extends' : 'html',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}

"-------------- plugin opts --------------


"--------------- autocmd -----------------
"autocmd BufNewFile * silent! 0r $VIM/vimfiles/templates/%:e.tpl
"autocmd BufWritePre *.go :Fmt
"autocmd FileType go autocmd BufWritePre <buffer> Fmt

source ~/dotfiles/vimfiles/gitignored/dbconf.vim
" example
" let g:dbext_default_profile = 'usual'
" let g:dbext_default_profile_usual       = 'type=MYSQL:user=root:passwd=:host=localhost:dbname=test'
" let g:dbext_default_profile_localhost   = 'type=ORA:user=scott:passwd=tiger'
" let g:dbext_default_profile_PG = 'type=PGSQL:user=postgres:user=postgres:passwd=postgres:host=localhost:dbname=test'

"--{{{--------- abbr----------------------
" iabbrev <buffer> fori for (i = 0 ; i < var ; i++)<cr>\{<cr> <cr>\}<up><C-T>
"--}}}--------- abbr----------------------


endif

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
"thx to
"https://dougblack.io/words/a-good-vimrc.html
"https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
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


"enc fenc
set encoding=utf-8 fileencodings=utf8,cp932,gbk,gb18030

set completeopt=menu,longest

if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=LightRed
endif

if has("win32") && has("gui_running")
    set clipboard=unnamed
    winpos 400 1
    se lines=45
    se columns=160
    set dir=d:/
    set go=rmb 
    set gfn=Source\ Code\ Pro:h12
elseif has('macunix') || has('gui_macvim')
	set dir=~/
	set guifont=Monaco:h14
endif

if version >= 603
  set helplang=cn
endif

syntax on
filetype indent on
" --- }}} ---
set conceallevel=0  " Don't conceal JSON syntax 

" PEP8
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" temp
augr class
au!
au bufreadpost,filereadpost *.class %!"d:/hhhome/devel/vimfiles/jad.exe" -noctor -ff -i -p %
au bufreadpost,filereadpost *.class set readonly
au bufreadpost,filereadpost *.class set ft=java
au bufreadpost,filereadpost *.class normal gg=G
au bufreadpost,filereadpost *.class set nomodified
augr END

" vim:fdm=marker:
