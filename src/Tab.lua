local Tab = {}
Tab.__index = Tab

local repo = "https://raw.githubusercontent.com/monster-hub-lol/Monster-Library-UI/main/src/"
local function import(mod) return loadstring(game:HttpGet(repo .. mod .. ".lua"))() end

function Tab.new(Window, name)
    local self = setmetatable({}, Tab)

    self.Window = Window
    self.Name = name
    self.Elements = {}

    local TabButton = Instance.new("TextButton", Window.Main)
    TabButton.Size = UDim2.new(0,120,0,28)
    TabButton.Text = name
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
    TabButton.TextColor3 = Color3.new(1,1,1)

    self.TabButton = TabButton
    return self
end

function Tab:CreateToggle(data)
    local Toggle = import("Toggle")
    local new = Toggle.new(self, data)
    table.insert(self.Elements, new)
    return new
end

return Tab
