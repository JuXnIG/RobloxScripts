-- LocalScript para crear una GUI móvil y teletransportarse a armas

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Lista de armas
local weaponNames = {
    "M4A1",
    "MP5",
    "P90"
}

-- Referencia a la carpeta de armas en el Workspace
local weaponsFolder = workspace:FindFirstChild("Weapons")

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WeaponTeleporterGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Crear contenedor para los botones
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.2, 0, 0.4, 0)
frame.Position = UDim2.new(0.75, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.7
frame.Parent = screenGui

-- Crear el botón de título
local titleButton = Instance.new("TextButton")
titleButton.Size = UDim2.new(1, 0, 0.2, 0)
titleButton.Position = UDim2.new(0, 0, 0, 0)
titleButton.Text = "Weapons TP"
titleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
titleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
titleButton.TextScaled = true
titleButton.Parent = frame

-- Función para crear botones
local function createButton(name, position, weaponName)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0.2, 0)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        if weaponsFolder then
            local weapon = weaponsFolder:FindFirstChild(weaponName)
            if weapon then
                humanoidRootPart.CFrame = weapon.CFrame
            else
                warn("Arma no encontrada: " .. weaponName)
            end
        else
            warn("Carpeta de armas no encontrada.")
        end
    end)
end

-- Crear botones para cada arma
for i, weaponName in ipairs(weaponNames) do
    local buttonName = "Teleport to " .. weaponName
    local position = UDim2.new(0, 0, 0.2 * i, 0)
    createButton(buttonName, position, weaponName)
end
