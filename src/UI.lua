local UI = {}
UI.__index = UI

local repo = "https://raw.githubusercontent.com/monster-hub-lol/Monster-Library-UI/main/src/"
local function import(mod) return loadstring(game:HttpGet(repo .. mod .. ".lua"))() end

function UI:CreateWindow(options)
    local Window = import("Window")
    return Window.new(options)
end

return UI
