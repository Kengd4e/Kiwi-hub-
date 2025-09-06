--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer

--// SETTINGS
local Settings = {
    AimLockEnabled = false,
    ESPEnabled = true,
    TeamCheck = true,
    WallCheck = true,
    FOVRadius = 150,
    PredictionEnabled = true,
    BulletSpeed = 300,
    PredictionFactor = 1
}

--// GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

local function ScaleUI(baseW, baseH)
    local w,h = Camera.ViewportSize.X, Camera.ViewportSize.Y
    return UDim2.new(0, math.clamp(baseW*(w/1080), 220, 400), 0, math.clamp(baseH*(h/1920), 400, 600))
end

-- Main Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = ScaleUI(300,550)
MainFrame.Position = UDim2.new(0.5,0,0.5,0)
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0,16)

-- Header
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1,0,0,40)
Header.BackgroundColor3 = Color3.fromRGB(245,245,245)
local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0,16)
local HeaderLabel = Instance.new("TextLabel", Header)
HeaderLabel.Size = UDim2.new(1,0,1,0)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.Text = "🥝 Arceus X UI"
HeaderLabel.TextColor3 = Color3.fromRGB(0,0,0)
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextSize = 18

-- Lock UI
local LockButton = Instance.new("TextButton", Header)
LockButton.Size = UDim2.new(0,50,1,-8)
LockButton.Position = UDim2.new(1,-55,0,4)
LockButton.Text = "🔒"
LockButton.BackgroundColor3 = Color3.fromRGB(220,220,220)
local lockCorner = Instance.new("UICorner", LockButton)
lockCorner.CornerRadius = UDim.new(0,10)
LockButton.MouseButton1Click:Connect(function()
    MainFrame.Draggable = not MainFrame.Draggable
    LockButton.Text = MainFrame.Draggable and "🔓" or "🔒"
end)

-- Toggle GUI
local ToggleUIButton = Instance.new("TextButton", ScreenGui)
ToggleUIButton.Size = UDim2.new(0,50,0,50)
ToggleUIButton.Position = UDim2.new(0,10,0,10)
ToggleUIButton.Text = "🥝"
ToggleUIButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
local toggleCorner = Instance.new("UICorner", ToggleUIButton)
toggleCorner.CornerRadius = UDim.new(0,12)
ToggleUIButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Tooltip
local Tooltip = Instance.new("TextLabel", ScreenGui)
Tooltip.Size = UDim2.new(0,180,0,25)
Tooltip.BackgroundColor3 = Color3.fromRGB(0,0,0)
Tooltip.BackgroundTransparency = 0.5
Tooltip.TextColor3 = Color3.fromRGB(255,255,255)
Tooltip.Text = ""
Tooltip.Visible = false
Tooltip.AnchorPoint = Vector2.new(0,1)
Tooltip.TextSize = 14
Tooltip.Font = Enum.Font.Gotham

-- Toggle Button Function
local function CreateToggleButton(parent, y, text, key, tooltip)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0,parent.AbsoluteSize.X-40,0,30)
    btn.Position = UDim2.new(0,20,0,y)
    btn.BackgroundColor3 = Settings[key] and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
    btn.Text = text .. ": " .. (Settings[key] and "ON" or "OFF")
    btn.AutoButtonColor = false
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0,10)
    btn.MouseEnter:Connect(function()
        Tooltip.Text = tooltip
        Tooltip.Position = UDim2.new(0, btn.AbsolutePosition.X, 0, btn.AbsolutePosition.Y)
        Tooltip.Visible = true
    end)
    btn.MouseLeave:Connect(function() Tooltip.Visible = false end)
    btn.MouseButton1Click:Connect(function()
        Settings[key] = not Settings[key]
        btn.Text = text .. ": " .. (Settings[key] and "ON" or "OFF")
        btn.BackgroundColor3 = Settings[key] and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
    end)
    return btn
end

-- Create Buttons
local startY = 60
CreateToggleButton(MainFrame,startY,"🎯 AimLock","AimLockEnabled","Auto lock target")
CreateToggleButton(MainFrame,startY+50,"👁️ ESP","ESPEnabled","Show enemy highlight")
CreateToggleButton(MainFrame,startY+100,"🛡️ TeamCheck","TeamCheck","Ignore teammates")
CreateToggleButton(MainFrame,startY+150,"🧱 WallCheck","WallCheck","Lock only visible enemies")
CreateToggleButton(MainFrame,startY+200,"🧠 Prediction","PredictionEnabled","Enable prediction")

