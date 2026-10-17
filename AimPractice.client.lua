
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AimPractice"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.fromOffset(180, 45)
button.Position = UDim2.fromOffset(20, 100)
button.Text = "Aim Practice: OFF"
button.Parent = gui

local circle = Instance.new("Frame")
circle.Size = UDim2.fromOffset(240, 240)
circle.AnchorPoint = Vector2.new(0.5, 0.5)
circle.Position = UDim2.fromScale(0.5, 0.5)
circle.BackgroundTransparency = 1
circle.Visible = false
circle.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = circle

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Parent = circle

local enabled = false

button.Activated:Connect(function()
    enabled = not enabled
    circle.Visible = enabled
    button.Text = enabled
        and "Aim Practice: ON"
        or "Aim Practice: OFF"
end)

