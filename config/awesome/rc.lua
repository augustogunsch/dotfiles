-- {{{ Modules
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local options = require("options")

-- Load Debian menu entries
local is_deb, debian = pcall(require, "debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Initialization
-- Run apps on startup
require("custom.applications")

-- Initialize theme
if not beautiful.init(options.theme) then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = string.format("Couldn't load custom theme at %s! Falling back to the default one.", theme),
                     text = awesome.startup_errors })

    beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua") -- Fallback to default themes
end

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.max
}

-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", options.terminal .. " -e man awesome" },
   { "edit config", options.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
elseif is_deb then
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  { "Debian", debian.menu.Debian_menu.Debian },
                  menu_terminal,
                }
    })
else
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  menu_terminal,
                }
    })
end

-- Initialize screens
require("custom.screen")

-- Set keybindings
require("custom.bindings")

-- Load client rules
require("custom.rules")

-- Load client signals
require("custom.signals")
-- }}}
