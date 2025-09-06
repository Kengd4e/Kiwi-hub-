-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera

-- Variables
local flying = false
local cFlying = false
local speed = 50
local mode = "Fly"
local guiVisible = true
local minimized = false
local guiLocked = false
local fovRadius = 100

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- GUI Toggle Button (แยกด้านบน)
local toggleGuiBtn = Instance.new("TextButton")
toggleGuiBtn.Size = UDim2.new(0,120,0,30)
toggleGuiBtn.Position = UDim2.new(0.5,-60,0,10)
toggleGuiBtn.Text = "🖥️ Close GUI"
toggleGuiBtn.Font = Enum.Font.SourceSansBold
toggleGuiBtn.TextSize = 18
toggleGuiBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggleGuiBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleGuiBtn.Parent = screenGui

toggleGuiBtn.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    frame.Visible = guiVisible
    toggleGuiBtn.Text = guiVisible and "🖥️ Close GUI" or "🖥️ Open GUI"
end)

-- Main Frame (ตรงกลาง, ลากได้)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,260,0,260)
frame.Position = UDim2.new(0.5,-130,0.5,-130)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "Fly GUI ✈️"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0,30,0,30)
minimizeBtn.Position = UDim2.new(1,-35,0,0)
minimizeBtn.Text = "➖"
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextSize = 20
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
minimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
minimizeBtn.Parent = frame

minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for i,v in ipairs(frame:GetChildren()) do
        if v ~= title and v ~= minimizeBtn then
            v.Visible = not minimized
        end
    end
end)

-- Lock Button
local lockBtn = Instance.new("TextButton")
lockBtn.Size = UDim2.new(0,60,0,30)
lockBtn.Position = UDim2.new(1,-100,0,0)
lockBtn.Text = "🔓"
lockBtn.Font = Enum.Font.SourceSansBold
lockBtn.TextSize = 16
lockBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
lockBtn.TextColor3 = Color3.fromRGB(255,255,255)
lockBtn.Parent = frame

lockBtn.MouseButton1Click:Connect(function()
    guiLocked = not guiLocked
    frame.Draggable = not guiLocked
    lockBtn.Text = guiLocked and "🔒" or "🔓"
end)

-- Mode Button
local modeButton = Instance.new("TextButton")
modeButton.Size = UDim2.new(1, -20, 0, 30)
modeButton.Position = UDim2.new(0,10,0,40)
modeButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
modeButton.TextColor3 = Color3.fromRGB(255,255,255)
modeButton.Text = "Mode: 🪁 Fly"
modeButton.Font = Enum.Font.SourceSans
modeButton.TextSize = 18
modeButton.Parent = frame

modeButton.MouseButton1Click:Connect(function()
    if mode == "Fly" then
        mode = "CFly"
        modeButton.Text = "Mode: 🪂 CFly"
    else
        mode = "Fly"
        modeButton.Text = "Mode: 🪁 Fly"
    end
end)

-- Fly Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 30)
toggleButton.Position = UDim2.new(0,10,0,80)
toggleButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggleButton.TextColor3 = Color3.fromRGB(255,255,255)
toggleButton.Text = "✈️ Toggle Fly"
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 18
toggleButton.Parent = frame

toggleButton.MouseButton1Click:Connect(function()
    if mode == "Fly" then
        flying = not flying
    else
        cFlying = not cFlying
    end
end)

-- Speed Label & Box
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -20, 0, 20)
speedLabel.Position = UDim2.new(0,10,0,120)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(255,255,255)
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextSize = 16
speedLabel.Text = "Speed: "..speed.." ⚡"
speedLabel.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(1, -20, 0, 20)
speedBox.Position = UDim2.new(0,10,0,140)
speedBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedBox.TextColor3 = Color3.fromRGB(255,255,255)
speedBox.Text = tostring(speed)
speedBox.ClearTextOnFocus = false
speedBox.Font = Enum.Font.SourceSans
speedBox.TextSize = 16
speedBox.Parent = frame

speedBox.FocusLost:Connect(function()
    local val = tonumber(speedBox.Text)
    if val then
        speed = val
        speedLabel.Text = "Speed: "..speed.." ⚡"
    end
end)

-- FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Radius = fovRadius
fovCircle.Color = Color3.fromRGB(0,255,0)
fovCircle.Thickness = 2
fovCircle.Visible = true
fovCircle.Filled = false

-- Flight Line
local flightLine = Drawing.new("Line")
flightLine.Color = Color3.fromRGB(255,255,0)
flightLine.Thickness = 2
flightLine.Visible = true

-- Fly Logic + Drawing Update
RunService.RenderStepped:Connect(function()
    local activeFlying = (mode=="Fly" and flying) or (mode=="CFly" and cFlying)
    
    -- Update FOV Circle Position
    fovCircle.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
    
    -- Update Flight Line
    local screenPos = camera:WorldToViewportPoint(humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector*10)
    flightLine.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
    flightLine.To = Vector2.new(screenPos.X, screenPos.Y)

    if activeFlying then
        local moveDirection = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0,1,0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection = moveDirection - Vector3.new(0,1,0)
        end

        if mode == "CFly" then
            humanoidRootPart.Velocity = moveDirection * (speed*0.5)
        else
            if moveDirection.Magnitude > 0 then
                humanoidRootPart.Velocity = moveDirection.Unit * speed
            else
                humanoidRootPart.Velocity = Vector3.new(0,0,0)
            end
        end
    end
end)
