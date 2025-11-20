local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(Tab, data)
    local self = setmetatable({}, Toggle)

    self.State = data.Default or false
    self.Name = data.Name
    self.Callback = data.Callback

    local btn = Instance.new("TextButton", Tab.Window.Main)
    btn.Size = UDim2.new(0,180,0,30)
    btn.Text = self.Name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.TextColor3 = Color3.new(1,1,1)

    local knob = Instance.new("ImageLabel", btn)
    knob.Size = UDim2.new(0,24,0,24)
    knob.Position = UDim2.new(1,-32,0.5,-12)
    knob.BackgroundTransparency = 1
    knob.Image = "rbxassetid://118868088075931"

    btn.MouseButton1Click:Connect(function()
        self.State = not self.State
        if self.Callback then self.Callback(self.State) end
    end)

    return self
end

return Toggle
