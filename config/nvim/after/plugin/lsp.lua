local lsp_zero = require("lsp-zero")
local wk = require("which-key")

wk.register({
    ["gd"] = { "Go to definitions" },
    ["K"] = { "Show info" },
    ["<leader>vws"] = { "View workspace symbol"},
    ["<leader>vd"] = { "View diagnostics"},
    ["<leader>vca"] = { "View code action"},
    ["<leader>vrr"] = { "View references"},
    ["<leader>vrn"] = { "Rename symbol"},
    ["<leader>vl"] = { "Restart LSP"},
    ["[d"] = { "Go to previous diagnotics"},
    ["]d"] = { "Go to next diagnotics"}
}, {
    mode = "n",
    silent = true,
    noremap = true,
})

wk.register({
    ["<C-h>"] = { "Signature help"}
}, {
    mode = "i",
    silent = true,
    noremap = true,
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>vl", vim.cmd.LspRestart, opts)
  vim.keymap.set("n", "<C-s>", function()
    vim.lsp.buf.format()
    vim.cmd.w()
  end, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "rust_analyzer",
    "jedi_language_server",
    "clangd",
    "gopls"
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "nvim_lua"},
    {name = "luasnip"}
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
