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
set ts=8
set list
set listchars=tab:*·,lead:·,trail:~,extends:>,precedes:<
hi Whitespace ctermfg=233
hi SignColumn ctermbg=233

nnoremap <F5> :set list!<cr>

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

nnoremap <C-n> :NERDTreeToggle<CR>

augroup nerdtree
	autocmd FileType c silent if !exists('b:NERDTree') | silent NERDTree | endif
augroup END

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


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
local servers = { 'pyright', 'clangd' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
EOF

" auto close scratch buffer (preview window)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
