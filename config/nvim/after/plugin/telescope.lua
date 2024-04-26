local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
    ["<leader>ff"] = { builtin.find_files, "Find files" },
    ["<C-p>"] = { builtin.git_files, "Find git files" },
    ["<leader>fs"] = { builtin.live_grep, "Grep files" },
    ["<leader>fh"] = { builtin.help_tags, "Find documentation" }
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