-- Slider Function
local function CreateSlider(parent, y, labelText, min, max, valueKey)
    local label = Instance.new("TextLabel", parent)
    label.Position = UDim2.new(0,20,0,y)
    label.Size = UDim2.new(0,parent.AbsoluteSize.X-40,0,20)
    label.Text = labelText..": "..Settings[valueKey]
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(0,0,0)
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left

    local slider = Instance.new("TextButton", parent)
    slider.Position = UDim2.new(0,20,0,y+25)
    slider.Size = UDim2.new(0,parent.AbsoluteSize.X-40,0,20)
    slider.Text = "Slide →"
    slider.BackgroundColor3 = Color3.fromRGB(180,180,180)
    local corner = Instance.new("UICorner", slider)
    corner.CornerRadius = UDim.new(0,10)

    slider.MouseButton1Down:Connect(function()
        local dragging = true
        local function UpdateSlider(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mouseX = input.Position.X
                local screenCenter = Camera.ViewportSize.X/2
                local relative = math.clamp(mouseX - screenCenter, -150, 150)
                if valueKey == "FOVRadius" then
                    Settings[valueKey] = math.floor(relative + 150)
                elseif valueKey == "BulletSpeed" then
                    Settings[valueKey] = math.floor(relative + 50)
                elseif valueKey == "PredictionFactor" then
                    Settings[valueKey] = math.floor((relative + 150)/100*2*100)/100
                end
                label.Text = labelText..": "..Settings[valueKey]
            end
        end
        local moveConn
        moveConn = UserInputService.InputChanged:Connect(UpdateSlider)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                moveConn:Disconnect()
            end
        end)
    end)
end

CreateSlider(MainFrame, startY+260, "FOV", 50, 500, "FOVRadius")
CreateSlider(MainFrame, startY+310, "Bullet Speed", 50, 1000, "BulletSpeed")
CreateSlider(MainFrame, startY+360, "Prediction Factor", 0, 2, "PredictionFactor")

-- ESP + Prediction
local ESPObjects = {}
local ESPMaxDistance = 10000

local function UpdateESP(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        if ESPObjects[player] then
            ESPObjects[player]:Destroy()
            ESPObjects[player] = nil
        end
        return
    end

    if not ESPObjects[player] then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.FillColor = player.Team==LocalPlayer.Team and Color3.fromRGB(0,150,255) or Color3.fromRGB(255,0,0)
        highlight.OutlineColor = Color3.fromRGB(0,0,0)
        highlight.FillTransparency = 0.5
        highlight.Parent = workspace
        ESPObjects[player] = highlight
    else
        local highlight = ESPObjects[player]
        highlight.Adornee = player.Character
        highlight.FillColor = player.Team==LocalPlayer.Team and Color3.fromRGB(0,150,255) or Color3.fromRGB(255,0,0)
    end
end

-- Handle respawn
for _,player in pairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function()
        wait(0.1)
        UpdateESP(player)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        wait(0.1)
        UpdateESP(player)
    end)
end)

-- Prediction
local function PredictPosition(targetPart)
    local targetPos = targetPart.Position
    local velocity = targetPart.AssemblyLinearVelocity or Vector3.new()
    local distance = (targetPos - Camera.CFrame.Position).Magnitude
    local travelTime = distance / Settings.BulletSpeed
    return targetPos + velocity * travelTime * Settings.PredictionFactor
end

-- Smooth AimLock
local AimLine = Drawing.new("Line")
AimLine.Color = Color3.fromRGB(0,255,0)
AimLine.Thickness = 2
AimLine.Transparency = 0.8
AimLine.Visible = true

local function GetClosestTarget()
    local closestDistance = Settings.FOVRadius
    local closestPlayer = nil
    for _,player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if Settings.TeamCheck and player.Team==LocalPlayer.Team then continue end
            local targetPart = player.Character.HumanoidRootPart
            local predictedPos = Settings.PredictionEnabled and PredictPosition(targetPart) or targetPart.Position
            local pos,_ = Camera:WorldToViewportPoint(predictedPos)
            local distance = (Vector2.new(pos.X,pos.Y)-Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)).Magnitude
            if distance < closestDistance then
                if Settings.WallCheck then
                    local ray = Ray.new(Camera.CFrame.Position,(predictedPos-Camera.CFrame.Position).Unit*500)
                    local part,_ = Workspace:FindPartOnRay(ray,LocalPlayer.Character)
                    if part and not part:IsDescendantOf(player.Character) then continue end
                end
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end

local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(0,255,0)
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Radius = Settings.FOVRadius
FOVCircle.Filled = false
FOVCircle.Visible = true

local function SmoothAim(targetPos, speed)
    local camPos = Camera.CFrame.Position
    local newCFrame = CFrame.new(camPos, targetPos)
    Camera.CFrame = Camera.CFrame:Lerp(newCFrame, speed)
end

-- Render Loop
RunService.RenderStepped:Connect(function()
    for _,player in pairs(Players:GetPlayers()) do
        if Settings.ESPEnabled then UpdateESP(player)
        elseif ESPObjects[player] then ESPObjects[player]:Destroy(); ESPObjects[player]=nil end
    end

    if Settings.AimLockEnabled then
        local target = GetClosestTarget()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = Settings.PredictionEnabled and PredictPosition(target.Character.HumanoidRootPart) or target.Character.HumanoidRootPart.Position
            SmoothAim(targetPos,0.15)
            local screenPos,_ = Camera:WorldToViewportPoint(targetPos)
            AimLine.From = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
            AimLine.To = Vector2.new(screenPos.X,screenPos.Y)
            AimLine.Visible = true
        else AimLine.Visible=false end
    else AimLine.Visible=false end

    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
    FOVCircle.Radius = Settings.FOVRadius
end)
