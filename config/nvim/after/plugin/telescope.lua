local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
    ["<leader>ff"] = { builtin.find_files, "Find files" },
    ["<C-p>"] = { builtin.git_files, "Find git files" },
    ["<leader>fs"] = {
      function ()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end,
      "Grep files"
    },
    ["<leader>fh"] = { builtin.help_tags, "Find documentation" }
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
