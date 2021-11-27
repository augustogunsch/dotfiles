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
set nohlsearch
filetype indent off
hi Whitespace ctermfg=233
hi SignColumn ctermbg=233

nnoremap <F12> :set et<cr>:set ts=4<cr>:set sw=4<cr>
nnoremap <F11> :set noet<cr>:set ts=8<cr>:set sw=8<cr>
nnoremap <F5> :set list!<cr>

noremap - ddp
nnoremap _ ddkP

let mapleader = " "
let maplocalleader = ","

nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :%s//gc<left><left><left>
nnoremap <C-w>t :tabnew<cr>

" auto quote
vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>
nnoremap H 0
nnoremap L $
" auto indent
"vnoremap <c-q> <esc>:lua vim.lsp.buf.range_formatting()<cr>

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

call plug#end()

nnoremap <C-n> <cmd>silent NERDTreeToggle<CR>

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

local common_bindings = function(client, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
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
local servers = { 'clangd', 'rls', 'tsserver' }
for _, lsp in ipairs(servers) do
	setup(lsp, default_attach)
end

-- Servers with custom setup

-- pylsp
local pylsp_settings = {
	pylsp = {
		plugins = {
			pycodestyle = {
				ignore = {'E501'}
			}
		}
	}
}

setup('pylsp', default_attach, pylsp_settings)

EOF

" auto close scratch buffer (preview window)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" xptemplate (snippets) config
let g:xptemplate_vars = "SPcmd=&SParg="
