
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AimPractice"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.fromOffset(180, 45)
button.Position = UDim2.fromOffset(20, 100)
button.Text = "Practice: OFF"
button.Parent = gui

local marker = Instance.new("TextLabel")
marker.Size = UDim2.fromOffset(180, 35)
marker.AnchorPoint = Vector2.new(0.5, 0.5)
marker.BackgroundTransparency = 1
marker.Text = "TRAINING TARGET"
marker.TextSize = 18
marker.Visible = false
marker.Parent = gui

local enabled = false

button.Activated:Connect(function()
    enabled = not enabled
    marker.Visible = enabled
    button.Text = enabled and "Practice: ON" or "Practice: OFF"
end)

RunService.RenderStepped:Connect(function()
    if not enabled then return end

    local camera = workspace.CurrentCamera
    if not camera then return end

    -- مؤشر تدريبي يتحرك قرب منتصف الشاشة
    local t = os.clock()
    local x = camera.ViewportSize.X / 2 + math.sin(t * 2) * 80
    local y = camera.ViewportSize.Y / 2 + math.cos(t * 1.5) * 45

    marker.Position = UDim2.fromOffset(x, y)
end)
