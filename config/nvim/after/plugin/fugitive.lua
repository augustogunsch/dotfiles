local wk = require("which-key")

wk.register({
    ["<leader>gs"] = { vim.cmd.Git, "Open git menu" },
    ["<leader>gd"] = { vim.cmd.Gdiffsplit, "Compare unstaged changes difference" },
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
