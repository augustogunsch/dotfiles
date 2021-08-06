syntax on
filetype on
colorscheme torte
set clipboard=unnamedplus
set nu rnu
set smartindent

noremap - ddp
nnoremap _ ddkP

let mapleader = " "
let maplocalleader = ","

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :%s//gc<left><left><left>
nnoremap <C-w>t :tabnew<cr>

vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>
nnoremap H 0
nnoremap L $

augroup comments
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c 0i//<esc>
	autocmd FileType c          nnoremap <buffer> <localleader>c 0i//<esc>
	autocmd FileType python     nnoremap <buffer> <localleader>c 0i#<esc>
	autocmd FileType html       nnoremap <buffer> <localleader>c 0i<!--<esc>A--><esc>
augroup END

augroup html
	autocmd!
	autocmd FileType html inoremap <buffer> > ><esc>F<"tyef>"tpa><esc>T<i/<c-o>T>
	autocmd FileType html inoremap <buffer> = =""<left>
	autocmd FileType html inoremap <buffer> \= =
	autocmd FileType html inoremap <buffer> \> >
	autocmd FileType html iabbrev  <buffer> <! <!DOCTYPE html><c-o>df>
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
	autocmd FileType html vnoremap <buffer> H "tdh?><CR>"tpvT>
	autocmd FileType html vnoremap <buffer> L "td/<<CR>"tPg;vt<
augroup END

augroup python
	autocmd!
"	autocmd FileType python set et
	autocmd FileType python set ts=4
augroup END

" status line
set laststatus=2
set statusline=
set statusline+=%1*
set statusline+=\ 
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%2*
set statusline+=%=
set statusline+=%1*
set statusline+=\ 
set statusline+=%3l
set statusline+=:
set statusline+=%c
set statusline+=/
set statusline+=%L
set statusline+=\ 
hi User1 ctermbg=27 ctermfg=white
hi User2 ctermbg=234 ctermfg=white

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    hi User1 ctermbg=27 ctermfg=white
    return "NORMAL"
  elseif l:mode==?"v"
    hi User1 ctermbg=yellow ctermfg=black
    return "VISUAL"
  elseif l:mode==#"i"
    hi User1 ctermbg=darkgreen ctermfg=black
    return "INSERT"
  elseif l:mode==#"R"
    hi User1 ctermbg=darkred ctermfg=white
    return "REPLACE"
  endif
endfunction

" TabLine colors
hi clear TabLine
hi clear TabLineFill
hi clear TabLineSel
hi TabLineFill ctermfg=white  ctermbg=234
hi TabLine ctermfg=white  ctermbg=237 
hi TabLineSel ctermfg=white  ctermbg=27

" Disable -- INSERT --, etc
set noshowmode
set noshowcmd

" Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Ctags
nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+ias --extras=+q .<CR>
