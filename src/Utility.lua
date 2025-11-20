local Utility = {}

function Utility:MakeDraggable(frame, dragHandle)
    local UIS = game:GetService("UserInputService")
    local dragging = false
    local offset

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            offset = input.Position - frame.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            frame.Position = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        dragging = false
    end)
end

return Utility
