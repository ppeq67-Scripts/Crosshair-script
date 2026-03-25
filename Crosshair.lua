-- Crosshair GUI Script

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CrosshairGUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Center dot
local dot = Instance.new("Frame")
dot.Parent = gui
dot.AnchorPoint = Vector2.new(0.5, 0.5)
dot.Position = UDim2.new(0.5, 0, 0.5, 0)
dot.Size = UDim2.new(0, 6, 0, 6)
dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dot.BorderSizePixel = 0

local function createLine(xOffset, yOffset, width, height)
    local line = Instance.new("Frame")
    line.Parent = gui
    line.AnchorPoint = Vector2.new(0.5, 0.5)
    line.Position = UDim2.new(0.5, xOffset, 0.5, yOffset)
    line.Size = UDim2.new(0, width, 0, height)
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    line.BorderSizePixel = 0
end

createLine(0, -10, 2, 8)
createLine(0, 10, 2, 8)
createLine(-10, 0, 8, 2)
createLine(10, 0, 8, 2)
