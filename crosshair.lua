-- RGB Crosshair GUI (made by ppeq67)

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

-- CREDIT LABEL (VERY VISIBLE)
local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0, 30)
label.BackgroundTransparency = 1
label.Text = "made by ppeq67"
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold

-- BUTTON
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.8, 0, 0.4, 0)
button.Position = UDim2.new(0.1, 0, 0.4, 0)
button.Text = "Enable Crosshair"
button.BackgroundColor3 = Color3.fromRGB(40,40,40)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.TextScaled = true

-- 🌈 RGB EFFECT (STRONG + NOTICEABLE)
local hue = 0
RunService.RenderStepped:Connect(function()
    hue = (hue + 0.01) % 1
    label.TextColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- CROSSHAIR
local parts = {}

local function addPart(x,y,w,h)
    local p = Instance.new("Frame")
    p.Parent = gui
    p.AnchorPoint = Vector2.new(0.5,0.5)
    p.Position = UDim2.new(0.5,x,0.5,y)
    p.Size = UDim2.new(0,w,0,h)
    p.BackgroundColor3 = Color3.fromRGB(255,255,255)
    p.BorderSizePixel = 0
    table.insert(parts, p)
end

local function createCrosshair()
    addPart(0,0,6,6)
    addPart(0,-10,2,8)
    addPart(0,10,2,8)
    addPart(-10,0,8,2)
    addPart(10,0,8,2)
end

local function removeCrosshair()
    for _,v in pairs(parts) do
        v:Destroy()
    end
    parts = {}
end

-- TOGGLE
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
