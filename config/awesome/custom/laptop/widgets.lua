-- {{{ Modules
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local cmus_widget = require("awesome-wm-widgets.cmus-widget.cmus")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
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
            {
                layout = wibox.layout.flex.horizontal,
                max_widget_size = 300,
                cmus_widget(),
            },
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
                {
                    layout = wibox.layout.fixed.horizontal,
                    volume_widget{
                        widget_type = 'icon_and_text',
                        with_icon = true,
                        mute_color = beautiful.bg_urgent,
                    },
                    wibox.widget{
                        widget = wibox.widget.textbox,
                        text = '%',
                    },
                },
                battery_widget{
                    enable_battery_warning = true,
                    show_current_level = true,
                    font = beautiful.font
                },
                brightness_widget {
                    type = 'icon_and_text',
                    program = 'light',
                    percentage = true
                },
                mytextclock,
                s.mylayoutbox,
            }
        }
    }
end
-- }}}
