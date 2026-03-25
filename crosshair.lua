-- RGB Crosshair GUI (made by ppeq67)

local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

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

-- RGB Label (made by ppeq67)
local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0, 30)
label.BackgroundTransparency = 1
label.Text = "made by ppeq67"
label.TextScaled = true

-- Button
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.8, 0, 0.4, 0)
button.Position = UDim2.new(0.1, 0, 0.4, 0)
button.Text = "Enable Crosshair"
button.BackgroundColor3 = Color3.fromRGB(40,40,40)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.TextScaled = true

-- RGB effect
local hue = 0
RunService.RenderStepped:Connect(function()
    hue = hue + 0.005
    if hue > 1 then hue = 0 end
    label.TextColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- Crosshair storage
local crosshairParts = {}

local function createCrosshair()
    local function add(part)
        table.insert(crosshairParts, part)
        part.Parent = gui
        part.AnchorPoint = Vector2.new(0.5,0.5)
        part.BackgroundColor3 = Color3.fromRGB(255,255,255)
        part.BorderSizePixel = 0
    end

    local dot = Instance.new("Frame")
    dot.Position = UDim2.new(0.5,0,0.5,0)
    dot.Size = UDim2.new(0,6,0,6)
    add(dot)

    local function line(x,y,w,h)
        local l = Instance.new("Frame")
        l.Position = UDim2.new(0.5,x,0.5,y)
        l.Size = UDim2.new(0,w,0,h)
        add(l)
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
