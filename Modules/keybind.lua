local Keybind = {
    Functions = {},
    Assigned = {}
}


local UserInputService = game:GetService("UserInputService")

local Thread, NewInputConnection = task.spawn, UserInputService.InputBegan

function Keybind:SetUpKey(Bind, Name, Action)
    table.insert(Keybind.Assigned, {
        Name = Name,
        Keybind = Bind,
        Action = Action
    })
end

function Keybind:Functions(Input)
    for i,v in pairs(Keybind.Assigned) do
        if v.Keybind == Input.KeyCode or v.Keybind == Input.UserInputType then
            return v.Action()
        end
    end
end

function Keybind:ChangeKey(Name, New_Key)
    for i,v in ipairs(Keybind.Assigned) do
        if v.Name == Name then
            v.Keybind = New_Key
        end
    end
end

Thread(function() -->> putting it in a thread
    NewInputConnection:Connect(function(input, gameProcessedEvent)
        if gameProcessedEvent then return end
        Keybind:Functions(input)
    end)
end)


return Keybind
