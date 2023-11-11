local wk = require("which-key")

wk.register({
  ["<leader>sv"] = {
    "Reload Neovim configuration"
  },
  ["<leader>p"] = {
    function ()
      local file_path = vim.fn.expand("%")
      vim.fn.setreg("+", file_path)
      print("Copied \"" .. file_path .. "\" to clipboard.")
    end,
    "Copy relative file path to clipboard"
  },
  ["<C-h>"] = { wk.show, "Show this help message" },
  ["<C-s>"] = { vim.cmd.w, "Save buffer" },
  ["<C-w>t"] = { vim.cmd.tabnew, "Open a new tab" },
  ["<leader>ix"] = {
    function ()
      vim.o.expandtab = true
    end,
    "Change identation style to spaces"
  },
  ["<leader>in"] = {
    function ()
      vim.o.expandtab = false
    end,
    "Change identation style to tab"
  },
  ['<leader>rw'] = {
    function ()
      vim.cmd("%s/[ \\t]*$//g")
      vim.cmd.noh()
    end,
    'Remove trailing whitespace'
  },
  ["<leader>e"] = { vim.diagnostic.open_float, "Show diagnostics error details" },
  ["<leader>n"] = { "Rename symbol under cursor" },
  ["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostics error" },
  ["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostics error" },
  ["gD"] = { "Go to declaration" },
  ["gd"] = { "Go to definition" },
  ["dL"] = { "0D", "Truncate line" },
  ["_"] = {
    function ()
      local line = vim.fn.line(".")
      local last_line = vim.fn.line("$")

      if line ~= last_line then
        vim.cmd.m("+1")
      end
    end,
    "Move line down"
  },
  ["-"] = {
    function ()
      local line = vim.fn.line(".")

      if line ~= 1 then
        vim.cmd.m("-2")
      end
    end,
    "Move line up"
  },
  ["H"] = { "0", "Same as 0" },
  ["L"] = { "$", "Same as $" },
}, {
  mode = "n",
  silent = true,
  noremap = true
})

wk.register({
  ["<C-w>"] = { "<bs>", "Same as backspace" },
}, {
  mode = "i",
  silent = true,
  noremap = true,
})

wk.register({
  ["s\""] = { "<esc>`<i\"<esc>`><right>a\"<esc>", "Surround with \"\"" },
  ["s\'"] = { "<esc>`<i\'<esc>`><right>a\'<esc>", "Surround with \'\'" },
  ["s "] = { "<esc>`<i <esc>`><right>a <esc>", "Surround with space" },
  ["s("] = { "<esc>`<i(<esc>`><right>a)<esc>", "Surround with ()" },
  ["s)"] = { "<esc>`<i(<esc>`><right>a)<esc>", "Surround with ()" },
  ["s["] = { "<esc>`<i[<esc>`><right>a]<esc>", "Surround with []" },
  ["s]"] = { "<esc>`<i[<esc>`><right>a]<esc>", "Surround with []" },
  ["s{"] = { "<esc>`<i{<esc>`><right>a}<esc>", "Surround with {}" },
  ["s}"] = { "<esc>`<i{<esc>`><right>a}<esc>", "Surround with {}" },
  ["J"] = { ":m '>+1<CR>gv=gv", "Move lines down" },
  ["K"] = { ":m '<-2<CR>gv=gv", "Move lines up" },
  ["<leader>y"] = { "\"+y", "Copy to system clipboard" },
}, {
  mode = "v",
  silent = true,
  noremap = true,
})
