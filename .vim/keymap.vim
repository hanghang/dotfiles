" keymap
 " Don't use Ex mode, use Q for formatting
map Q gq
"<F1> - spell check
map <C-F1> :setlocal spell spelllang=en_us<cr>
map <S-F1> :setlocal spell nospell<cr>
imap <C-F1> :setlocal spell spelllang=en_us<cr>
imap <S-F1> :setlocal spell nospell<cr>
inoremap <C-Space> <C-x><C-o>

"<F2>
nmap <F2> :QuickRun<CR>

"<F3>
"--{{{-------<F3>insert mode -  add FileHeader ----------
function FileHeading()
    let s:line=line(".")
    call setline(s:line ,"// *************************************************")
    call append(s:line,  "// Description - ")
    call append(s:line+1,"// @author -      Hang Hang")
    call append(s:line+2,"// @date -        ".strftime("%Y-%m-%d"))
    call append(s:line+3,"// *************************************************")
    unlet s:line
endfunction
imap <C-F3>  mz:execute FileHeading()`zjA
"--}}}---------------------------------------------------
function InputToday()
    let s:currline = line(".")
    call append(s:currline-1 , strftime("%Y-%m-%d"))
endfunction
:imap <leader>d mz:execute InputToday() `zkA
"function DiffWithFileFromDisk()
"    let filename=expand('%')
"    let diffname = filename.'.difftempfile'
"    exec 'saveas! '.diffname
"    diffthis
"    vsplit
"    exec 'edit '.filename
"    diffthis
"endfunction
":nmap <C-F3> :call DiffWithFileFromDisk()<cr>


"<F4> - toggle function list
map <F4> :TagbarToggle<cr>


"<F5> - open myNotes (GVIM on MS Windows)


if has("gui_running")
	map <F5> :tabnew<cr>:e U:/private/notes/personal_note.txt <cr>
	map <C-F5> :tabnew<cr>:e U:/private/notes/1_work_journal.txt <cr>
endif


"<F6> - goto previous file in buffer
:map <F6> :bprev!<CR> 
:map <C-F6> :cprev<cr>

"<F7> - goto next file in buffer
:map <F7> :bnext!<cr>
:map <C-F7> :cnext<cr>

"<F8> - build SQL using StringBuffer
map <F8> :%s/^\(.*\)$/sql.append("\1 ");/g<cr>

"<F9> remove all tail spaces
:nmap <F9> :%s= *$==<cr>        
:imap <F9> <ESC><F9>             

:nmap <C-F9> :%s=	*$==<cr>
:imap <C-F9> <ESC><C-F9>             

"<F10> 
fu! SaveSess()
    execute 'mksession! ~/dotfiles/.vim/gitignored/session.vim'
endfunction

fu! RestoreSess()
execute 'so ~/dotfiles/.vim/gitignored/session.vim'
if bufexists(1)
    for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
            exec 'sbuffer ' . l
        endif
    endfor
endif
endfunction

"autocmd VimLeave * call SaveSess()
"autocmd VimEnter * call RestoreSess()
set ssop=buffers
",curdir,folds,help,tabpages,winsize
map <F10> :call RestoreSess() <CR>
map <C-F10> :call SaveSess() <CR>


"<F11> - convert current document to html format
map <F11> :runtime! syntax/2html.vim<cr>

"<F12> - quick edit vimrc
map <F12> :tabnew <cr>:e ~/dotfiles/.vimrc <cr>

map <C-F11> :set encoding=utf8<cr>
map <M-F11> :set encoding=default<cr>
map <C-F12> :set gfn=Source\ Code\ Pro:h14<cr>
" map <C-F12> :set gfn=NSimsun:h12<cr>

map <M-F12> :set gfn= <cr>

"<ALT>+<T>(<Meta>+<T>)  - open new tab
map <M-t> :tabnew<CR> 

"<Meta>+<LEFT> - to previous tab
map <M-left> :tabp<CR>

"<Meta>+<RIGHT> - to next tab
map<M-right> :tabn<CR>

"- update current document
noremap  zz		:up<CR>

nmap <leader>l :set list!<CR>
nmap <leader>w :set wrap!<CR>



"--{{{-----some emacs emu.-insert mode only :-------
"""imap <C-F> <right>
"""imap <C-B> <left>
""""imap <C-N> <down>
""""imap <C-P> <up>
"""imap <C-V> <PageDown>
"""imap <C-A> <Home>
""""imap <C-E> <End> " conflict with copy lower line characters..
"""" todo : <m-v> does not work ....
"""imap <M-V> <PageUp> 
"""imap <M-F> <c-right>
"""imap <M-B> <c-left>
" save completion feature 
"imap <M-/> <C-X><C-P>
"--}}}--------------------------------------------------

""--{{{------------- Comment/UnComment visually selected text---
""Menu items for Commenting and Un-Commenting code
"amenu 20.435 &Edit.-SEP4-			:
"amenu Edit.Comment <ESC>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call Comment(fl, ll)<CR>
"amenu Edit.UnComment <ESC>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call UnComment(fl, ll)<CR>
"
""Function for commenting a block of Visually selected text
"function Comment(fl, ll)
"    let i=a:fl
"	let comment="//"
"	while i<=a:ll
"	    let cl=getline(i)
"		let cl2=comment.cl
"		call setline(i, cl2)
"		let i=i+1
"	endwhile
"endfunction
"
""Function for Un-Commenting a block of Visually selected text
"function UnComment(fl, ll)
"    let i=a:fl
"	let comment="//"
"	while i<=a:ll
"	    let cl=getline(i)
"		let cl2=substitute(cl, "//", "", "")
"		call setline(i, cl2)
"		let i=i+1
"	endwhile
"endfunction
" vim:fdm=marker:
