--[=[
Feito pelo Vlg_Daniel01 e RealMidia0800🤑
]=]

-- Instances: 27 | Scripts: 1 | Modules: 0 | Tags: 1
local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Players.vlg_daniel01.PlayerGui.AdminGui
G2L["AdminGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["AdminGui_1"]["Name"] = [[AdminGui]];
G2L["AdminGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Tags
CollectionService:AddTag(G2L["AdminGui_1"], [[main]]);

-- Players.vlg_daniel01.PlayerGui.AdminGui.Toggle
G2L["Toggle_2"] = Instance.new("TextButton", G2L["AdminGui_1"]);
G2L["Toggle_2"]["TextWrapped"] = true;
G2L["Toggle_2"]["BorderSizePixel"] = 0;
G2L["Toggle_2"]["TextSize"] = 15;
G2L["Toggle_2"]["TextScaled"] = true;
G2L["Toggle_2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Toggle_2"]["BackgroundColor3"] = Color3.fromRGB(129, 149, 173);
G2L["Toggle_2"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["Toggle_2"]["Size"] = UDim2.new(0, 50, 0, 50);
G2L["Toggle_2"]["Text"] = [[MENSAGEM ADMIN]];
G2L["Toggle_2"]["Name"] = [[Toggle]];
G2L["Toggle_2"]["Position"] = UDim2.new(0, 8, 0, 8);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Toggle.UIStroke
G2L["UIStroke_3"] = Instance.new("UIStroke", G2L["Toggle_2"]);
G2L["UIStroke_3"]["Thickness"] = 0.5;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel
G2L["Painel_4"] = Instance.new("Frame", G2L["AdminGui_1"]);
G2L["Painel_4"]["BorderSizePixel"] = 0;
G2L["Painel_4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Painel_4"]["Size"] = UDim2.new(0, 306, 0, 156);
G2L["Painel_4"]["Position"] = UDim2.new(0, 264, 0, 40);
G2L["Painel_4"]["Name"] = [[Painel]];
G2L["Painel_4"]["BackgroundTransparency"] = 0.8;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopBar
G2L["TopBar_5"] = Instance.new("Frame", G2L["Painel_4"]);
G2L["TopBar_5"]["BorderSizePixel"] = 0;
G2L["TopBar_5"]["BackgroundColor3"] = Color3.fromRGB(129, 149, 173);
G2L["TopBar_5"]["Size"] = UDim2.new(0, 306, 0, 44);
G2L["TopBar_5"]["Name"] = [[TopBar]];


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopBar.CloseButton
G2L["CloseButton_6"] = Instance.new("TextButton", G2L["TopBar_5"]);
G2L["CloseButton_6"]["TextWrapped"] = true;
G2L["CloseButton_6"]["BorderSizePixel"] = 0;
G2L["CloseButton_6"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["CloseButton_6"]["TextScaled"] = true;
G2L["CloseButton_6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["CloseButton_6"]["BackgroundColor3"] = Color3.fromRGB(157, 0, 0);
G2L["CloseButton_6"]["Size"] = UDim2.new(0, 34, 0, 32);
G2L["CloseButton_6"]["Text"] = [[X]];
G2L["CloseButton_6"]["Name"] = [[CloseButton]];
G2L["CloseButton_6"]["Position"] = UDim2.new(0, 262, 0, 6);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopBar.CloseButton.UIStroke2
G2L["UIStroke2_7"] = Instance.new("UIStroke", G2L["CloseButton_6"]);
G2L["UIStroke2_7"]["Name"] = [[UIStroke2]];


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopBar.CloseButton.UIStroke
G2L["UIStroke_8"] = Instance.new("UIStroke", G2L["CloseButton_6"]);
G2L["UIStroke_8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopBar.Title
G2L["Title_9"] = Instance.new("TextLabel", G2L["TopBar_5"]);
G2L["Title_9"]["TextWrapped"] = true;
G2L["Title_9"]["BorderSizePixel"] = 0;
G2L["Title_9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["Title_9"]["TextScaled"] = true;
G2L["Title_9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Title_9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["Title_9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Title_9"]["BackgroundTransparency"] = 1;
G2L["Title_9"]["Size"] = UDim2.new(0, 190, 0, 44);
G2L["Title_9"]["Text"] = [[MENSAGEM ADMIN]];
G2L["Title_9"]["Name"] = [[Title]];
G2L["Title_9"]["Position"] = UDim2.new(0, 2, 0, 0);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopBar.Title.UIStroke
G2L["UIStroke_a"] = Instance.new("UIStroke", G2L["Title_9"]);



-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter
G2L["TopCenter_b"] = Instance.new("Frame", G2L["Painel_4"]);
G2L["TopCenter_b"]["BorderSizePixel"] = 0;
G2L["TopCenter_b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["TopCenter_b"]["Size"] = UDim2.new(0, 306, 0, 112);
G2L["TopCenter_b"]["Position"] = UDim2.new(0, 0, 0, 44);
G2L["TopCenter_b"]["Name"] = [[TopCenter]];
G2L["TopCenter_b"]["BackgroundTransparency"] = 0.5;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Global
G2L["Global_c"] = Instance.new("TextButton", G2L["TopCenter_b"]);
G2L["Global_c"]["TextWrapped"] = true;
G2L["Global_c"]["BorderSizePixel"] = 0;
G2L["Global_c"]["TextScaled"] = true;
G2L["Global_c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Global_c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["Global_c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["Global_c"]["BackgroundTransparency"] = 0.5;
G2L["Global_c"]["Size"] = UDim2.new(0, 46, 0, 32);
G2L["Global_c"]["Text"] = [[Global]];
G2L["Global_c"]["Name"] = [[Global]];
G2L["Global_c"]["Position"] = UDim2.new(0, 16, 0, 66);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Global.ImageLabel
G2L["ImageLabel_d"] = Instance.new("ImageLabel", G2L["Global_c"]);
G2L["ImageLabel_d"]["BorderSizePixel"] = 0;
G2L["ImageLabel_d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- G2L["ImageLabel_d"]["ImageContent"] = ;
G2L["ImageLabel_d"]["Image"] = [[rbxassetid://7744394226]];
G2L["ImageLabel_d"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
G2L["ImageLabel_d"]["BackgroundTransparency"] = 1;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Global.UIStroke
G2L["UIStroke_e"] = Instance.new("UIStroke", G2L["Global_c"]);
G2L["UIStroke_e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.MensagemBox
G2L["MensagemBox_f"] = Instance.new("TextBox", G2L["TopCenter_b"]);
G2L["MensagemBox_f"]["CursorPosition"] = -1;
G2L["MensagemBox_f"]["Name"] = [[MensagemBox]];
G2L["MensagemBox_f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["MensagemBox_f"]["PlaceholderColor3"] = Color3.fromRGB(127, 127, 127);
G2L["MensagemBox_f"]["BorderSizePixel"] = 0;
G2L["MensagemBox_f"]["TextWrapped"] = true;
G2L["MensagemBox_f"]["TextSize"] = 15;
G2L["MensagemBox_f"]["TextColor3"] = Color3.fromRGB(153, 153, 153);
G2L["MensagemBox_f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["MensagemBox_f"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["MensagemBox_f"]["PlaceholderText"] = [[Escreva Aqui]];
G2L["MensagemBox_f"]["Size"] = UDim2.new(0, 286, 0, 36);
G2L["MensagemBox_f"]["Position"] = UDim2.new(0, 10, 0, 16);
G2L["MensagemBox_f"]["Text"] = [[]];
G2L["MensagemBox_f"]["BackgroundTransparency"] = 0.4;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.MensagemBox.UIStroke
G2L["UIStroke_10"] = Instance.new("UIStroke", G2L["MensagemBox_f"]);
G2L["UIStroke_10"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.MensagemBox.TextLabel
G2L["TextLabel_11"] = Instance.new("TextLabel", G2L["MensagemBox_f"]);
G2L["TextLabel_11"]["TextWrapped"] = true;
G2L["TextLabel_11"]["BorderSizePixel"] = 0;
G2L["TextLabel_11"]["TextScaled"] = true;
G2L["TextLabel_11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextLabel_11"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["TextLabel_11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextLabel_11"]["BackgroundTransparency"] = 1;
G2L["TextLabel_11"]["Size"] = UDim2.new(0, 98, 0, 16);
G2L["TextLabel_11"]["Text"] = [[Messagem Admin]];
G2L["TextLabel_11"]["Position"] = UDim2.new(0, 2, 0, -10);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Server
G2L["Server_12"] = Instance.new("TextButton", G2L["TopCenter_b"]);
G2L["Server_12"]["TextWrapped"] = true;
G2L["Server_12"]["BorderSizePixel"] = 0;
G2L["Server_12"]["TextScaled"] = true;
G2L["Server_12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Server_12"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["Server_12"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["Server_12"]["BackgroundTransparency"] = 0.5;
G2L["Server_12"]["Size"] = UDim2.new(0, 46, 0, 32);
G2L["Server_12"]["Text"] = [[Server]];
G2L["Server_12"]["Name"] = [[Server]];
G2L["Server_12"]["Position"] = UDim2.new(0, 70, 0, 66);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Server.ImageLabel
G2L["ImageLabel_13"] = Instance.new("ImageLabel", G2L["Server_12"]);
G2L["ImageLabel_13"]["BorderSizePixel"] = 0;
G2L["ImageLabel_13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- G2L["ImageLabel_13"]["ImageContent"] = ;
G2L["ImageLabel_13"]["Image"] = [[rbxassetid://9692125126]];
G2L["ImageLabel_13"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
G2L["ImageLabel_13"]["BackgroundTransparency"] = 1;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Server.UIStroke
G2L["UIStroke_14"] = Instance.new("UIStroke", G2L["Server_12"]);
G2L["UIStroke_14"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Enviar
G2L["Enviar_15"] = Instance.new("TextButton", G2L["TopCenter_b"]);
G2L["Enviar_15"]["TextWrapped"] = true;
G2L["Enviar_15"]["BorderSizePixel"] = 0;
G2L["Enviar_15"]["TextScaled"] = true;
G2L["Enviar_15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Enviar_15"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["Enviar_15"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["Enviar_15"]["BackgroundTransparency"] = 0.5;
G2L["Enviar_15"]["Size"] = UDim2.new(0, 94, 0, 32);
G2L["Enviar_15"]["Text"] = [[Enviar]];
G2L["Enviar_15"]["Name"] = [[Enviar]];
G2L["Enviar_15"]["Position"] = UDim2.new(0, 194, 0, 66);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Painel.TopCenter.Enviar.UIStroke
G2L["UIStroke_16"] = Instance.new("UIStroke", G2L["Enviar_15"]);
G2L["UIStroke_16"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Mensagem
G2L["Mensagem_17"] = Instance.new("Frame", G2L["AdminGui_1"]);
G2L["Mensagem_17"]["BorderSizePixel"] = 0;
G2L["Mensagem_17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Mensagem_17"]["Size"] = UDim2.new(0, 308, 0, 38);
G2L["Mensagem_17"]["Position"] = UDim2.new(0, 262, 0, 2);
G2L["Mensagem_17"]["Name"] = [[Mensagem]];
G2L["Mensagem_17"]["BackgroundTransparency"] = 1;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Mensagem.MensagemText
G2L["MensagemText_18"] = Instance.new("TextLabel", G2L["Mensagem_17"]);
G2L["MensagemText_18"]["TextWrapped"] = true;
G2L["MensagemText_18"]["BorderSizePixel"] = 0;
G2L["MensagemText_18"]["TextScaled"] = true;
G2L["MensagemText_18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["MensagemText_18"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["MensagemText_18"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["MensagemText_18"]["BackgroundTransparency"] = 1;
G2L["MensagemText_18"]["Size"] = UDim2.new(0, 306, 0, 16);
G2L["MensagemText_18"]["Text"] = [[User: Hello]];
G2L["MensagemText_18"]["Name"] = [[MensagemText]];
G2L["MensagemText_18"]["Position"] = UDim2.new(0, 2, 0, 10);


-- Players.vlg_daniel01.PlayerGui.AdminGui.Mensagem.MensagemText.UIStroke
G2L["UIStroke_19"] = Instance.new("UIStroke", G2L["MensagemText_18"]);



-- Players.vlg_daniel01.PlayerGui.AdminGui.Mensagem.Base
G2L["Base_1a"] = Instance.new("Frame", G2L["Mensagem_17"]);
G2L["Base_1a"]["BorderSizePixel"] = 0;
G2L["Base_1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Base_1a"]["Size"] = UDim2.new(0, 306, 0, 12);
G2L["Base_1a"]["Position"] = UDim2.new(0, 2, 0, 12);
G2L["Base_1a"]["Name"] = [[Base]];
G2L["Base_1a"]["BackgroundTransparency"] = 1;


-- Players.vlg_daniel01.PlayerGui.AdminGui.Sistema
G2L["Sistema_1b"] = Instance.new("LocalScript", G2L["AdminGui_1"]);
G2L["Sistema_1b"]["Name"] = [[Sistema]];


-- Players.vlg_daniel01.PlayerGui.AdminGui.Sistema
local function C_1b()
    local script = G2L["Sistema_1b"];
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    local player = Players.LocalPlayer
    local adminGui = script.Parent
    
    -- Componentes
    local ToggleBtn = adminGui.Toggle
    local Painel = adminGui.Painel
    local CloseBtn = Painel.TopBar.CloseButton
    local GlobalBtn = Painel.TopCenter.Global
    local ServerBtn = Painel.TopCenter.Server
    local EnviarBtn = Painel.TopCenter.Enviar
    local MensagemBox = Painel.TopCenter.MensagemBox
    local MensagemFrame = adminGui.Mensagem
    local MensagemTemplate = MensagemFrame:WaitForChild("MensagemText")
    
    -- Estado inicial
    MensagemTemplate.Visible = false
    MensagemFrame.Visible = true
    Painel.Visible = false
    adminGui.Enabled = true -- sempre ativo para todos verem mensagens
    
    -- Estado do painel e tipo de envio
    local painelAberto = false
    local envioTipo = nil
    
    -- Tween para abrir/fechar Painel
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local function abrirPainel()
        painelAberto = true
        Painel.Visible = true
        TweenService:Create(Painel, tweenInfo, {BackgroundTransparency = 0.8}):Play()
    end
    
    local function fecharPainel()
        painelAberto = false
        local tween = TweenService:Create(Painel, tweenInfo, {BackgroundTransparency = 1})
        tween:Play()
        tween.Completed:Connect(function()
            Painel.Visible = false
        end)
    end
    
    ToggleBtn.MouseButton1Click:Connect(function()
        if painelAberto then
            fecharPainel()
        else
            abrirPainel()
        end
    end)
    
    CloseBtn.MouseButton1Click:Connect(fecharPainel)
    
    -- Atualizar cores dos botões
    local function atualizarBotoes()
        if envioTipo == "Global" then
            GlobalBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            ServerBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        elseif envioTipo == "Server" then
            GlobalBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            ServerBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            GlobalBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            ServerBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        end
    end
    
    GlobalBtn.MouseButton1Click:Connect(function()
        envioTipo = "Global"
        atualizarBotoes()
    end)
    
    ServerBtn.MouseButton1Click:Connect(function()
        envioTipo = "Server"
        atualizarBotoes()
    end)
    
    -- Mostrar mensagem no Frame
    local function mostrarMensagemTexto(novaMsg, duracao)
        local msgClone = MensagemTemplate:Clone()
        msgClone.Text = novaMsg
        msgClone.Visible = true
        msgClone.TextTransparency = 1
        msgClone.Parent = MensagemFrame
        
        -- Empilhar mensagens
        local padding = 5
        local yOffset = 0
        for _, child in ipairs(MensagemFrame:GetChildren()) do
            if child:IsA("TextLabel") and child.Visible then
                child.Position = UDim2.new(0, 0, 0, yOffset)
                yOffset = yOffset + child.Size.Y.Offset + padding
            end
        end
        
        -- Som (opcional)
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://17208361335"
        sound.Volume = 1
        sound.Parent = msgClone
        sound:Play()
        
        TweenService:Create(msgClone, tweenInfo, {TextTransparency = 0}):Play()
        
        -- Remover depois do tempo
        task.delay(duracao, function()
            local tweenOut = TweenService:Create(msgClone, tweenInfo, {TextTransparency = 1})
            tweenOut:Play()
            tweenOut.Completed:Connect(function()
                msgClone:Destroy()
            end)
            sound:Destroy()
        end)
    end
    
    -- RemoteEvent para mensagens e status de admin
    local msgEvent = ReplicatedStorage:WaitForChild("AdminMensagem")
    
    if not adminGui:GetAttribute("ConexaoReceber") then
        adminGui:SetAttribute("ConexaoReceber", true)
        msgEvent.OnClientEvent:Connect(function(tipo, data, remetente)
            if tipo == "AdminStatus" then
                -- data = true/false
                if data then
                    -- é admin → pode abrir painel
                    ToggleBtn.Visible = true
                else
                    -- não é admin → só vê mensagens
                    ToggleBtn.Visible = false
                    Painel.Visible = false
                end
            elseif tipo == "Global" or tipo == "Server" then
                -- mensagens aparecem sempre
                mostrarMensagemTexto(remetente..": "..data, 8)
            end
        end)
    end
    
    -- Enviar mensagem pro servidor
    EnviarBtn.MouseButton1Click:Connect(function()
        local msg = MensagemBox.Text
        if msg ~= "" and envioTipo then
            msgEvent:FireServer(envioTipo, msg)
            MensagemBox.Text = ""
            atualizarBotoes()
        end
    end)
    
    -- Enviar pressionando Enter
    MensagemBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            EnviarBtn.MouseButton1Click:Wait()
        end
    end)
end;
task.spawn(C_1b);

return G2L["AdminGui_1"], require;
