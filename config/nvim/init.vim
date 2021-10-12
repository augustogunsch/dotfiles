syntax on
filetype on
filetype plugin on
set encoding=utf-8
set clipboard=unnamedplus
set nu rnu
set smartindent
set nocp
set bo=all
colorscheme torte
set list
set listchars=tab:*·,lead:·,trail:~,extends:>,precedes:<
set noet
set ts=8
set sw=8
filetype indent off
hi Whitespace ctermfg=233
hi SignColumn ctermbg=233

nnoremap <F5> :set list!<cr>
nnoremap <F12> :!sample-compile-flags<cr>

noremap - ddp
nnoremap _ ddkP

let mapleader = " "
let maplocalleader = ","

nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :%s//gc<left><left><left>
nnoremap <C-w>t :tabnew<cr>

vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>
nnoremap H 0
nnoremap L $

" Used in abbrevs to remove a space
" append: <c-r>=Eatchar('\s')<cr>
func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

augroup html
	autocmd!
	autocmd FileType html inoremap <buffer> > ><esc>F<"tyef>"tpa><esc>T<i/<c-o>T>
	autocmd FileType html inoremap <buffer> = =""<left>
	autocmd FileType html inoremap <buffer> \= =
	autocmd FileType html inoremap <buffer> \> >
	autocmd FileType html iabbrev  <buffer> <! <!DOCTYPE html><c-o>df><cr><html><cr><cr><up><head><cr><c-o>o<body><cr><c-o>2k<c-o>O<meta charset=utf-8<c-o>A><c-o>df><cr><title><c-r>=Eatchar('\s')<cr>
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
	autocmd FileType html vnoremap <buffer> H "tdh?><CR>"tpvT>
	autocmd FileType html vnoremap <buffer> L "td/<<CR>"tPg;vt<
augroup END

