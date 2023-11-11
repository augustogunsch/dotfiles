local wk = require("which-key")

wk.register({
    ["<leader>ut"] = { vim.cmd.UndotreeToggle, "Toggle undo history browser" },
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
