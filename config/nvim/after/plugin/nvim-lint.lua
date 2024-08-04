local wk = require("which-key")

require('lint').linters_by_ft = {
  python = {'flake8'}
}

local flake8 = require("lint").linters.flake8
flake8.args = {
  '--max-line-length=120',
  '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
  '--no-show-source',
  '--stdin-display-name',
  function() return vim.api.nvim_buf_get_name(0) end,
  '-',
}

wk.register({
    ["<leader>b"] = { vim.cmd.Black, "Black format" },
    ["<leader>l"] = { function() require("lint").try_lint() end, "Try to lint" },
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
