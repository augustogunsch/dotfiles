local wk = require("which-key")

wk.register({
    ["<C-t>"] = { vim.cmd.TagbarToggle, "Toggle symbols tree browser" },
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
