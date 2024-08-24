local function createESP(target)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Adornee = target.Character.Head
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    
    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = target.Name
    textLabel.TextColor3 = Color3.new(1, 0, 0) -- Color rojo
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    
    billboard.Parent = target.Character.Head
end

local function addESPToPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            createESP(player)
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(1) -- Espera a que el personaje cargue completamente
        createESP(player)
    end)
end)

addESPToPlayers()
