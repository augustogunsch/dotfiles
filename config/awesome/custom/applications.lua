-- {{{ Modules
local awful = require("awful")

local options = require("options")
-- }}}

-- {{{ Variables
-- Applications that will be started
local start_applications = {
    "picom",
    "flameshot",
    "nm-applet",
    "lxpolkit",
    "unclutter",
    "radiotray-ng",
    "keepassxc"
}

-- Applications that will be killed on exit/restart
local kill_applications = {
    "keepassxc"
}
-- }}}

-- {{{ Functions
local function kill_apps()
    for _, cmd in ipairs(kill_applications) do
        awful.spawn("pkill " .. cmd)
    end
end

local function quit()
    kill_apps()
    awesome.quit()
end

local function start()
    for _, cmd in ipairs(start_applications) do
        awful.spawn.single_instance(cmd)
    end
end

local function restart()
    kill_apps()
    awesome.restart()
    awful.spawn(options.terminal .. "-e xmodmap ~/.Xmodmap")
end
-- }}}

--- {{{ Script
start()

return {
    kill_apps = kill_apps,
    restart = restart,
    start = start,
    quit = quit
}
-- }}}
