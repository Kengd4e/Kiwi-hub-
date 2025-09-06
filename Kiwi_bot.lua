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
    FOVRadius = 100
}

--// GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

-- Responsive function
local function ScaleUI(baseSize)
    local screenWidth = Camera.ViewportSize.X
    local screenHeight = Camera.ViewportSize.Y
    return UDim2.new(0, baseSize.X * (screenWidth/1080), 0, baseSize.Y * (screenHeight/1920))
end

-- Main Frame (คลีนแบบ Arceus X)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = ScaleUI(Vector2.new(240, 360))
MainFrame.Position = UDim2.new(0.5,0,0.5,0)
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0,16)

-- Header bar
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1,0,0,40)
Header.BackgroundColor3 = Color3.fromRGB(245,245,245)
local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0,16)

local HeaderLabel = Instance.new("TextLabel", Header)
HeaderLabel.Size = UDim2.new(1,0,1,0)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.Text = "🎮 Arceus X UI"
HeaderLabel.TextColor3 = Color3.fromRGB(0,0,0)
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextSize = 18

-- Lock UI Button
local LockButton = Instance.new("TextButton", Header)
LockButton.Size = UDim2.new(0, 50, 1, -8)
LockButton.Position = UDim2.new(1, -55, 0, 4)
LockButton.Text = "🔒"
LockButton.BackgroundColor3 = Color3.fromRGB(220,220,220)
local lockCorner = Instance.new("UICorner", LockButton)
lockCorner.CornerRadius = UDim.new(0,10)

LockButton.MouseButton1Click:Connect(function()
    MainFrame.Draggable = not MainFrame.Draggable
    LockButton.Text = MainFrame.Draggable and "🔓" or "🔒"
end)

-- Toggle UI Button (แยก)
local ToggleUIButton = Instance.new("TextButton", ScreenGui)
ToggleUIButton.Size = ScaleUI(Vector2.new(50,50))
ToggleUIButton.Position = UDim2.new(0,10,0,10)
ToggleUIButton.Text = "🎮"
ToggleUIButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
ToggleUIButton.AutoButtonColor = true
local toggleCorner = Instance.new("UICorner", ToggleUIButton)
toggleCorner.CornerRadius = UDim.new(0,12)

ToggleUIButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Tooltip
local Tooltip = Instance.new("TextLabel", ScreenGui)
Tooltip.Size = ScaleUI(Vector2.new(180,25))
Tooltip.BackgroundColor3 = Color3.fromRGB(0,0,0)
Tooltip.BackgroundTransparency = 0.5
Tooltip.TextColor3 = Color3.fromRGB(255,255,255)
Tooltip.Text = ""
Tooltip.Visible = false
Tooltip.AnchorPoint = Vector2.new(0,1)
Tooltip.TextSize = 14
Tooltip.Font = Enum.Font.Gotham

-- ฟังก์ชันสร้าง toggle button พร้อม tooltip
local function CreateToggleButton(parent, yPos, text, settingKey, tooltipText)
    local btn = Instance.new("TextButton", parent)
    btn.Size = ScaleUI(Vector2.new(200,30))
    btn.Position = UDim2.new(0,20,0,yPos)
    btn.BackgroundColor3 = Settings[settingKey] and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
    btn.Text = text .. ": " .. (Settings[settingKey] and "ON" or "OFF")
    btn.AutoButtonColor = false
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0,10)

    btn.MouseEnter:Connect(function()
        Tooltip.Text = tooltipText
        Tooltip.Position = UDim2.new(0, btn.AbsolutePosition.X, 0, btn.AbsolutePosition.Y)
        Tooltip.Visible = true
    end)
    btn.MouseLeave:Connect(function()
        Tooltip.Visible = false
    end)

    btn.MouseButton1Click:Connect(function()
        Settings[settingKey] = not Settings[settingKey]
        btn.Text = text .. ": " .. (Settings[settingKey] and "ON" or "OFF")
        btn.BackgroundColor3 = Settings[settingKey] and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
    end)
    return btn
end

