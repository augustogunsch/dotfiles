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

call plug#begin()

Plug 'valloric/youcompleteme', { 'do': './install.py --clangd-completer'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

call plug#end()

let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1

:let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <C-F12> :!compiledb make<cr>
