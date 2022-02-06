syntax on
filetype on
filetype plugin on
set encoding=utf-8
set clipboard=unnamedplus
set nu rnu
set smartindent
set nocp
set bo=all
set mouse=a
colorscheme torte
set list
set listchars=tab:*·,lead:·,trail:~,extends:>,precedes:<
set noet
filetype indent off
hi Whitespace ctermfg=233
hi SignColumn ctermbg=233
hi DiffChange ctermbg=17
hi DiffDelete ctermbg=52 ctermfg=15
hi DiffAdd ctermbg=22
hi DiffText ctermbg=166 ctermfg=15
hi Folded ctermbg=233 ctermfg=247
hi FoldColumn ctermbg=233 ctermfg=247

let mapleader = " "
let maplocalleader = ","

nnoremap <silent> <F12> <cmd>set et<cr><cmd>set ts=4<cr><cmd>set sw=4<cr>
nnoremap <silent> <F11> <cmd>set noet<cr>
nnoremap <silent> <F2> <cmd>ToggleDiagOff<cr>:Gdiffsplit<cr>
nnoremap <silent> <F5> <cmd>ToggleDiag<cr>
nnoremap <silent> <F6> <cmd>%!expand -t4<cr><cmd>%!sed 's/[ \t]*$//'<cr>
nnoremap <silent> <F7> <cmd>%!unexpand -t4<cr><cmd>%!sed 's/[ \t]*$//'<cr>
nnoremap <silent> <F8> <cmd>TagbarToggle<CR>
nnoremap <silent> <C-n> <cmd>NERDTreeToggle<CR>

noremap - ddp
nnoremap _ ddkP

nnoremap <silent> <leader>ev <cmd>tabnew $MYVIMRC<cr>
nnoremap <silent> <leader>sv <cmd>source $MYVIMRC<cr>
nnoremap <C-s> :%s//gc<left><left><left>
nnoremap <silent> <C-w>t <cmd>tabnew<cr>
nnoremap dL 0D

" auto quote
vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>
nnoremap H 0
nnoremap L $

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

Plug 'drmingdrmer/xptemplate'

Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

Plug 'preservim/tagbar'

Plug 'junegunn/fzf.vim'

call plug#end()

augroup python
	autocmd FileType python :iabbrev <buffer> frompdb from pdb import set_trace; set_trace()
augroup END

augroup nerdtree
	" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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

local common_bindings = function(client, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = { noremap=true, silent=true }

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	buf_set_keymap('n', '<C-[>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

local default_formatting = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = { noremap=true, silent=true }

	buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local default_attach = function(client, bufnr)
	common_bindings(client, bufnr)
	default_formatting(client, bufnr)
end


local setup = function(lsp, on_attach, settings)
	local nvim_lsp = require('lspconfig')

	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		settings=settings
	}
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'rls', 'tsserver', 'jedi_language_server' }
for _, lsp in ipairs(servers) do
	setup(lsp, default_attach)
end
EOF

" auto close scratch buffer (preview window)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" xptemplate (snippets) config
let g:xptemplate_vars = "SPcmd=&SParg="
