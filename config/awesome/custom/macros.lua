-- {{{ Modules
local awful = require("awful")
-- }}}

-- {{{ Script
local function instanceExists(class)
    local function filter(client)
        return awful.rules.match(client, {class = class})
    end

    -- Return true if any instance is found
    return awful.client.iterate(filter)() ~= nil
end

local function spawnIfNoInstance(command, class)
    if not instanceExists(class) then
        awful.spawn(command)
    end
end

local function work_apps()
    --spawnIfNoInstance("slack", "Slack")
    --spawnIfNoInstance("firefox --class WorkFirefox", "WorkFirefox")
    --spawnIfNoInstance("brave", "Brave")
    --spawnIfNoInstance("phpstorm", "jetbrains-phpstorm")
    --spawnIfNoInstance("sh -c 'alacritty --class WorkAlacritty -e tmux new-session -c ~/repos'", "WorkAlacritty")
    --awful.spawn.with_shell("cd ~/repos/rockar-peppermint; make up")
    --spawnIfNoInstance("dbeaver", "DBeaver")
end

local function end_work()
    --awful.spawn("pkill slack")
    --awful.spawn("xdotool search --class jetbrains-phpstorm windowkill")
    --awful.spawn("xdotool search --class WorkAlacritty windowquit")
    --awful.spawn("xdotool search --class WorkFirefox windowkill")
    --awful.spawn.with_shell("cd ~/repos/rockar-peppermint; make stop")
    -- Dbeaver requires to be killed twice
    --awful.spawn("xdotool search --class DBeaver windowkill")
    --awful.spawn("xdotool search --class DBeaver windowkill")
end

return {
    work_apps = work_apps,
    end_work = end_work
}
-- }}}
