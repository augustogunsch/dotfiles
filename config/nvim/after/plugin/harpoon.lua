local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
    ["<leader>a"] = { mark.add_file, "Add file to harpoon" },
    ["<C-g>"] = { ui.toggle_quick_menu, "Toggle quick harpoon menu" },
    ["g1"] = { function() ui.nav_file(1) end, "Navigate to first file in harpoon"},
    ["g2"] = { function() ui.nav_file(2) end, "Navigate to second file in harpoon"},
    ["g3"] = { function() ui.nav_file(3) end, "Navigate to third file in harpoon"},
    ["g4"] = { function() ui.nav_file(4) end, "Navigate to fourth file in harpoon"}
}, {
    mode = "n",
    silent = true,
    noremap = true,
})
