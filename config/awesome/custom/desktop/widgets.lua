-- {{{ Modules
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local cmus_widget = require("awesome-wm-widgets.cmus-widget.cmus")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- }}}

-- {{{ Variables
local mytextclock = wibox.widget.textclock()
-- }}}

-- {{{ Script
return function(s)
    -- Layout box widget
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    return {
        layout = wibox.layout.fixed.horizontal,
        {
            widget = awful.widget.only_on_screen,
            {
                widget = wibox.container.margin,
                right = 7,
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 14,
                    wibox.widget.separator{
                        orientation = "vertical",
                        forced_width = 5,
                        visible = false
                    },
                    wibox.widget.systray(),
                    wibox.widget.separator{
                        orientation = "vertical",
                        forced_width = 5
                    }
                }
            }
        },
        {
            cmus_widget(),
            widget = wibox.container.margin,
            right = 10,
            left = 7,
            space = 5,
            draw_empty = false
        },
        {
            widget = wibox.container.margin,
            left = 7,
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = 14,
                volume_widget{
                    widget_type = 'icon_and_text',
                    with_icon = true,
                    mute_color = beautiful.bg_urgent
                },
                mytextclock,
                s.mylayoutbox,
            }
        }
    }
end
-- }}}
