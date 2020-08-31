" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/dotfiles/.vim/gitignored/plugged')

" Make sure you use single quotes
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'nsf/gocode', {'for': ['go']}
Plug 'kien/ctrlp.vim'			" fast search 
Plug 'Shougo/vimshell'
Plug 'Shougo/neocomplete'
Plug 'tpope/vim-fugitive'		" git integration
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/dbext.vim'
Plug 'tyru/open-browser.vim'
Plug 'thinca/vim-quickrun'


Plug 'Chiel92/vim-autoformat'

"Plug 'minibufexpl.vim'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic', {'for':['clojure']}
Plug 'w0rp/ale', {'for':['py']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

Plug 'keith/swift.vim' , {'for': 'swift'}


Plug 'Yggdroot/indentLine'
" indentLine will overwrite  "concealcursor" and "conceallevel" with default value:
let g:indentLine_enabled = 0

nmap <silent> <leader>i :IndentLinesToggle<CR>

Plug 'mattn/emmet-vim', { 'for': ['html','jsp'] }
"Plug 'vimcn/vimcdoc'

" use vim-quickrun instead
"Plug 'iamcco/markdown-preview.vim'    " markdown support requires py


" colorschemes
Plug 'altercation/vim-colors-solarized' 
Plug 'chriskempson/tomorrow-theme' 
Plug 'sjl/badwolf'   

"Plug 'Raimondi/delimitMate' "auto-completion for quotes, parens, brackets, etc. 
"Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
"
Plug 'tpope/vim-commentary'

Plug 'liuchengxu/graphviz.vim', { 'for': ['dot','hh'] }

Plug '907th/vim-auto-save'
let g:auto_save = 1


let g:auto_save_presave_hook = 'call AbortForFiletype()'
function! AbortForFiletype()
  if &filetype == 'vimwiki' || &filetype == "hhtest"
    let g:auto_save_abort = 1
  endif
endfunction

" Initialize plugin system
call plug#end()