-- สร้างปุ่มทั้งหมด
local AimLockButton = CreateToggleButton(MainFrame, 60, "😈 AimLock", "AimLockEnabled", "ล็อคเป้าหมายศัตรูอัตโนมัติ")
local ESPButton = CreateToggleButton(MainFrame, 110, "🙉 ESP", "ESPEnabled", "แสดง highlight ศัตรูแม้เกิดใหม่")
local TeamButton = CreateToggleButton(MainFrame, 160, "👥 TeamCheck", "TeamCheck", "ไม่ล็อคเพื่อนร่วมทีม")
local WallButton = CreateToggleButton(MainFrame, 210, "🧱 WallCheck", "WallCheck", "ล็อคเฉพาะศัตรูที่มองเห็น")

-- FOV Slider
local FOVLabel = Instance.new("TextLabel", MainFrame)
FOVLabel.Position = UDim2.new(0,20,0,260)
FOVLabel.Size = ScaleUI(Vector2.new(200,20))
FOVLabel.Text = "FOV: " .. Settings.FOVRadius
FOVLabel.BackgroundTransparency = 1
FOVLabel.TextColor3 = Color3.fromRGB(0,0,0)
FOVLabel.TextXAlignment = Enum.TextXAlignment.Left
FOVLabel.Font = Enum.Font.Gotham

local FOVSlider = Instance.new("TextButton", MainFrame)
FOVSlider.Position = UDim2.new(0,20,0,285)
FOVSlider.Size = ScaleUI(Vector2.new(200,20))
FOVSlider.Text = "Slide →"
FOVSlider.BackgroundColor3 = Color3.fromRGB(180,180,180)
local sliderCorner = Instance.new("UICorner", FOVSlider)
sliderCorner.CornerRadius = UDim.new(0,10)

FOVSlider.MouseButton1Down:Connect(function()
    local dragging = true
    local conn
    conn = UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local mouseX = input.Position.X
            local screenCenter = Camera.ViewportSize.X/2
            local distance = math.clamp(mouseX - screenCenter, -150, 150)
            Settings.FOVRadius = math.floor(distance + 150)
            FOVLabel.Text = "FOV: "..Settings.FOVRadius
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            conn:Disconnect()
        end
    end)
end)

-- ESP Logic รองรับ respawn
local ESPObjects = {}
local function UpdateESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if not ESPObjects[player] then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = player.Character
            highlight.FillColor = Color3.fromRGB(255,0,0)
            highlight.OutlineColor = Color3.fromRGB(0,0,0)
            highlight.FillTransparency = 0.5
            highlight.Parent = workspace
            ESPObjects[player] = highlight
        else
            ESPObjects[player].Adornee = player.Character
        end
    else
        if ESPObjects[player] then
            ESPObjects[player]:Destroy()
            ESPObjects[player] = nil
        end
    end
end

-- AimLock Logic
local AimLine = Drawing.new("Line")
AimLine.Color = Color3.fromRGB(0,255,0)
AimLine.Thickness = 2
AimLine.Transparency = 0.8
AimLine.Visible = true

local function GetClosestTarget()
    local closestDistance = Settings.FOVRadius
    local closestPlayer = nil
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if Settings.TeamCheck and player.Team == LocalPlayer.Team then continue end
            local pos = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
            if distance < closestDistance then
                if Settings.WallCheck then
                    local ray = Ray.new(Camera.CFrame.Position, (player.Character.HumanoidRootPart.Position - Camera.CFrame.Position).Unit * 500)
                    local part, _ = Workspace:FindPartOnRay(ray, LocalPlayer.Character)
                    if part and not part:IsDescendantOf(player.Character) then continue end
                end
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(0,255,0)
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Radius = Settings.FOVRadius
FOVCircle.Filled = false
FOVCircle.Visible = true

-- Render Loop
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if Settings.ESPEnabled then
            UpdateESP(player)
        elseif ESPObjects[player] then
            ESPObjects[player]:Destroy()
            ESPObjects[player] = nil
        end
    end

    if Settings.AimLockEnabled then
        local target = GetClosestTarget()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
            local screenPos = Camera:WorldToViewportPoint(target.Character.HumanoidRootPart.Position)
            AimLine.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            AimLine.To = Vector2.new(screenPos.X, screenPos.Y)
            AimLine.Visible = true
        else
            AimLine.Visible = false
        end
    else
        AimLine.Visible = false
    end

    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    FOVCircle.Radius = Settings.FOVRadius
end)
