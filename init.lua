--[[
    Monster Library UI
    Made by monster-hub-lol
    Style: Fluent / Windows 11
]]

local repo = "https://raw.githubusercontent.com/monster-hub-lol/Monster-Library-UI/main/src/"

-- Auto loader function
local function import(file)
    return loadstring(game:HttpGet(repo .. file .. ".lua"))()
end

-- Load core UI class
local UI = import("UI")

return UI
