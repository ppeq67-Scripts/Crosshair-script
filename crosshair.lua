-- Crosshair GUI with Toggle

local player = game:GetService("Players").LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "CrosshairGUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0, 30)
label.BackgroundTransparency = 1
label.Text = "Crosshair GUI"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextScaled = true

local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.8, 0, 0.4, 0)
button.Position = UDim2.new(0.1, 0, 0.4, 0)
button.Text = "Enable Crosshair"
button.BackgroundColor3 = Color3.fromRGB(40,40,40)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.TextScaled = true

-- Crosshair parts
local crosshairParts = {}

local function createCrosshair()
    -- center dot
    local dot = Instance.new("Frame")
    dot.Parent = gui
    dot.AnchorPoint = Vector2.new(0.5,0.5)
    dot.Position = UDim2.new(0.5,0,0.5,0)
    dot.Size = UDim2.new(0,6,0,6)
    dot.BackgroundColor3 = Color3.fromRGB(255,255,255)
    dot.BorderSizePixel = 0
    table.insert(crosshairParts, dot)

    local function line(x,y,w,h)
        local l = Instance.new("Frame")
        l.Parent = gui
        l.AnchorPoint = Vector2.new(0.5,0.5)
        l.Position = UDim2.new(0.5,x,0.5,y)
        l.Size = UDim2.new(0,w,0,h)
        l.BackgroundColor3 = Color3.fromRGB(255,255,255)
        l.BorderSizePixel = 0
        table.insert(crosshairParts, l)
    end

    line(0,-10,2,8)
    line(0,10,2,8)
    line(-10,0,8,2)
    line(10,0,8,2)
end

local function removeCrosshair()
    for _,v in pairs(crosshairParts) do
        v:Destroy()
    end
    crosshairParts = {}
end

-- Toggle
local enabled = false

button.MouseButton1Click:Connect(function()
    enabled = not enabled

    if enabled then
        createCrosshair()
        button.Text = "Disable Crosshair"
        button.BackgroundColor3 = Color3.fromRGB(0,170,0)
    else
        removeCrosshair()
        button.Text = "Enable Crosshair"
        button.BackgroundColor3 = Color3.fromRGB(40,40,40)
    end
end)