augroup javascript
	autocmd!
	autocmd FileType javascript inoremap <buffer> '. ><esc>F<"tyef>"tpa><esc>T<i/<c-o>T>
	autocmd FileType javascript nnoremap <buffer> <localleader>f Vatzf
	autocmd FileType javascript vnoremap <buffer> H "tdh?><CR>"tpvT>
	autocmd FileType javascript vnoremap <buffer> L "td/<<CR>"tPg;vt<
	autocmd FileType javascript iabbrev <silent> <buffer> log console.log("")<left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType javascript iabbrev <silent> <buffer> for for(let i = 0; i < ; i++) {<cr>}<up><c-o>f;<c-o>;<c-r>=Eatchar('\s')<cr>
	autocmd FileType javascript iabbrev <silent> <buffer> while while() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType javascript iabbrev <silent> <buffer> if if() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType javascript iabbrev <silent> <buffer> fn function () {<cr>}<up><c-o>f(<c-r>=Eatchar('\s')<cr>
	autocmd FileType javascript iabbrev <silent> <buffer> ret return<c-r>=Eatchar('\s')<cr>
	autocmd FileType javascript iabbrev <silent> <buffer> let let  = <left><left><left><c-r>=Eatchar('\s')<cr>
augroup javascript

augroup python
	autocmd!
	autocmd FileType python iabbrev <silent> <buffer> for for x in :<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> while while :<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> if if :<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> elif elif :<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> def def ():<left><left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> met def (self):<c-o>F(<c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> class class :<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> ret return<c-r>=Eatchar('\s')<cr>
	autocmd FileType python iabbrev <silent> <buffer> #! #!/bin/python3<cr><c-r>=Eatchar('\s')<cr>
	autocmd FileType python set noet
	autocmd FileType python set ts=8
	autocmd FileType python set sw=8
augroup END

augroup rust
	autocmd!
	autocmd FileType rust set noet
	autocmd FileType rust set ts=8
	autocmd FileType rust set sw=8
	autocmd FileType rust iabbrev <silent> <buffer> for for x in  {<cr>}<up><c-o>f{<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> impl impl x for x {<cr>}<up><c-o>fx<delete><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> struct struct {<cr>}<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> match match {<cr>}<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> der #[derive ()]<left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> fn fn () {<cr>}<up><c-o>f(<c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> let let  = ;<c-o>F=<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> use use ;<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> type type  = ;<c-o>F=<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> if if  {<cr>}<up><c-o>f{<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> ret return
	autocmd FileType rust iabbrev <silent> <buffer> log@ println!("");<left><left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType rust iabbrev <silent> <buffer> main@ fn main() {<cr>}<c-o>O<c-r>=Eatchar('\s')<cr>
augroup END

augroup c
	autocmd!
	autocmd FileType c iabbrev <silent> <buffer> main@ int main(int argc, char* argv[]) {<cr><cr><cr>return 0;<cr>}<up><up><up><tab><c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> printf printf("");<left><left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> log@ fprintf(stderr, "");<left><left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> for for(int i = 0; i < ; i++) {<cr>}<up><c-o>f;<c-o>;<c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> if if() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> while while() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> struct struct {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> enum enum {<cr>}<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> fn@ void () {<cr>}<up><c-o>f(<c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> ret return ;<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> retv return;<c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> incl #include <<c-r>=Eatchar('\s')<cr>
	autocmd FileType c iabbrev <silent> <buffer> def #define <c-r>=Eatchar('\s')<cr>
augroup END

augroup cpp
	autocmd!
	autocmd FileType cpp iabbrev <silent> <buffer> main@ using namespace std;<cr><cr>int main(int argc, char* argv[]) {<cr><cr><cr>return 0;<cr>}<up><up><up><tab><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> cerr cerr << "" << endl;<c-o>F"<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> cout cout << "" << endl;<c-o>F"<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> for for(int i = 0; i < ; i++) {<cr>}<up><c-o>f;<c-o>;<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> if if() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> while while() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> struct struct {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> class class {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> pub public:<cr><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> priv private:<cr><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> enum enum {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> fn@ void () {<cr>}<up><c-o>f(<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> templ template <typename T><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> ret return ;<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> retv return;<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> incl #include <<c-r>=Eatchar('\s')<cr>
	autocmd FileType cpp iabbrev <silent> <buffer> def #define <c-r>=Eatchar('\s')<cr>
augroup END

augroup cs
	autocmd!
	autocmd FileType cs iabbrev <silent> <buffer> main@ using System;<cr><cr>class Program {<cr>static void Main(string[] args) {<cr>}<cr>}<up><c-o>O<c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> log@ Console.WriteLine("");<left><left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> for for(int i = 0; i < ; i++) {<cr>}<up><c-o>f;<c-o>;<c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> if if() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> while while() {<cr>}<up><c-o>f)<c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> struct struct {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> class class {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> pub public
	autocmd FileType cs iabbrev <silent> <buffer> priv private
	autocmd FileType cs iabbrev <silent> <buffer> enum enum {<cr>};<up><c-o>f<space><space><c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> fn@ void () {<cr>}<up><c-o>f(<c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> ret return ;<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType cs iabbrev <silent> <buffer> retv return;<c-r>=Eatchar('\s')<cr>
augroup END

augroup sh
	autocmd FileType sh iabbrev <silent> <buffer> #! #!/bin/sh<cr>set -e<cr><c-r>=Eatchar('\s')<cr>
	autocmd FileType sh iabbrev <silent> <buffer> if if [  ]; then<cr>fi<up><c-o>f]<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType sh iabbrev <silent> <buffer> elif elif [  ]; then<c-o>F]<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType sh iabbrev <silent> <buffer> for for x in ; do<cr>done<up><c-o>f;<c-r>=Eatchar('\s')<cr>
	autocmd FileType sh iabbrev <silent> <buffer> while while ; do<cr>done<up><c-o>f;<c-r>=Eatchar('\s')<cr>
	autocmd FileType sh iabbrev <silent> <buffer> fn@ () {<cr>}<up><c-o>0<c-r>=Eatchar('\s')<cr>
augroup END

augroup bash
	autocmd FileType bash iabbrev <silent> <buffer> while while ; do<cr>done<up><c-o>f;<c-r>=Eatchar('\s')<cr>
	autocmd FileType bash iabbrev <silent> <buffer> for for x in ; do<cr>done<up><c-o>f;<c-r>=Eatchar('\s')<cr>
	autocmd FileType bash iabbrev <silent> <buffer> fn@ () {<cr>}<up><c-o>0<c-r>=Eatchar('\s')<cr>
	autocmd FileType bash iabbrev <silent> <buffer> if if [[  ]]; then<cr>fi<up><c-o>f]<left><c-r>=Eatchar('\s')<cr>
	autocmd FileType bash iabbrev <silent> <buffer> elif elif [[  ]]; then<c-o>F]<left><left><c-r>=Eatchar('\s')<cr>
	autocmd FileType bash iabbrev <silent> <buffer> #! #!/bin/bash<cr>set -e<cr><c-r>=Eatchar('\s')<cr>
augroup END

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" LSP config
Plug 'neovim/nvim-lspconfig'
" *auto* completion
Plug 'hrsh7th/nvim-compe'

Plug 'tpope/vim-fugitive'

call plug#end()

nnoremap <C-n> :silent NERDTreeToggle<CR>

augroup nerdtree
	" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END

let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#nerdtree_statusline = 1


lua << EOF
--- nvim-compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

--- IMPORTANT
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })

--- LSP
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'clangd', 'rls', 'tsserver' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local html = nvim_lsp.html
local css = nvim_lsp.html
html.setup { 
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "vscode-html-languageserver", "--stdio" },
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		html = {
			validate = true
		}
	}
}
css.setup { 
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "vscode-css-languageserver", "--stdio" },
	flags = {
		debounce_text_changes = 150,
	},
}

EOF

" auto close scratch buffer (preview window)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
