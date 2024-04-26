-- {{{ Modules
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local options = require ("options")
local modkey = options.modkey
local widgets = require("custom." .. options.profile .. ".widgets")
local bindings = require("custom.bindings")
-- }}}

-- {{{ Functions
local function set_wallpaper(s)
    awful.spawn.with_shell("nitrogen --restore")
end
-- }}}

-- {{{ Script
-- Update wallpaper when screen size changes
screen.connect_signal("property::geometry", set_wallpaper)

-- Setup each screen
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }, s, awful.layout.layouts[2])

    -- Tag list
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = bindings.taglist_buttons
    }

    -- Task list
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = bindings.tasklist_buttons
    }

    -- Wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        s.mytaglist,
        s.mytasklist,
        widgets(s)
    }
end)
-- }}}
