local Window = {}
Window.__index = Window

local repo = "https://raw.githubusercontent.com/monster-hub-lol/Monster-Library-UI/main/src/"
local function import(mod) return loadstring(game:HttpGet(repo .. mod .. ".lua"))() end

function Window.new(props)
    local self = setmetatable({}, Window)

    self.Title = props.Title or "Monster Hub"
    self.Theme = props.Theme or "Dark"
    self.Logo = props.Logo
    self.Tabs = {}

    -- UI OBJECTS
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 500, 0, 350)
    Main.Position = UDim2.new(0.5, -250, 0.5, -175)
    Main.BackgroundTransparency = self.Theme == "Light" and 0.15 or 0.05
    Main.BackgroundColor3 = self.Theme == "Light" and Color3.fromRGB(255,255,255) or Color3.fromRGB(15,15,15)
    Main.BorderSizePixel = 0

    local Corner = Instance.new("UICorner", Main)
    Corner.CornerRadius = UDim.new(0, 16)

    local Stroke = Instance.new("UIStroke", Main)
    Stroke.Thickness = 1
    Stroke.Color = Color3.fromRGB(60,60,60)

    -- Titlebar
    local TitleBar = Instance.new("Frame", Main)
    TitleBar.Size = UDim2.new(1,0,0,35)
    TitleBar.BackgroundTransparency = 1

    local Title = Instance.new("TextLabel", TitleBar)
    Title.Text = self.Title
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextColor3 = Color3.new(1,1,1)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0,45,0,0)
    Title.Size = UDim2.new(1,-50,1,0)

    local Icon = Instance.new("ImageLabel", TitleBar)
    Icon.Size = UDim2.new(0,25,0,25)
    Icon.Position = UDim2.new(0,10,0,5)
    Icon.BackgroundTransparency = 1
    Icon.Image = "rbxassetid://"..self.Logo

    self.Main = Main

    return self
end

function Window:CreateTab(name)
    local Tab = import("Tab")
    local new = Tab.new(self, name)
    table.insert(self.Tabs, new)
    return new
end

return Window
