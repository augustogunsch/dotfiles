-- {{{ Modules
local gears = require("gears")
-- }}}

-- Available profiles: desktop, laptop
local profile = "desktop"

-- Default apps
local terminal = "alacritty"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local screen_locker = "cinnamon-screensaver-command -l"

-- Default modkey
local modkey = "Mod1"

-- Chosen theme
local theme = gears.filesystem.get_configuration_dir() .. "themes/default/theme.lua"

return {
    profile = profile,
    terminal = terminal,
    editor = editor,
    editor_cmd = editor_cmd,
    screen_locker = screen_locker,
    modkey = modkey,
    theme = theme
}
