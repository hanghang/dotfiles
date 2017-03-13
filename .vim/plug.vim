" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/dotfiles/.vim/gitignored/plugged')

" Make sure you use single quotes

Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', {'for': ['go']}
Plug 'kien/ctrlp.vim'			" fast search 
Plug 'Shougo/vimshell'
Plug 'Shougo/neocomplete'
Plug 'tpope/vim-fugitive'		" git integration
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/dbext.vim'
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}
let g:quickrun_no_default_key_mappings = 1

"Plug 'minibufexpl.vim'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic', {'for':['clojure']}
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

Plug 'Yggdroot/indentLine'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=4
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

Plug 'mattn/emmet-vim', { 'for': ['html','jsp'] }
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

"Plug 'vimcn/vimcdoc'

" colorschemes
Plug 'altercation/vim-colors-solarized' 
Plug 'chriskempson/tomorrow-theme' 
Plug 'sjl/badwolf'   

"Plug 'Raimondi/delimitMate' "auto-completion for quotes, parens, brackets, etc. 
"Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
"

" Initialize plugin system
call plug#end()
