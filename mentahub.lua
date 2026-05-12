setclipboard("https://discord.gg/cHEaWa6t9H")

-- 📊 VISOR HUD - CENTRO SUPERIOR (REFINADO)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer

pcall(function()
    if player:WaitForChild("PlayerGui"):FindFirstChild("AgainHUD") then
        player.PlayerGui.AgainHUD:Destroy()
    end

    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Name = "AgainHUD"
    gui.IgnoreGuiInset = true -- Faz o HUD ignorar a barra superior do Roblox
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    -- AnchorPoint (0.5, 0) coloca o ponto de referência no meio do topo do frame
    frame.AnchorPoint = Vector2.new(0.5, 0)
    frame.Size = UDim2.new(0, 200, 0, 30) 
    -- Posição: 0.5 (Meio da tela) | 10 pixels de distância do topo para ser visível
    frame.Position = UDim2.new(0.5, 0, 0, 10) 
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Thickness = 1.8
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- TEXTO (Centralizado dentro do Frame)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Center -- Centralizado
    label.Parent = frame

    local fps = 0
    local frames = 0
    local last = tick()

    RunService.RenderStepped:Connect(function()
        frames += 1
        if tick() - last >= 1 then
            fps = frames
            frames = 0
            last = tick()
        end
    end)

    RunService.RenderStepped:Connect(function()
        local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        local timeStr = os.date("%H:%M:%S")

        label.Text = timeStr .. " | " .. fps .. " FPS | " .. ping .. "ms"
        
        -- Auto-ajuste de tamanho centralizado
        frame.Size = UDim2.new(0, label.TextBounds.X + 40, 0, 30)
    end)
end)

-- PNG NO PÉ ESQUERDO (TAMANHO VISUAL FIXO)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local IMAGE_ID = "rbxassetid://89062714375517"

local function applyPNG(character)
    local leftFoot = character:FindFirstChild("LeftFoot") or character:FindFirstChild("Left Leg")

    if not leftFoot then
        return
    end

    -- evita duplicar
    if leftFoot:FindFirstChild("FootPNG_GUI") then
        return
    end

    local gui = Instance.new("BillboardGui")
    gui.Name = "FootPNG_GUI"
    gui.Adornee = leftFoot
    gui.AlwaysOnTop = true
    
    -- AJUSTE: Usando Scale para tamanho fixo na tela
    -- O 2.5 e 2.5 controlam o tamanho que você vai ver. 
    -- Se estiver muito grande, diminua para 1.5 ou 2.0.
    gui.Size = UDim2.new(1.5, 0, 1.5, 0) 
    
    -- Mantém a posição correta no pé
    local footSize = leftFoot.Size
    gui.StudsOffset = Vector3.new(0, -footSize.Y * 0.6, -footSize.Z * 0.9)
    
    -- Garante que não suma rápido demais de longe
    gui.DistanceUpperLimit = 1000 
    
    gui.Parent = leftFoot

    local img = Instance.new("ImageLabel")
    img.Size = UDim2.fromScale(0.9, 0.9)
    img.BackgroundTransparency = 1
    img.Image = IMAGE_ID
    img.Parent = gui
end

-- personagem atual
if player.Character then
    applyPNG(player.Character)
end

-- reaplica no respawn
player.CharacterAdded:Connect(function(char)
    task.wait(1)
    applyPNG(char)
end)

-- ✨ AGAIN HUB - WATERMARK FIXA (VERSÃO SLIM + ANTI-SUMIR)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local function CreateWatermark()
    -- 1. CONFIGURAÇÃO DA GUI (RESET ON SPAWN FALSE)
    local screenGui = player.PlayerGui:FindFirstChild("AgainWatermark")
    if screenGui then screenGui:Destroy() end

    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AgainWatermark"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false -- ISSO IMPEDE DE SUMIR NO SPAWN
    screenGui.DisplayOrder = 999
    screenGui.Parent = player.PlayerGui

    -- 2. FRAME DA BORDA (MAIS FINO)
    local borderFrame = Instance.new("Frame", screenGui)
    borderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    borderFrame.Position = UDim2.new(0, 15, 1, -35) -- Subiu um pouco para não cortar
    borderFrame.AutomaticSize = Enum.AutomaticSize.XY 
    
    Instance.new("UICorner", borderFrame).CornerRadius = UDim.new(0, 4)

    local uiGradient = Instance.new("UIGradient", borderFrame)
    uiGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    })

    -- 3. FRAME DO FUNDO (VISOR SLIM)
    local mainFrame = Instance.new("Frame", borderFrame)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    mainFrame.Position = UDim2.new(0, 1, 0, 1) -- Borda mais fina (1px)
    mainFrame.Size = UDim2.new(1, -2, 1, -2)
    mainFrame.BorderSizePixel = 0
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 4)

    local padding = Instance.new("UIPadding", mainFrame)
    padding.PaddingLeft = UDim.new(0, 8) -- Reduzido
    padding.PaddingRight = UDim.new(0, 8) -- Reduzido
    padding.PaddingTop = UDim.new(0, 4) -- Reduzido
    padding.PaddingBottom = UDim.new(0, 4) -- Reduzido

    -- 4. TEXTO (TAMANHO DIMINUÍDO)
    local label = Instance.new("TextLabel", mainFrame)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 10 -- Reduzido de 12 para 10
    label.AutomaticSize = Enum.AutomaticSize.X
    label.Size = UDim2.new(0, 0, 1, 0)
    label.Text = "AGAIN HUB | MENTAZAP AMA | " .. player.Name:upper()

    -- 5. LOOP DE ROTAÇÃO E PROTEÇÃO
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not screenGui.Parent then -- Se algo deletar a GUI, ele limpa a conexão
            connection:Disconnect()
            return
        end
        uiGradient.Rotation = (tick() * 100) % 360
    end)
end

CreateWatermark()

	local SecretKey = "Aurudo"
	local KeyFileName = "vablox_hub.txt" 

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local CoreGui = game:GetService("CoreGui")
	
	local AuthPassed = false

	pcall(function()
		if isfile(KeyFileName) then
			if readfile(KeyFileName) == SecretKey then
				AuthPassed = true
			end
		end
	end)

	if not AuthPassed then
		local KeyGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local TextBox = Instance.new("TextBox")
		local TextButton = Instance.new("TextButton")
		local Title = Instance.new("TextLabel")

		KeyGui.Name = "mentazap"
		KeyGui.Parent = CoreGui
		KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		Frame.Parent = KeyGui
		Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
		Frame.Size = UDim2.new(0, 300, 0, 150)
		Frame.Active = true
		Frame.Draggable = true

		Title.Parent = Frame
		Title.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
		Title.BorderSizePixel = 0
		Title.Size = UDim2.new(1, 0, 0, 30)
		Title.Font = Enum.Font.GothamBold
		Title.Text = "AUTENTICAÇÃO"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000

		TextBox.Parent = Frame
		TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
		TextBox.Size = UDim2.new(0.8, 0, 0, 30)
		TextBox.Font = Enum.Font.Gotham
		TextBox.PlaceholderText = "Digite a chave"
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 14.000

		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.1, 0, 0.7, 0)
		TextButton.Size = UDim2.new(0.8, 0, 0, 30)
		TextButton.Font = Enum.Font.GothamBold
		TextButton.Text = "LOGIN"
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 14.000

		TextButton.MouseButton1Click:Connect(function()
			if TextBox.Text == SecretKey then
				writefile(KeyFileName, SecretKey) 
				AuthPassed = true
				KeyGui:Destroy()
			else
				TextBox.Text = "O mais importante é ser feliz."
				task.wait(1)
				TextBox.Text = ""
			end
		end)

		repeat task.wait() until AuthPassed
	end

	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

	local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
	local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
	local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
	local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

	local Options = Library.Options
	local Toggles = Library.Toggles

Library.ForceCheckbox = true
 var99 = UDim2.fromOffset
 var100 = var99(30, 30)
 var101 = UDim2.fromScale
 var102 = var101(0.5, 1)
 Window = Library:CreateWindow({
    SidebarCompacted = true,
    SearchbarSize = var102,
    Title = '',
    Footer = 'Fling Things and people',
    IconSize = var100,
    SidebarCompactWidth = 50,
    Icon = '113033571661819',
    CornerRadius = 13
})

	local Tabs = {
		Defense = Window:AddTab("Defesa", "shield"),
		Target = Window:AddTab("Alvos", "crosshair"),
		Grab = Window:AddTab("Segurar", "hand"),
		Player = Window:AddTab("Player", "user"),
		Misc = Window:AddTab("misc", "box"),
		Build = Window:AddTab("Addons", "box"),
		["UI Settings"] = Window:AddTab("Configurações", "settings")
	}

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local StarterGui = game:GetService("StarterGui")
	local PS = game:GetService("Players")
	local RS = game:GetService("ReplicatedStorage")
	local R = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local Workspace = workspace
	local Player = PS.LocalPlayer
	local Camera = Workspace.CurrentCamera
	local CE = RS:WaitForChild("CharacterEvents", 10)
	local BeingHeld = Player:WaitForChild("IsHeld", 10)
	local StruggleEvent = CE and CE:WaitForChild("Struggle")

	local function notify(title, content, duration)
		Library:Notify({
			Title = title or "Notification",
			Description = content or "",
			Time = duration or 5,
		})
	end

local UserInputService = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()

-- CONFIGURAÇÕES
local TeleSettings = {
    Active = false,
    Dist = 15,
    Height = 5,
    Speed = 2,
    Items = {}
}

-- Blacklist essencial (Móveis complexos que quebram o jogo)
local BlacklistNames = {"Wheel", "Roda", "Drawer", "Gaveta", "Door", "Porta", "Seat", "Base", "Floor", "Wall"}

local function IsValid(obj)
    if not obj:IsA("BasePart") or obj.Anchored then return false end
    
    local model = obj:FindFirstAncestorOfClass("Model")
    if model and model:FindFirstChild("Humanoid") then return false end
    
    local name = obj.Name:lower()
    for _, blocked in pairs(BlacklistNames) do
        if name:find(blocked:lower()) then return false end
    end

    return true
end

-- --- UI DO HUB ---
local TeleGroup = Tabs.Build:AddLeftGroupbox("Telecinésia Ultimate (Unlimit)")

TeleGroup:AddToggle("ObjAura", { 
    Text = "Ativar Aura", 
    Default = false, 
    Callback = function(v) 
        TeleSettings.Active = v 
        if not v then 
            -- AO DESATIVAR: Devolve a colisão para todos antes de limpar a lista
            for _, obj in pairs(TeleSettings.Items) do
                pcall(function() obj.CanCollide = true end)
            end
            TeleSettings.Items = {} 
        end
    end 
})

TeleGroup:AddSlider("AuraDist", { Text = "Raio", Default = 15, Min = 5, Max = 50, Rounding = 1, Callback = function(v) TeleSettings.Dist = v end })
TeleGroup:AddSlider("AuraHeight", { Text = "Altura", Default = 5, Min = -5, Max = 30, Rounding = 1, Callback = function(v) TeleSettings.Height = v end })
TeleGroup:AddSlider("AuraSpeed", { Text = "Velocidade", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) TeleSettings.Speed = v end })

-- --- 1. CLIQUE PARA PUXAR ---
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or not TeleSettings.Active then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local target = Mouse.Target
        if target and target:IsA("BasePart") and not target.Anchored then
            if not table.find(TeleSettings.Items, target) then
                table.insert(TeleSettings.Items, target)
                pcall(function() 
                    target.CanCollide = false 
                    if setnetworkowner then setnetworkowner(target, game.Players.LocalPlayer) end
                end)
            end
        end
    end
end)

-- --- 2. DETECÇÃO (SEM LIMITE) ---
task.spawn(function()
    local Params = OverlapParams.new()
    Params.FilterType = Enum.RaycastFilterType.Exclude
    
    while true do
        if TeleSettings and TeleSettings.Active then
            local char = game.Players.LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                Params.FilterDescendantsInstances = {char}
                local nearby = workspace:GetPartBoundsInRadius(root.Position, TeleSettings.Dist + 15, Params)
                
                for _, obj in pairs(nearby) do
                    if IsValid(obj) and not table.find(TeleSettings.Items, obj) then
                        -- Puxa sem limite de quantidade agora
                        table.insert(TeleSettings.Items, obj)
                        pcall(function() 
                            obj.CanCollide = false 
                            if setnetworkowner then setnetworkowner(obj, game.Players.LocalPlayer) end
                        end)
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- --- 3. MOVIMENTO E FIX DE COLISÃO ---
game:GetService("RunService").Heartbeat:Connect(function()
    if not TeleSettings or not TeleSettings.Active or #TeleSettings.Items == 0 then return end
    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local t = tick() * TeleSettings.Speed
    
    for i = #TeleSettings.Items, 1, -1 do
        local obj = TeleSettings.Items[i]
        if obj and obj.Parent then
            local dist = (obj.Position - root.Position).Magnitude
            
            -- Se o objeto for "solto" (ficar longe), reativa a colisão IMEDIATAMENTE
            if dist > (TeleSettings.Dist + 40) then
                pcall(function() obj.CanCollide = true end)
                table.remove(TeleSettings.Items, i)
            else
                pcall(function()
                    local angle = (i / #TeleSettings.Items) * math.pi * 2 + t
                    local target = root.Position + Vector3.new(
                        math.cos(angle) * TeleSettings.Dist, 
                        TeleSettings.Height, 
                        math.sin(angle) * TeleSettings.Dist
                    )
                    
                    obj.CFrame = obj.CFrame:Lerp(CFrame.new(target), 0.2)
                    obj.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    
                    -- Enquanto estiver na aura, fica sem colisão para não bugar o player
                    if obj.CanCollide then obj.CanCollide = false end
                end)
            end
        else
            table.remove(TeleSettings.Items, i)
        end
    end
end)



local OptiGroup = Tabs.Build:AddLeftGroupbox("Network & Performance")

local OptiGroup = Tabs.Build:AddLeftGroupbox("Network & Performance")

-- OTIMIZAÇÃO DE REDE (Sem Crash)
OptiGroup:AddToggle("NetBuff", { 
    Text = "Network God Mode", 
    Default = false, 
    Callback = function(v)
        _G.NetBuff = v
        if v then
            -- Em vez de 1e308 (que crasha), usamos o limite estável do motor (math.huge ou 9.9e9)
            -- Desativamos o Throttle para a CPU focar 100% na física
            settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
            
            task.spawn(function()
                while _G.NetBuff do
                    -- Força o raio de simulação a ser maior que o do servidor
                    -- Isso garante que VOCÊ seja o dono da física dos objetos
                    pcall(function()
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 9999)
                        sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 9999)
                    end)
                    task.wait(0.5)
                end
            end)
        else
            settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
            pcall(function()
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 150)
            end)
        end
    end 
})

-- OTIMIZAÇÃO VISUAL (O que não é visto, não é processado)
OptiGroup:AddLabel("⚠️ AVISO: LIMPEZA AGRESSIVA DE RENDER")
OptiGroup:AddButton({
    Text = "FPS Booster (No Lag)",
    Func = function()
        -- 1. Remove o que é "enfeite" e pesa na GPU
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("Decal") or v:IsA("Texture") then
                -- Em vez de destruir (que pode bugar), deixamos transparente
                v.Transparency = 1
            elseif v:IsA("PostEffect") then -- Bloom, Blur, SunRays
                v.Enabled = false
            end
        end
        
        -- 2. Configurações de Iluminação (O segredo do FPS)
        local Lighting = game:GetService("Lighting")
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 2 -- Melhora a visibilidade sem sombras
        
        -- 3. Baixa a qualidade da renderização interna do motor
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        
        Library:Notify("Otimização aplicada. Física Priorizada.")
    end
})

-- --- ATUALIZAÇÃO DO CÓDIGO DE TELECINÉSIA (Sem limites e com fix de colisão) ---
-- (Mantive a lógica anterior, apenas otimizada para trabalhar com o Network Optimizer)

local UserInputService = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()

local TeleSettings = {
    Active = false,
    Dist = 15,
    Height = 5,
    Speed = 2,
    Items = {}
}

local BlacklistNames = {"Wheel", "Roda", "Drawer", "Gaveta", "Door", "Porta", "Seat", "Base", "Floor", "Wall"}

local function IsValid(obj)
    if not obj:IsA("BasePart") or obj.Anchored then return false end
    local model = obj:FindFirstAncestorOfClass("Model")
    if model and model:FindFirstChild("Humanoid") then return false end
    local name = obj.Name:lower()
    for _, blocked in pairs(BlacklistNames) do
        if name:find(blocked:lower()) then return false end
    end
    return true
end

-- 1. DETECÇÃO (SEM LIMITE)
task.spawn(function()
    local Params = OverlapParams.new()
    Params.FilterType = Enum.RaycastFilterType.Exclude
    
    while true do
        if TeleSettings.Active then
            local char = game.Players.LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                Params.FilterDescendantsInstances = {char}
                local nearby = workspace:GetPartBoundsInRadius(root.Position, TeleSettings.Dist + 15, Params)
                
                for _, obj in pairs(nearby) do
                    if IsValid(obj) and not table.find(TeleSettings.Items, obj) then
                        table.insert(TeleSettings.Items, obj)
                        pcall(function() 
                            obj.CanCollide = false 
                            -- Se o Network Optimizer estiver ligado, isso aqui fica instantâneo
                            if setnetworkowner then setnetworkowner(obj, game.Players.LocalPlayer) end
                        end)
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- 2. MOVIMENTO E FIX DE CHÃO
game:GetService("RunService").Heartbeat:Connect(function()
    if not TeleSettings.Active or #TeleSettings.Items == 0 then return end
    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local t = tick() * TeleSettings.Speed
    
    for i = #TeleSettings.Items, 1, -1 do
        local obj = TeleSettings.Items[i]
        if obj and obj.Parent then
            local dist = (obj.Position - root.Position).Magnitude
            
            if dist > (TeleSettings.Dist + 40) then
                pcall(function() obj.CanCollide = true end)
                table.remove(TeleSettings.Items, i)
            else
                pcall(function()
                    local angle = (i / #TeleSettings.Items) * math.pi * 2 + t
                    local target = root.Position + Vector3.new(
                        math.cos(angle) * TeleSettings.Dist, 
                        TeleSettings.Height, 
                        math.sin(angle) * TeleSettings.Dist
                    )
                    
                    obj.CFrame = obj.CFrame:Lerp(CFrame.new(target), 0.2)
                    obj.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    
                    if obj.CanCollide then obj.CanCollide = false end
                end)
            end
        else
            table.remove(TeleSettings.Items, i)
        end
    end
end)


local BubbleSettings = {
    Active = false,
    Radius = 15,
    Power = 120 -- Força ajustada para estabilidade
}



	local function sendHubLoadedMessage()
	local message = "a moda da vez é ser skidder"
	local sent = false

	pcall(function()
		local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
		if chatEvents then
			local say = chatEvents:FindFirstChild("SayMessageRequest")
			if say and typeof(say.FireServer) == "function" then
				say:FireServer(message, "All")
				sent = true
			end
		end
	end)

	if not sent then
		pcall(function()
			StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = message;
				Color = Color3.fromRGB(255, 170, 0);
				Font = Enum.Font.SourceSansBold;
				FontSize = Enum.FontSize.Size18;
				})
			end)
		end
	end
	task.spawn(function() task.wait(1) sendHubLoadedMessage() end)

	local paintPartsBackup = {}
	local paintConnections = {}
	local function deleteAllPaintParts()
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Name == "PaintPlayerPart" then
				local clone = obj:Clone()
				clone.Archivable = true
				paintPartsBackup[obj:GetDebugId()] = { clone = clone, parent = obj.Parent }
				obj:Destroy()
			end
		end
	end
	local function restorePaintParts()
		for _, data in pairs(paintPartsBackup) do
			if data.clone and data.parent then data.clone.Parent = data.parent end
		end
		paintPartsBackup = {}
	end
	local function watchNewPaintParts()
		table.insert(paintConnections, Workspace.DescendantAdded:Connect(function(obj)
			if obj:IsA("BasePart") and obj.Name == "PaintPlayerPart" then
				task.defer(function()
					if obj and obj.Parent then
						local clone = obj:Clone()
						clone.Archivable = true
						paintPartsBackup[obj:GetDebugId()] = { clone = clone, parent = obj.Parent }
						obj:Destroy()
					end
				end)
			end
		end))
	end
	local function disconnectWatchers()
		for _, conn in ipairs(paintConnections) do if conn.Connected then conn:Disconnect() end end
		paintConnections = {}
	end
	local function setTouchQuery(state)
		local char = Workspace:FindFirstChild(Player.Name)
		if not char then return end
		for _, v in ipairs(char:GetChildren()) do
			if v:IsA("Part") or v:IsA("BasePart") then v.CanTouch = state v.CanQuery = state end
		end
	end

	local antiGucciConnection
	local safePosition
	local restoreFrames = 0
	local function spawnBlobman()
		local args = {[1] = "CreatureBlobman", [2] = CFrame.new(0, 5000000, 0), [3] = Vector3.new(0, 60, 0)}
		pcall(function() ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(unpack(args)) end)
		local folder = Workspace:WaitForChild(Player.Name.."SpawnedInToys", 5)
		if folder and folder:FindFirstChild("CreatureBlobman") then
			local blob = folder.CreatureBlobman
			if blob:FindFirstChild("Head") then blob.Head.CFrame = CFrame.new(0, 50000, 0) blob.Head.Anchored = true end
			notify("Success", "Bob ta aqui", 3)
		end
	end
	local function startAntiGucci()
		local character = Player.Character or Player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")
		safePosition = rootPart.Position
		local folder = Workspace:FindFirstChild(Player.Name.."SpawnedInToys")
		local blob = folder and folder:FindFirstChild("CreatureBlobman")
		local seat = blob and blob:FindFirstChild("VehicleSeat")
		if not blob then spawnBlobman() task.wait(1) folder = Workspace:FindFirstChild(Player.Name.."SpawnedInToys") blob = folder and folder:FindFirstChild("CreatureBlobman") seat = blob and blob:FindFirstChild("VehicleSeat") end
		if seat and seat:IsA("VehicleSeat") then rootPart.CFrame = seat.CFrame + Vector3.new(0, 2, 0) seat:Sit(humanoid) end
		humanoid:GetPropertyChangedSignal("Jump"):Connect(function() if humanoid.Jump and humanoid.Sit then restoreFrames = 15 safePosition = rootPart.Position end end)
		if antiGucciConnection then antiGucciConnection:Disconnect() end
		antiGucciConnection = R.Heartbeat:Connect(function()
			if not rootPart or not humanoid then return end
			ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(rootPart, 0)
			if restoreFrames > 0 then rootPart.CFrame = CFrame.new(safePosition) restoreFrames = restoreFrames - 1 end
		end)
		task.spawn(function() while humanoid.Sit do task.wait(1) end task.wait(0.5) rootPart.CFrame = CFrame.new(safePosition) end)
	end
	local function stopAntiGucci()
		if antiGucciConnection then antiGucciConnection:Disconnect() antiGucciConnection = nil end
		local blobFolder = Workspace:FindFirstChild(Player.Name.."SpawnedInToys")
		if blobFolder and blobFolder:FindFirstChild("CreatureBlobman") then blobFolder.CreatureBlobman:Destroy() end
	end

	local antiGucciConnectionTrain
	local safePositionTrain
	local restoreFramesTrain = 0
	local function startAntiGucciTrain()
		local character = Player.Character or Player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")
		safePositionTrain = rootPart.Position
		local folder = workspace.Map.AlwaysHereTweenedObjects
		local train = folder and folder:FindFirstChild("Train")
		local seat
		if train then
	    	for _, d in ipairs(train:GetDescendants()) do
 	       	if d:IsA("Seat") then
  	      	    seat = d
  	       	   break
 	     	  end
	  	  end
		end

		if seat then rootPart.CFrame = seat.CFrame + Vector3.new(0, 2, 0) seat:Sit(humanoid) end
		humanoid:GetPropertyChangedSignal("Jump"):Connect(function() if humanoid.Jump and humanoid.Sit then restoreFramesTrain = 15 safePositionTrain = rootPart.Position end end)
		if antiGucciConnectionTrain then antiGucciConnectionTrain:Disconnect() end
		antiGucciConnectionTrain = R.Heartbeat:Connect(function()
			if not rootPart or not humanoid then return end
			ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(rootPart, 0)
			if restoreFramesTrain > 0 then rootPart.CFrame = CFrame.new(safePositionTrain) restoreFramesTrain = restoreFramesTrain - 1 end
		end)
		task.spawn(function() while humanoid.Sit do task.wait(1) end task.wait(0.5) rootPart.CFrame = CFrame.new(safePositionTrain) end)
	end
	local function stopAntiGucciTrain()
		if antiGucciConnectionTrain then antiGucciConnectionTrain:Disconnect() antiGucciConnectionTrain = nil end
		local trainFolder = workspace.Map.AlwaysHereTweenedObjects
		if trainFolder and trainFolder:FindFirstChild("Train") then ResetPlayer(game.Players.LocalPlayer) end
end

	local DefenseGroup = Tabs.Defense:AddLeftGroupbox("Defense Main")
	local DefenseExtra = Tabs.Defense:AddRightGroupbox("Extra Defense")

	local antiGrabExplosionConn, antiGrabHeldConn, antiGrabStruggleConn, antiGrabHumConn, antiGrabAnchorConn
	local antiGrabRootCF, antiGrabRootPos, antiGrabHardFreeze = nil, nil, false

	local function antiGrabUnfreeze(char)
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.Anchored = false
		if hrp:FindFirstChild("FreezeJoint") then
			hrp.FreezeJoint:Destroy()
		end
	end
	antiGrabHardFreeze = false
	if antiGrabAnchorConn then
		antiGrabAnchorConn:Disconnect()
		antiGrabAnchorConn = nil
	end
	end

	local function antiGrabFreezeInPlace(char)
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	antiGrabRootCF = hrp.CFrame
	antiGrabRootPos = hrp.Position
	antiGrabHardFreeze = true
	if not hrp:FindFirstChild("FreezeJoint") then
		local align = Instance.new("AlignPosition")
		align.Name = "FreezeJoint"
		align.Mode = Enum.PositionAlignmentMode.OneAttachment
		align.MaxForce = 1e6
		align.MaxVelocity = 0
		align.Responsiveness = 200
		local att = Instance.new("Attachment", hrp)
		align.Attachment0 = att
		align.Position = antiGrabRootPos
		align.Parent = hrp
	end
	antiGrabAnchorConn = R.Heartbeat:Connect(function()
		if antiGrabHardFreeze and hrp then
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
			hrp.CFrame = antiGrabRootCF
		end
	end)
	end

	local function antiGrabReconnect()
	local char = Player.Character or Player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")
	local hrp = char:WaitForChild("HumanoidRootPart")
	local fp = hrp:FindFirstChild("FirePlayerPart")
	if fp then fp:Destroy() end
	if antiGrabHumConn then antiGrabHumConn:Disconnect() end
	antiGrabHumConn = hum.Changed:Connect(function(p)
		if p == "Sit" and hum.Sit then
			if not (hum.SeatPart and tostring(hum.SeatPart.Parent) == "CreatureBlobman") then
				hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				hum.Sit = false
			end
		end
	end)
	end

	local autoStruggleConn = nil

	DefenseGroup:AddToggle("AntiGrabObsidian", {
		Text = "Anti Grab",
		Default = false,
		Callback = function(Value)
			local RunService = game:GetService("RunService")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local localPlayer = game:GetService("Players").LocalPlayer
			

			local Struggle = ReplicatedStorage:FindFirstChild("CharacterEvents") and ReplicatedStorage.CharacterEvents:FindFirstChild("Struggle")

			if Value then

				if autoStruggleConn then autoStruggleConn:Disconnect() end
				
				autoStruggleConn = RunService.Heartbeat:Connect(function()
					local character = localPlayer.Character
					if character and character:FindFirstChild("Head") then
						local head = character.Head
						

						if head:FindFirstChild("PartOwner") then
							
						
							task.spawn(function()
								
								if Struggle then Struggle:FireServer(localPlayer) end
								

								pcall(function()
									ReplicatedStorage.GameCorrectionEvents.StopAllVelocity:FireServer()
								end)
								

								for _, part in pairs(character:GetChildren()) do
									if part:IsA("BasePart") then
										part.Anchored = true
									end
								end
								
								
								local isHeld = localPlayer:FindFirstChild("IsHeld")
								while isHeld and isHeld.Value do
									task.wait()
								end
								

								for _, part in pairs(character:GetChildren()) do
									if part:IsA("BasePart") then
										part.Anchored = false
									end
								end
							end)
						end
					end
				end)
			else

				if autoStruggleConn then 
					autoStruggleConn:Disconnect() 
					autoStruggleConn = nil 
				end
				

				local char = localPlayer.Character
				if char then
					for _, part in pairs(char:GetChildren()) do
						if part:IsA("BasePart") then
							part.Anchored = false
						end
					end
				end
			end
		end
	})

	local antiBlob1T=false
	local function antiBlob1F()
		antiBlob1T=true
		workspace.DescendantAdded:Connect(function(toy)
			if toy.Name=="CreatureBlobman" and antiBlob1T then
				toy.LeftDetector:Destroy()
				toy.RightDetector:Destroy()
			end
		end)
	end
	DefenseGroup:AddToggle("AntiBlobmanToggle", {
	Text="Anti Blobman", 
	Default=false,
	Callback=function(on)
		if on then antiBlob1F() else antiBlob1T=false end
	end
	})

	local antiExplodeT=false
	local function antiExplodeF()
		antiExplodeT=true
		local char=Player.Character
		if not char then return end
		local hrp=char:WaitForChild("HumanoidRootPart")
		workspace.ChildAdded:Connect(function(model)
			if model.Name=="Part" and antiExplodeT then
				local mag=(model.Position-hrp.Position).Magnitude
				if mag<=20 then
					hrp.Anchored=true
					wait(0.01)
					while char["Right Arm"].RagdollLimbPart.CanCollide do wait(0.001) end
					hrp.Anchored=false
				end
			end
		end)
	end
	DefenseGroup:AddToggle("AntiExplosionToggle", {
	Text="Anti Explosão", 
	Default=false,
	Callback=function(on)
		if on then antiExplodeF() else antiExplodeT=false end
	end
	})

	local hookBurnConn
	local function hookBurn(char)
		local hum = char:WaitForChild("Humanoid")
		local hrp = char:WaitForChild("HumanoidRootPart")
		char.PrimaryPart = hrp
		if hookBurnConn then hookBurnConn:Disconnect() end
		hookBurnConn = hum.FireDebounce.Changed:Connect(function(isBurning)
			if isBurning then
				local me = char
				local oldCF = hrp.CFrame
				local plots = workspace:FindFirstChild("Plots")
				if plots and plots:FindFirstChild("Plot2") then
					local plot2 = plots.Plot2
					local barrier = plot2:FindFirstChild("Barrier")
					local pb = barrier and barrier:FindFirstChild("PlotBarrier")
					if pb and pb:IsA("BasePart") then
						local safeCF = pb.CFrame * CFrame.new(0, 6, 0)
						me:SetPrimaryPartCFrame(safeCF)
						task.wait(0.3)
						local firePart = me:FindFirstChild("FirePlayerPart", true)
						if firePart then
							for _, obj in ipairs(firePart:GetChildren()) do
								if obj:IsA("Sound") then obj:Stop() end
								if obj:IsA("Light") or obj:IsA("ParticleEmitter") then obj.Enabled = false end
							end
							if firePart:FindFirstChild("CanBurn") then firePart.CanBurn.Value = false end
							if hum:FindFirstChild("FireDebounce") then hum.FireDebounce.Value = false end
						end
						task.wait(0.6)
						if me and me.PrimaryPart then me:SetPrimaryPartCFrame(oldCF) end
					end
				end
			end
		end)
	end
	DefenseGroup:AddToggle("AntiBurnToggle", {
		Text = "Anti Fogo",
		Default = false,
		Callback = function(on)
			_G.AntiFogo = on
			--if on then hookBurn(Player.Character) elseif hookBurnConn then hookBurnConn:Disconnect() end
		end
	})

	local antiVoidConn
	local VOID_THRESHOLD = -50
	local SAFE_HEIGHT = 100
	DefenseGroup:AddToggle("AntiVoidToggle", {
	Text = "Anti Void",
	Default = false,
	Callback = function(on)
		if on then
			if antiVoidConn then antiVoidConn:Disconnect() end
			antiVoidConn = R.Heartbeat:Connect(function()
				local char = Player.Character
				if char and char.PrimaryPart then
				local pos = char.PrimaryPart.Position
				if pos.Y < VOID_THRESHOLD then
					local safePos = Vector3.new(pos.X, pos.Y + SAFE_HEIGHT, pos.Z)
					char:SetPrimaryPartCFrame(CFrame.new(safePos))
					char.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
				end
				end
			end)
		else
			if antiVoidConn then antiVoidConn:Disconnect() antiVoidConn = nil end
		end
	end
	})

	local antiStickyT = false
	DefenseGroup:AddToggle("AntiStickyToggle", {
	Text = "Anti Shuriken",
	Default = false,
	Callback = function(Value)
		antiStickyT = Value
		if Player.PlayerScripts:FindFirstChild("StickyPartsTouchDetection") then
			Player.PlayerScripts.StickyPartsTouchDetection.Disabled = Value
		end
	end,
	})

	local createGrabLineCopy, extendGrabLineCopy
	local grabFolder = ReplicatedStorage:FindFirstChild("GrabEvents")
	if grabFolder then
		local originalCreate = grabFolder:FindFirstChild("CreateGrabLine")
		local originalExtend = grabFolder:FindFirstChild("ExtendGrabLine")
		if originalCreate then createGrabLineCopy = originalCreate:Clone() end
		if originalExtend then extendGrabLineCopy = originalExtend:Clone() end
	end
	DefenseGroup:AddToggle("AntiLagToggle", {
	Text = "Anti Lag",
	Default = false,
	Callback = function(Value)
		if Value then
			local grabFolder = ReplicatedStorage:FindFirstChild("GrabEvents")
			if grabFolder then
				local create = grabFolder:FindFirstChild("CreateGrabLine")
				local extend = grabFolder:FindFirstChild("ExtendGrabLine")
				if create and create:IsA("RemoteEvent") then create:Destroy() end
				if extend and extend:IsA("RemoteEvent") then extend:Destroy() end
			end
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("Beam") or v.Name:lower():find("line") then v:Destroy() end
			end
		else
			local grabFolder = ReplicatedStorage:FindFirstChild("GrabEvents")
			if grabFolder then
				if createGrabLineCopy and not grabFolder:FindFirstChild("CreateGrabLine") then
				local restoredCreate = createGrabLineCopy:Clone()
				restoredCreate.Parent = grabFolder
				end
				if extendGrabLineCopy and not grabFolder:FindFirstChild("ExtendGrabLine") then
				local restoredExtend = extendGrabLineCopy:Clone()
				restoredExtend.Parent = grabFolder
				end
			end
		end
	end,
	})

	DefenseExtra:AddToggle("PaintDeleteToggle", {
		Text = "Anti Pintura",
		Default = false,
		Callback = function(state)
			if state then deleteAllPaintParts() watchNewPaintParts() setTouchQuery(false)
			else restorePaintParts() disconnectWatchers() setTouchQuery(true) end
		end
	})

	local autoGucciActive =  false

	DefenseExtra:AddToggle("AutoGucciToggle", {
		Text = "Anti Gucci (Blobman)",
		Default = false,
		Callback = function(Value)
			autoGucciActive = Value

			if Value then
				startAntiGucci()
				notify("system", "gucci ativado (monitorando)", 3)

				task.spawn(function()
					while autoGucciActive do
						local toysFolder = Workspace:FindFirstChild(Player.Name .. "SpawnedInToys")
						local blobExists = toysFolder and toysFolder:FindFirstChild("CreatureBlobman")

						if not blobExists then
							stopAntiGucci() 
							spawnBlobman() 
							notify("System", "bobman perdido", 3)

							local retries = 0
							repeat
								task.wait(0.2)
								retries = retries + 1
								toysFolder = Workspace:FindFirstChild(Player.Name .. "SpawnedInToys")
							until (toysFolder and toysFolder:FindFirstChild("CreatureBlobman")) or retries > 25 or not autoGucciActive

							if autoGucciActive and toysFolder and toysFolder:FindFirstChild("CreatureBlobman") then
								startAntiGucci()
								notify("System", "blobman apareceu magicamente.", 3)
							end
						end
						task.wait(0.5) 
					end
				end)
			else
				autoGucciActive = false
				stopAntiGucci()
				notify("System", "gucci desativado.", 3)
			end
		end
	})

	local autoGucciActiveTrain =  false

	DefenseExtra:AddToggle("AutoGucciToggle", {
		Text = "Anti Gucci (Trem)",
		Default = false,
		Callback = function(Value)
			autoGucciActiveTrain = Value

			if Value then
				startAntiGucciTrain()
				notify("system", "Gucci ativo (monitorando)", 3)

				task.spawn(function()
					while autoGucciActiveTrain do
						local trainFolder = workspace.Map.AlwaysHereTweenedObjects
						local trainExists = trainFolder and trainFolder:FindFirstChild("Train")

						if not trainExists then
							stopAntiGucciTrain() 
							notify("System", "Trem perdido", 3)

							local retries = 0
							repeat
								task.wait(0.2)
								retries = retries + 1
								trainFolder = workspace.Map.AlwaysHereTweenedObjects
							until (trainFolder and trainFolder:FindFirstChild("Train")) or retries > 25 or not autoGucciActiveTrain

							if autoGucciActiveTrain and trainFolder and trainFolder:FindFirstChild("Train") then
								startAntiGucciTrain()
								notify("System", "Trem apareceu magicamente.", 3)
							end
						end
						task.wait(0.5) 
					end
				end)
			else
				autoGucciActiveTrain = false
				stopAntiGucciTrain()
				notify("System", "Gucci desligado.", 3)
			end
		end
	})


	DefenseExtra:AddToggle("AntiInputLag", {
		Text = "Anti Input Lag",
		Default = false,
		Callback = function(Value)
			if Value then
				_G.AntiInputLag = true

				task.spawn(function()
					local plr = game.Players.LocalPlayer
					local char = plr.Character
					local hrp = char and char:FindFirstChild("HumanoidRootPart")
					if not hrp then return end

					local ToyName = "FoodHamburger"
					local RS = game:GetService("ReplicatedStorage")
					local Workspace = game:GetService("Workspace")
					local SpawnRemote = RS.MenuToys.SpawnToyRemoteFunction

					while _G.AntiInputLag do
						local toysFolder = Workspace:FindFirstChild(plr.Name.."SpawnedInToys")
						local burger = toysFolder and toysFolder:FindFirstChild(ToyName)

						if not burger then
							task.spawn(function()
								pcall(function()
									local spawnCF = hrp.CFrame * CFrame.new(0, 5, 0)
									SpawnRemote:InvokeServer(ToyName, spawnCF, Vector3.new(0,0,0))
								end)
							end)
							
							local startWait = tick()
							repeat 
								game:GetService("RunService").Heartbeat:Wait()
								toysFolder = Workspace:FindFirstChild(plr.Name.."SpawnedInToys")
								burger = toysFolder and toysFolder:FindFirstChild(ToyName)
							until burger or tick() - startWait > 1 or not _G.AntiInputLag
						end

						if burger and burger.Parent then
							local holdPart = burger:FindFirstChild("HoldPart")
							
							if holdPart then
								local holdingPlayer = holdPart:FindFirstChild("HoldingPlayer") and holdPart.HoldingPlayer.Value

								if holdingPlayer and holdingPlayer ~= plr then
									pcall(function()
										holdPart.DropItemRemoteFunction:InvokeServer(
											burger,
											hrp.CFrame * CFrame.new(0, 2000, 0),
											Vector3.new(0,0,0)
										)
									end)
									burger:Destroy()
								else
									pcall(function()
										holdPart.HoldItemRemoteFunction:InvokeServer(burger, char)
									end)
									task.wait()
									
									pcall(function()
										holdPart.DropItemRemoteFunction:InvokeServer(
											burger,
											hrp.CFrame * CFrame.new(0, 2000, 0),
											Vector3.new(0,0,0)
										)
									end)
									task.wait()
								end
							end
						end
					end
				end)
			else
				_G.AntiInputLag = false
			end
		end
	})

	local tpActive = false
	DefenseExtra:AddToggle("ShurikenAntiKick", {
		Text = "Anti Kick",
		Default = false,
		Callback = function(Value)
			_G.ShurikenAntiKick = Value

			local function ClearKunai()
				local plr = game.Players.LocalPlayer
				local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
				local destroyrem = game.ReplicatedStorage:FindFirstChild("MenuToys") and game.ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")
				
				if inv and destroyrem then
					for _, v in pairs(inv:GetChildren()) do
						if v.Name == "AntiKick" or v.Name == "NinjaShuriken" then
							pcall(function() destroyrem:FireServer(v) end)
						end
					end
				end
			end

			if Value then
				task.spawn(function()
					local plr = game.Players.LocalPlayer
					local ReplicatedStorage = game:GetService("ReplicatedStorage")
					
					local setOwner = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
					local stickyEvent = ReplicatedStorage:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
					local spawnRemote = ReplicatedStorage.MenuToys.SpawnToyRemoteFunction
					local destroyrem = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
					local canSpawn = plr:WaitForChild("CanSpawnToy")

					local function getHRP()
						if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
							return plr.Character.HumanoidRootPart
						else
							local character = plr.CharacterAdded:Wait()
							return character:WaitForChild("HumanoidRootPart")
						end
					end

					local function CheckForHome()
						if not workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then 
							return false
						end
						for _, v in pairs(workspace.Plots:GetChildren()) do
							local sign = v:FindFirstChild("PlotSign")
							local owners = sign and sign:FindFirstChild("ThisPlotsOwners")
							if owners then
								for _, b in pairs(owners:GetChildren()) do
									if b.Value == plr.Name then
										local folder = workspace.PlotItems:FindFirstChild(v.Name)
										if folder then return true, folder end
									end
								end
							end
						end
						return false
					end

					local function StickKunai(kunai)
						if not kunai or not kunai:FindFirstChild("StickyPart") then return end
						local currentHRP = getHRP()
						if not currentHRP then return end
						
						if kunai:FindFirstChild("SoundPart") then
							if not kunai.SoundPart:FindFirstChild("PartOwner") or kunai.SoundPart.PartOwner.Value ~= plr.Name then 
								setOwner:FireServer(kunai.SoundPart, kunai.SoundPart.CFrame)
							end
						end
						
						local firePart = currentHRP:FindFirstChild("FirePlayerPart") or currentHRP:WaitForChild("FirePlayerPart", 5)
						if firePart then
							stickyEvent:FireServer(
								kunai.StickyPart,
								firePart,
								CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(90),math.rad(90))
							)
						end
						
						for _, obj in pairs(kunai:GetChildren()) do
							if obj.Name == "Pyramid" then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false; obj.Transparency = 0
								if not obj:FindFirstChild("Highlight") then
									local high = Instance.new("Highlight", obj)
									high.FillColor = Color3.fromRGB(0, 0, 0)
								end
							elseif obj.Name == "Main" then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false; obj.Transparency = 0
								if not obj:FindFirstChild("Highlight") then
									local high = Instance.new("Highlight", obj)
									high.FillColor = Color3.fromRGB(255, 255, 255)
								end
							elseif obj:IsA("BasePart") then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false; obj.Transparency = 1
							end
						end
					end

					local function SpawnToy(name)
						local t = tick()
						while not canSpawn.Value do
							if not _G.ShurikenAntiKick or tick() - t > 5 then return nil end
							task.wait(0.1)
						end

						local currentHRP = getHRP()
						if currentHRP then
							task.spawn(function()
								pcall(function()
									spawnRemote:InvokeServer(name, currentHRP.CFrame * CFrame.new(0, 12, 20), Vector3.new(0,0,0))
								end)
							end)
						end
						
						local boolik, house = CheckForHome()
						local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
						
						if boolik and house then 
							return house:WaitForChild(name, 2)
						elseif not workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) and inv then 
							return inv:WaitForChild(name, 2)
						end
						return nil
					end

					while _G.ShurikenAntiKick do 
						task.wait(0.005)

						if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then 
							continue 
						end
						
						local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
						local kunai = inv and inv:FindFirstChild("NinjaShuriken")
						
						if workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then 
							local boolik, house = CheckForHome()
							if boolik and house and workspace.Plots:FindFirstChild(house.Name) then
								local sign = workspace.Plots[house.Name]:FindFirstChild("PlotSign")
								if sign and sign.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89 then 
									kunai = SpawnToy("NinjaShuriken")
									if kunai == nil then continue end
									kunai.Name = "AntiKick" 
									StickKunai(kunai)
								end
							end
						end
						
						if not kunai then
							if workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then continue end 
							kunai = SpawnToy("NinjaShuriken")
							if kunai == nil then continue end 
							kunai.Name = "AntiKick"
							if not kunai then continue end 
						end
						
						repeat
							if kunai and kunai:FindFirstChild("StickyPart") and kunai.StickyPart.CanTouch == true then
								StickKunai(kunai)
								kunai.Name = "AntiKick"
							end
							task.wait(0.3)
						until not kunai or not _G.ShurikenAntiKick
							or not kunai:FindFirstChild("StickyPart")
							or kunai.StickyPart.CanTouch == false 
							or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") 
							or not kunai:FindFirstChild("StickyPart") 
							or (plr.Character.HumanoidRootPart.Position - kunai.StickyPart.Position).Magnitude >= 20

						if not kunai or not kunai:FindFirstChild("StickyPart") or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or (plr.Character.HumanoidRootPart.Position - kunai.StickyPart.Position).Magnitude >= 20 then 
							ClearKunai()
						end 
						
						pcall(function()
							repeat
								task.wait(0.05)
							until not _G.ShurikenAntiKick or not plr.Character or not plr.Character:FindFirstChild("Humanoid") or not kunai or not kunai:FindFirstChild("StickyPart") or not kunai.StickyPart:FindFirstChild("StickyWeld") or not kunai.StickyPart.StickyWeld.Part1
							
							if not kunai or not kunai:FindFirstChild("StickyPart") or (plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health <= 0) or not kunai["StickyPart"]:FindFirstChild("StickyWeld").Part1 then 
								ClearKunai()
							end
						end)
					end
				end)
			else
				_G.ShurikenAntiKick = false
				ClearKunai()
			end
		end
	})

	DefenseExtra:AddToggle("LoopTP", {
		Text = "Loop TP",
		Default = false,
		Callback = function(Value)
			tpActive = Value
			local char = Player.Character or Player.CharacterAdded:Wait()
			local hrp = char:WaitForChild("HumanoidRootPart")
			local hum = char:FindFirstChildOfClass("Humanoid")
			if Value then
				if hum then hum.PlatformStand = true end
				task.spawn(function()
					while tpActive and hrp do
						local x = math.random(-500, 500)
						local y = math.random(30, 480)
						local z = math.random(-500, 500)
						hrp.CFrame = CFrame.new(x, y, z)
						task.wait(0.03)
					end
				end)
			else
				if hum then hum.PlatformStand = false end
			end
		end,
	})

	local TargetGroup = Tabs.Target:AddLeftGroupbox("Target Interaction")
	local BlobGroup = Tabs.Target:AddRightGroupbox("Blobman Control")
	local WhitelistGroup = Tabs.Target:AddRightGroupbox("whitelist")

	local selectedKickPlayer = nil
	local kickLoopEnabled = false
	local kickLoopConnection = nil
	local savedKickPos = nil
	local currentKickTargetChar = nil 

	local function getPlayerList()
		local list = {}
		for _, plr in ipairs(PS:GetPlayers()) do
			if plr ~= Player then
				table.insert(list, plr.DisplayName .. " (" .. plr.Name .. ")")
			end
		end
		return list
	end

	local function getPlayerFromSelection(selection)
		if not selection then return nil end
		local username = selection:match("%((.-)%)")
		if username then
			return PS:FindFirstChild(username)
		end
		return nil
	end

	TargetGroup:AddDropdown("KickPlayerDropdown", {
		Values = getPlayerList(),
		Default = 1,
		Multi = false,
		Text = "selecione o player pra dar kick no corno",
		Callback = function(Value)
			selectedKickPlayer = getPlayerFromSelection(Value)
		end,
	})

	TargetGroup:AddButton({
		Text = "atualizar lista de players",
		Func = function()
			Options.KickPlayerDropdown:SetValues(getPlayerList())
			Options.KickPlayerDropdown:SetValue(nil)
			selectedKickPlayer = nil
		end
	})

TargetGroup:AddToggle("LoopKickToggle", {
    Text = "Kick (Click massivo)",
    Default = false,
    Callback = function(on)
        kickLoopEnabled = on
        
        local target = selectedKickPlayer
        if on and not target then
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            return
        end
        
        if not on then
            kickLoopEnabled = false
            return
        end
        
        task.spawn(function()
            local RS = game:GetService("ReplicatedStorage")
            local RunService = game:GetService("RunService")
            local GE = RS:WaitForChild("GrabEvents")
            
            local myChar = Player.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            local savedPos = myRoot.CFrame
            local dragging = false
            local grabStartTime = 0
            
            while kickLoopEnabled do
                if not target or not target.Parent then
                    kickLoopEnabled = false
                    if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
                    break
                end
                
                local tChar = target.Character
                local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
                local tHum = tChar and tChar:FindFirstChild("Humanoid")
                
                myChar = Player.Character
                myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                
                if tRoot and tHum and tHum.Health > 0 and myRoot then
                    tRoot.AssemblyLinearVelocity = Vector3.zero
                    tRoot.AssemblyAngularVelocity = Vector3.zero
                    tRoot.Velocity = Vector3.zero
                    
                    if not dragging then
                        myRoot.CFrame = tRoot.CFrame
                        myRoot.Velocity = Vector3.zero
                        
                        pcall(function()
                            tHum.PlatformStand = true
                            tHum.Sit = true
                            GE.SetNetworkOwner:FireServer(tRoot, myRoot.CFrame)
                            GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                        end)
                        
                        if grabStartTime == 0 then grabStartTime = tick() end
                        if tick() - grabStartTime > 0.35 then
                            dragging = true
                            grabStartTime = 0
                        end
                    else
                        myRoot.CFrame = savedPos
                        myRoot.Velocity = Vector3.zero
                        
                        local lockPos = savedPos * CFrame.new(0, 17, 0)
                        
                        tRoot.CFrame = lockPos
                        tRoot.Velocity = Vector3.zero
                        tRoot.RotVelocity = Vector3.zero
                        
                        tHum.PlatformStand = true
                        tHum.Sit = false
                        
                        pcall(function()
                            GE.SetNetworkOwner:FireServer(tRoot, lockPos)
                            GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                            GE.DestroyGrabLine:FireServer(tRoot)
                            GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                        end)
                    end
                else
                    dragging = false
                    grabStartTime = 0
                    if myRoot then
                        myRoot.CFrame = savedPos  -- LINHA CORRIGIDA
                        myRoot.Velocity = Vector3.zero
                    end
                end
                
                RunService.Heartbeat:Wait()
            end
            
            if myRoot then
                myRoot.CFrame = savedPos
                myRoot.Velocity = Vector3.zero
            end
        end)
    end
})

	TargetGroup:AddToggle("LoopKillToggle", {
		Text = "matar em loop",
		Default = false,
		Callback = function(on)
			loopKillEnabled = on
			if on then
				local target = selectedKickPlayer
				if not target then 
					notify("System", "seleciona o alvo primeiro animal", 3)
					Toggles.LoopKickToggle:SetValue(false)
					return 
				end

				task.spawn(function()
					local RS = game:GetService("ReplicatedStorage")
					local RunService = game:GetService("RunService")
					local GE = RS:WaitForChild("GrabEvents")
					
					while loopKillEnabled do
						if not target or not target.Parent or not target.Character then
							loopKillEnabled = false
							Toggles.LoopKillToggle:SetValue(false)
							break
						end

						local myChar = Player.Character
						local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
						
						local tChar = target.Character
						local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
						local tHum = tChar and tChar:FindFirstChild("Humanoid")

						if tRoot and tHum and tHum.Health > 0 and myRoot then
							
							local currentPos = myRoot.CFrame

							local attackStart = tick()
							while tick() - attackStart < 0.35 do
								if not loopKillEnabled or not tRoot.Parent then break end
								
								myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 2)
								myRoot.Velocity = Vector3.zero
								
								pcall(function()
									GE.SetNetworkOwner:FireServer(tRoot, myRoot.CFrame)
									
									tHum:ChangeState(Enum.HumanoidStateType.Dead)
									tHum.Health = 0
									
									GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
									GE.DestroyGrabLine:FireServer(tRoot)
								end)
								
								RunService.Heartbeat:Wait()
							end
							
							if myRoot then
								myRoot.CFrame = currentPos
								myRoot.Velocity = Vector3.zero
							end
							
							task.wait(1.2) 
						else
							task.wait(0.5)
						end
					end
					
					local char = Player.Character
					local root = char and char:FindFirstChild("HumanoidRootPart")
					if root then root.Velocity = Vector3.zero end
				end)
			else
				loopKillEnabled = false
			end
		end
	})

TargetGroup:AddToggle("LoopKickToggle", {
    Text = "Loop Kick (click + bob)",
    Default = false,
    Callback = function(on)
        kickLoopEnabled = on
        
        local target = selectedKickPlayer
        if on and not target then 
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            return 
        end

        local char = Player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local seat = hum and hum.SeatPart

        if on and (not seat or seat.Parent.Name ~= "CreatureBlobman") then
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            return
        end

        if not on then 
            kickLoopEnabled = false 
            return 
        end

        task.spawn(function()
            local RS = game:GetService("ReplicatedStorage")
            local GE = RS:WaitForChild("GrabEvents")
            local RunService = game:GetService("RunService")
            
            local blob = seat.Parent
            local blobRoot = blob:FindFirstChild("HumanoidRootPart") or blob.PrimaryPart
            local scriptObj = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
            
            local CG = scriptObj and scriptObj:FindFirstChild("CreatureGrab")
            local CD = scriptObj and scriptObj:FindFirstChild("CreatureDrop")
            
            local R_Det = blob:FindFirstChild("RightDetector")
            local R_Weld = R_Det and (R_Det:FindFirstChild("RightWeld") or R_Det:FindFirstChildWhichIsA("Weld"))
            
            local SavedPos = blobRoot.CFrame 
            
            local tChar = target.Character
            local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")

            if tRoot and blobRoot then
                local bringStart = tick()
                while tick() - bringStart < 0.35 do
                    if not kickLoopEnabled then break end
                    
                    blobRoot.CFrame = tRoot.CFrame
                    blobRoot.Velocity = Vector3.zero
                    
                    pcall(function()
                        if CG and R_Det then CG:FireServer(R_Det, tRoot, R_Weld) end
                        GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                        GE.SetNetworkOwner:FireServer(tRoot, blobRoot.CFrame)
                    end)
                    RunService.Heartbeat:Wait()
                end
                
                blobRoot.CFrame = SavedPos
                blobRoot.Velocity = Vector3.zero
                task.wait(0.05)
            end

            local packetTimer = 0
            
            while kickLoopEnabled do
                if not target or not target.Parent or not target.Character then
                    break
                end

                local tChar = target.Character
                local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
                local tHum = tChar and tChar:FindFirstChild("Humanoid")

                if tRoot and tHum and tHum.Health > 0 and blobRoot then
                    
                    blobRoot.CFrame = SavedPos
                    blobRoot.Velocity = Vector3.zero
                    
                    local lockPos = SavedPos * CFrame.new(0, 23, 0)
                    
                    tRoot.CFrame = lockPos
                    tRoot.Velocity = Vector3.zero
                    tRoot.RotVelocity = Vector3.zero
                    
                    if tick() - packetTimer > 0.05 then
                        packetTimer = tick()
                        pcall(function()
                            tHum.PlatformStand = true
                            tHum.Sit = true
                            
                            GE.SetNetworkOwner:FireServer(tRoot, lockPos)
                            
                            if R_Det then
                                local weld = R_Det:FindFirstChild("RightWeld") or R_Det:FindFirstChildWhichIsA("Weld")
                                if weld then CD:FireServer(weld) end
                            end
                            GE.DestroyGrabLine:FireServer(tRoot)
                            
                            if R_Det then CG:FireServer(R_Det, tRoot, R_Weld) end
                            GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                        end)
                    end
                else
                    blobRoot.CFrame = SavedPos
                    blobRoot.Velocity = Vector3.zero
                end
                
                if not kickLoopEnabled then break end
                RunService.Heartbeat:Wait()
            end
            
            kickLoopEnabled = false
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            
            if blobRoot then
                blobRoot.CFrame = SavedPos
                blobRoot.Velocity = Vector3.zero
            end
        end)
    end
})

	local loopKickDualActive = false
	TargetGroup:AddToggle("DualHandLoopKick", {
		Text = "Loop Kick",
		Default = false,
		Callback = function(on)
			loopKickDualActive = on
			if on then
				if not selectedKickPlayer then 
					notify("Error", "se é burro ou se faz? seleciona animal", 3)
					Toggles.DualHandLoopKick:SetValue(false)
					return 
				end

				task.spawn(function()
					local lastTargetCharDual = nil
					local bp = nil

					while loopKickDualActive do
						local target = selectedKickPlayer
						local char = Player.Character
						local hum = char and char:FindFirstChild("Humanoid")
						local seat = hum and hum.SeatPart
						
						if not seat or not target or not target.Parent then
							task.wait(0.5)
							continue
						end

						local seatParent = seat.Parent
						local grab = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						local drop = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
						
						if not grab or not drop then task.wait(0.5) continue end

						local leftDet = seatParent:FindFirstChild("LeftDetector")
						local rightDet = seatParent:FindFirstChild("RightDetector")
						local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
						local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")

						local hrp = char:FindFirstChild("HumanoidRootPart")
						
						local targetChar = target.Character
						local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
						local targetHum = targetChar and targetChar:FindFirstChild("Humanoid")

						if targetHRP and targetHum and targetHum.Health > 0 then
							if targetChar ~= lastTargetCharDual then
								lastTargetCharDual = targetChar
								if bp then bp:Destroy() bp = nil end
								if hrp then hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 25, 0) end
								task.wait(0.2)
								grab:FireServer(leftDet, targetHRP, leftWeld)
								task.wait(0.3)
								drop:FireServer(leftWeld, targetHRP)
								task.wait(0.1)
								bp = Instance.new("BodyPosition")
								bp.Position = Vector3.new(0, 999999, 0)
								bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bp.Parent = targetHRP
								grab:FireServer(leftDet, targetHRP, leftWeld)
								task.wait(0.2)
								drop:FireServer(leftWeld, targetHRP)
							end

							grab:FireServer(leftDet, targetHRP, leftWeld)
							task.wait()
							drop:FireServer(leftWeld, targetHRP)
							task.wait()
							grab:FireServer(rightDet, targetHRP, rightWeld)
							task.wait()
							drop:FireServer(rightWeld, targetHRP)
							task.wait()
							grab:FireServer(leftDet, targetHRP, leftWeld)
							grab:FireServer(rightDet, targetHRP, rightWeld)
							task.wait()
							drop:FireServer(leftWeld, targetHRP)
							drop:FireServer(rightWeld, targetHRP)
							task.wait()
						else
							task.wait(0.1)
						end
					end
					if bp then bp:Destroy() end
				end)
			else
				loopKickDualActive = false
			end
		end
	})

	local playerFlingActive = false
	local flingBAV = nil
	local originalPos = nil

	TargetGroup:AddToggle("PlayerFlingBtn", {
		Text = "voar/bugar Jogador",
		Default = false,
		Callback = function(on)
			playerFlingActive = on
			
			if on then
				if not selectedKickPlayer then
					notify("System", "seleciona o corno primeiro", 3)
					Toggles.PlayerFlingBtn:SetValue(false)
					return
				end
				
				local RunService = game:GetService("RunService")
				local MyChar = Player.Character
				local MyRoot = MyChar and MyChar:FindFirstChild("HumanoidRootPart")
				
				if MyRoot then originalPos = MyRoot.CFrame end
				
				notify("Maestro", "Fling ativado, se mexe nao otario.", 3)

				task.spawn(function()
					while playerFlingActive do
						local target = selectedKickPlayer
						
						local char = Player.Character
						local hrp = char and char:FindFirstChild("HumanoidRootPart")
						local hum = char and char:FindFirstChild("Humanoid")
						
						if not hrp or not hum then 
							task.wait(0.5) 
							continue 
						end
						
						if target and target.Parent then
							local tChar = target.Character
							local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
							local tHum = tChar and tChar:FindFirstChild("Humanoid")
							
							if tRoot and tHum and tHum.Health > 0 then
								
								if not flingBAV or flingBAV.Parent ~= hrp then
									if flingBAV then flingBAV:Destroy() end
									flingBAV = Instance.new("BodyAngularVelocity")
									flingBAV.Name = "MaestroSpin"
									flingBAV.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
									flingBAV.AngularVelocity = Vector3.new(0, 10000, 0)
									flingBAV.P = 10000
									flingBAV.Parent = hrp
								end
								
								for _, part in pairs(char:GetDescendants()) do
									if part:IsA("BasePart") then
										part.CanCollide = false
									end
								end
								
								local loop = RunService.Heartbeat:Connect(function()
									if not playerFlingActive or not tRoot or not tRoot.Parent then return end
									hrp.CFrame = tRoot.CFrame
									hrp.Velocity = Vector3.zero 
								end)
								
								local startTime = tick()
								while tick() - startTime < 1.5 do
									if not playerFlingActive or not tRoot.Parent then break end
									task.wait(0.1)
								end
								
								if loop then loop:Disconnect() end
								
							else
								task.wait(0.2)
							end
						else
							playerFlingActive = false
							Toggles.PlayerFlingBtn:SetValue(false)
						end
						
						task.wait(0.1)
					end
					
					if flingBAV then flingBAV:Destroy() flingBAV = nil end
					
					local char = Player.Character
					if char then
						for _, part in pairs(char:GetDescendants()) do
							if part:IsA("BasePart") then
								part.CanCollide = true
							end
						end
						local hrp = char:FindFirstChild("HumanoidRootPart")
						if hrp then
							hrp.RotVelocity = Vector3.zero
							hrp.Velocity = Vector3.zero
							if originalPos then hrp.CFrame = originalPos end
						end
					end
				end)
			else
				playerFlingActive = false
				if flingBAV then flingBAV:Destroy() flingBAV = nil end
				
				local char = Player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.RotVelocity = Vector3.zero
					hrp.Velocity = Vector3.zero
				end
			end
		end
	})

	_G.AutoSitBlobZ = true

	BlobGroup:AddToggle("AutoSitZ", {
		Text = "Sentar automaticamente no Blobman [Z]",
		Default = true,
		Callback = function(Value)
			_G.AutoSitBlobZ = Value
		end
	})

	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
		if not processed and input.KeyCode == Enum.KeyCode.Z and _G.AutoSitBlobZ then
			local plr = game.Players.LocalPlayer
			local char = plr.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local hum = char and char:FindFirstChild("Humanoid")

			if not hrp or not hum then return end

			local folderName = plr.Name .. "SpawnedInToys"
			local folder = workspace:FindFirstChild(folderName)
			local blob = folder and folder:FindFirstChild("CreatureBlobman")

			if not blob then
				task.spawn(function()
					pcall(function()
						game.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", hrp.CFrame, Vector3.zero)
					end)
				end)
				
				if not folder then
					folder = workspace:WaitForChild(folderName, 5)
				end
				
				if folder then
					blob = folder:WaitForChild("CreatureBlobman", 5)
				end
			end

			if blob then
				local seat = blob:WaitForChild("VehicleSeat", 5)
				if seat then
					local t = tick()
					repeat
						if not hum.SeatPart then
							hrp.CFrame = seat.CFrame + Vector3.new(0, 1, 0)
							hrp.Velocity = Vector3.zero
							seat:Sit(hum)
						end
						game:GetService("RunService").Heartbeat:Wait()
					until hum.SeatPart == seat or tick() - t > 1.5
				end
			end
		end
	end)


	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.R then
			if blobMasterSwitch then
				blobFlyActive = not blobFlyActive
				if not blobFlyActive then
					if bvInstance then bvInstance:Destroy() bvInstance = nil end
					if bgInstance then bgInstance:Destroy() bgInstance = nil end
				end
			end
		end
	end)

	local function GetBlobRoot()
		local char = Player.Character
		local hum = char and char:FindFirstChild("Humanoid")
		
		if hum and hum.SeatPart and hum.SeatPart.Parent and hum.SeatPart.Parent.Name == "CreatureBlobman" then
			return hum.SeatPart.Parent:FindFirstChild("HumanoidRootPart") or hum.SeatPart.Parent.PrimaryPart
		end
		
		local folder = workspace:FindFirstChild(Player.Name .. "SpawnedInToys")
		if folder then
			local blob = folder:FindFirstChild("CreatureBlobman")
			if blob then
				return blob:FindFirstChild("HumanoidRootPart") or blob.PrimaryPart
			end
		end
		
		return nil
	end

	game:GetService("RunService").Heartbeat:Connect(function()
		if not blobFlyActive or not blobMasterSwitch then 
			if bvInstance then bvInstance:Destroy() bvInstance = nil end
			if bgInstance then bgInstance:Destroy() bgInstance = nil end
			return 
		end

		local root = GetBlobRoot()

		if root then
			if not root:FindFirstChild("BlobFlyVelocity") then
				bvInstance = Instance.new("BodyVelocity")
				bvInstance.Name = "BlobFlyVelocity"
				bvInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bvInstance.P = 10000
				bvInstance.Parent = root
			else
				bvInstance = root.BlobFlyVelocity
			end

			if not root:FindFirstChild("BlobFlyGyro") then
				bgInstance = Instance.new("BodyGyro")
				bgInstance.Name = "BlobFlyGyro"
				bgInstance.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				bgInstance.P = 20000
				bgInstance.D = 100
				bgInstance.Parent = root
			else
				bgInstance = root.BlobFlyGyro
			end

			local cam = workspace.CurrentCamera
			local moveDir = Vector3.zero

			if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end

			if bvInstance then 
				bvInstance.Velocity = moveDir * blobFlySpeed 
			end
			
			if bgInstance then 
				bgInstance.CFrame = cam.CFrame 
			end
		else
			if bvInstance then bvInstance:Destroy() bvInstance = nil end
			if bgInstance then bgInstance:Destroy() bgInstance = nil end
		end
	end)

	local DestroyGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	TargetGroup:AddToggle("DestroyTargetGucci", {
		Text = "Destruir Gucci (sentar)",
		Default = false,
		Callback = function(Value)
			DestroyTargetGucciActive = Value

			if Value then
				if not selectedKickPlayer then
					notify("Error", "escolhe o alvo primeiro, burro", 3)
					Toggles.DestroyTargetGucci:SetValue(false)
					return
				end

				local char = Player.Character
				local root = char and char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				local SafeSpot = root.CFrame
				local RunService = game:GetService("RunService")
				
				local folderName = selectedKickPlayer.Name .. "SpawnedInToys"
				notify("System", " esperando a source trabalhar " .. folderName, 3)

				task.spawn(function()
					while DestroyTargetGucciActive do
						if not selectedKickPlayer or not selectedKickPlayer.Parent then
							notify("System", "se cagou e kitou", 3)
							DestroyTargetGucciActive = false
							Toggles.DestroyTargetGucci:SetValue(false)
							break
						end

						local toysFolder = workspace:FindFirstChild(folderName)
						
						if not toysFolder then
							task.wait(1)
						else
							local foundBlob = false
							
							for _, obj in ipairs(toysFolder:GetChildren()) do
								if not DestroyTargetGucciActive then break end

								if obj.Name == "CreatureBlobman" then
									foundBlob = true
									local seat = obj:FindFirstChild("VehicleSeat") or obj:FindFirstChildWhichIsA("VehicleSeat", true)
									
									if seat then
										local myChar = Player.Character
										local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
										local myHum = myChar and myChar:FindFirstChild("Humanoid")

										if myRoot and myHum then
											if myHum.SeatPart ~= seat then
												notify("Target", "tirando o gucci do corno", 1)

												local magnetConnection
												magnetConnection = RunService.Stepped:Connect(function()
													if myRoot and seat then
														myRoot.CFrame = seat.CFrame
														myRoot.Velocity = Vector3.zero
														if obj.PrimaryPart then
															obj.PrimaryPart.Velocity = Vector3.zero
															obj.PrimaryPart.RotVelocity = Vector3.zero
														end
													end
												end)

												local sitStart = tick()
												while tick() - sitStart < 1 do
													if not DestroyTargetGucciActive then break end
													if myHum.SeatPart == seat then break end
													
													seat:Sit(myHum)
													task.wait()
												end
												
												if magnetConnection then magnetConnection:Disconnect() end

												if myHum.SeatPart == seat then
													task.wait(0.3) 
													myHum.Sit = false
													myHum.Jump = true
													
													task.wait(0.05)
													myRoot.CFrame = SafeSpot
													myRoot.Velocity = Vector3.zero
													
													notify("Success", "tirei o gucci do corno", 1)
													task.wait(0.5)
												else
													myRoot.CFrame = SafeSpot
												end
											end
										end
									end
								end
							end
							
							if not foundBlob then
							end
						end
						task.wait(1)
					end
				end)
			else
				DestroyTargetGucciActive = false
				notify("System", "gucci desligado corno", 2)
			end
		end
	})

TargetGroup:AddButton({
    Text = "Pegar",
    Func = function()
        if not selectedKickPlayer then 
            return 
        end

        local char = Player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local seat = hum and hum.SeatPart
        if not seat or seat.Parent.Name ~= "CreatureBlobman" then 
            return 
        end

        local blob = seat.Parent
        local blobRoot = blob:FindFirstChild("HumanoidRootPart")
        local scriptObj = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
        if not blobRoot or not scriptObj then return end

        local CG = scriptObj:FindFirstChild("CreatureGrab")
        local CD = scriptObj:FindFirstChild("CreatureDrop")
        local R_Det = blob:FindFirstChild("RightDetector")
        local R_Weld = R_Det and R_Det:FindFirstChild("RightWeld")

        local tChar = selectedKickPlayer.Character
        local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
        if not tRoot then return end

        local home = blobRoot.CFrame

        blobRoot.CFrame = tRoot.CFrame
        blobRoot.Velocity = Vector3.new()
        blobRoot.RotVelocity = Vector3.new()
        task.wait(0.3)

        pcall(function()
            CG:FireServer(R_Det, tRoot, R_Weld)
        end)

        task.wait(0.5)

        blobRoot.CFrame = home
        blobRoot.Velocity = Vector3.new()
        blobRoot.RotVelocity = Vector3.new()

        task.wait(0.05)

        for i = 1, 12 do
            tRoot.CFrame = home * CFrame.new(0,3,0)
            tRoot.Velocity = Vector3.new()
            tRoot.RotVelocity = Vector3.new()
            task.wait(0.03)
        end

        for i = 1, 8 do
            local weld = R_Det:FindFirstChild("RightWeld")
            if weld then
                pcall(function()
                    CD:FireServer(weld)
                end)
            end
            task.wait(0.03)
        end
    end
})

	local antiAntiKickActive = false

	TargetGroup:AddToggle("DestroyAntiKickToggle", {
		Text = "Click Anti Kick",
		Default = false,
		Callback = function(Value)
			antiAntiKickActive = Value

			if Value then
				task.spawn(function()
					local SetNetOwner = game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner
					local LocalPlayer = game.Players.LocalPlayer

					local function invis_touch(part, cf)
						SetNetOwner:FireServer(part, cf)
					end

					local function CheckAndYeet(toy)
						local part = toy:FindFirstChild("SoundPart")
						if part then
							invis_touch(part, part.CFrame)
							if part:FindFirstChild("PartOwner") and part.PartOwner.Value == LocalPlayer.Name then
								part.CFrame = CFrame.new(0, 1000, 0)
							end
						end
					end

					while antiAntiKickActive do
						local target = selectedKickPlayer
						if target then
							local spawned = workspace:FindFirstChild(target.Name.."SpawnedInToys")
							if spawned then
								if spawned:FindFirstChild("NinjaKunai") then
									CheckAndYeet(spawned.NinjaKunai)
								end
								if spawned:FindFirstChild("NinjaShuriken") then
									CheckAndYeet(spawned.NinjaShuriken)
								end
								if spawned:FindFirstChild("AntiKick") then
									CheckAndYeet(spawned.AntiKick)
								end
							end
						end
						task.wait(0.1)
					end
				end)
			else
				antiAntiKickActive = false
			end
		end
	})

	TargetGroup:AddToggle("AntiAntiInputLag", {
		Text = "Anti Anti Input Lag",
		Default = false,
		Callback = function(on)
			antiAntiLagEnabled = on

			if not on then
				antiAntiLagEnabled = false
				return
			end

			task.spawn(function()
				local plr = game.Players.LocalPlayer
				local char = plr.Character
				local hrp = char:FindFirstChild("HumanoidRootPart")
				if not hrp then return end

				local burgers = {}

				for _, v in ipairs(workspace:GetDescendants()) do
					if v.Name == "FoodHamburger" and v:IsA("Model") and v:FindFirstChild("HoldPart") then
						burgers[#burgers+1] = v
					end
				end

				workspace.DescendantAdded:Connect(function(obj)
					if obj.Name == "FoodHamburger" and obj:IsA("Model") then
						task.spawn(function()
							local hp = obj:WaitForChild("HoldPart", 3)
							if hp then
								burgers[#burgers+1] = obj
							end
						end)
					end
				end)

				while antiAntiLagEnabled do
					for i = #burgers, 1, -1 do
						local b = burgers[i]
						if not b or not b.Parent or not b:FindFirstChild("HoldPart") then
							table.remove(burgers, i)
						else
							local hp = b.HoldPart

							pcall(function()
								hp.HoldItemRemoteFunction:InvokeServer(b, char)
							end)

							task.wait()

							pcall(function()
								hp.DropItemRemoteFunction:InvokeServer(
									b,
									CFrame.new(hrp.Position + Vector3.new(0,-2000,0)),
									Vector3.new(0,0,0)
								)
							end)
						end
					end

					task.wait()
				end
			end)
		end
	})

	WhitelistGroup:AddDropdown("MultiWhitelist", {
		Values = getPlayerList(),
		Default = {},
		Multi = true,
		Text = "whitelist pessoas",
	})

	WhitelistGroup:AddButton({
		Text = "atualizar lista",
		Func = function()
			Options.MultiWhitelist:SetValues(getPlayerList())
		end
	})

local notifyActive = false
local notifyConnection = nil

DestroyTargetGucciActive = false
notify("System", "Destruir Gucci desativado no corno", 2)

if notifyConnection then 
    notifyConnection:Disconnect() 
    notifyConnection = nil
end

notifyConnection = PS.PlayerAdded:Connect(function(newPlayer)
    if not notifyActive then 
        return 
    end
    
    local detected = false
    local reason = ""
    
    local whitelistTable = Options.MultiWhitelist.Value
    for nameString, isSelected in pairs(whitelistTable) do
        if isSelected then
            local actualName = nameString:match("%((.-)%)")
            if actualName == newPlayer.Name then
                detected = true
                reason = "[Whitelist]"
                break
            end
        end
    end
    
    if not detected and Options.KickPlayerDropdown and Options.KickPlayerDropdown.Value then
        local selection = Options.KickPlayerDropdown.Value
        local selectedName = selection:match("%((.-)%)")
        
        if selectedName and selectedName == newPlayer.Name then
            detected = true
            reason = "[Main Target]"
        end
    end
    
    if detected then
        notify("O arrombado do alvo voltou.", reason .. " marcado pela cv: " .. newPlayer.Name, 8)
        
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://4590662766"
        sound.Volume = 2
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 3)
    end
end)

if notifyConnection then 
    notifyConnection:Disconnect() 
    notifyConnection = nil 
end

notify("Radar", "tracker desligado", 2)

	local GrabGroup = Tabs.Grab:AddLeftGroupbox("Grab Customization")

	_G.strength = 750
	local strengthConnection

	GrabGroup:AddSlider("ThrowPowerSlider", {
		Text = "Força",
		Default = 750,
		Min = 1,
		Max = 20000,
		Rounding = 0,
		Callback = function(value)
			_G.strength = value
		end
	})

	GrabGroup:AddToggle("ThrowStrengthToggle", {
		Text = "Força",
		Default = false,
		Callback = function(enabled)
			if enabled then
				strengthConnection = workspace.ChildAdded:Connect(function(model)
					if model.Name == "GrabParts" then
						local partToImpulse = model.GrabPart.WeldConstraint.Part1
						if partToImpulse then
							local velocityObj = Instance.new("BodyVelocity", partToImpulse)
							model:GetPropertyChangedSignal("Parent"):Connect(function()
								if not model.Parent then
									if UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
										velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										velocityObj.Velocity = workspace.CurrentCamera.CFrame.LookVector * _G.strength
										game:GetService("Debris"):AddItem(velocityObj, 1)
									else
										velocityObj:Destroy()
									end
								end
							end)
						end
					end
				end)
			elseif strengthConnection then
				strengthConnection:Disconnect()
			end
		end
	})

	local killGrabEnabled = false
	local function killGrabFunction()
		workspace.ChildAdded:Connect(function(v)
			if v:IsA("Model") and v.Name == "GrabParts" and killGrabEnabled then
				task.wait(0.05)
				local grabPart = v:FindFirstChild("GrabPart")
				if grabPart and grabPart:FindFirstChild("WeldConstraint") then
					local part1 = grabPart.WeldConstraint.Part1
					if part1 and part1.Parent and part1.Parent ~= Player.Character then
						local targetChar = part1.Parent
						local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
						if targetHum and targetChar then
							pcall(function()
								targetHum.Health = 0
								targetChar:BreakJoints()
							end)
						end
					end
				end
			end
		end)
	end
	killGrabFunction()

	GrabGroup:AddToggle("KillGrabToggle", {
		Text = "Kill Grab",
		Default = false,
		Callback = function(Value)
			killGrabEnabled = Value
		end
	})

	local PlayerView = Tabs.Player:AddLeftGroupbox("View & Movement")
	local PlayerESP = Tabs.Player:AddRightGroupbox("ESP")
	local PlayerEnv = Tabs.Player:AddLeftGroupbox("Environment")
	local PlayerPerf = Tabs.Player:AddRightGroupbox("Performance")

	local function enableThirdPerson()
		Player.CameraMode = Enum.CameraMode.Classic
		Camera.CameraType = Enum.CameraType.Custom
		Camera.CameraSubject = Player.Character:WaitForChild("Humanoid")
		Player.CameraMaxZoomDistance = 16456456546
		Player.CameraMinZoomDistance = 0.5
	end
	local function disableThirdPerson()
		Player.CameraMode = Enum.CameraMode.LockFirstPerson
		Camera.CameraType = Enum.CameraType.Custom
		Camera.CameraSubject = Player.Character:WaitForChild("Humanoid")
		Player.CameraMaxZoomDistance = 0
		Player.CameraMinZoomDistance = 0
	end
	PlayerView:AddToggle("ThirdPersonToggle", {
		Text = "terceira pessoa",
		Default = false,
		Callback = function(Value)
			if Value then enableThirdPerson() else disableThirdPerson() end
		end
	})

	local spinningConnection
	local spinSpeed = 5
	PlayerView:AddToggle("SpinToggle", {
		Text = "girar personagem",
		Default = false,
		Callback = function(Value)
			if Value then
				spinningConnection = R.Heartbeat:Connect(function()
					local character = Player.Character
					local root = character and character:FindFirstChild("HumanoidRootPart")
					if root then root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0) end
				end)
			else
				if spinningConnection then spinningConnection:Disconnect() spinningConnection = nil end
			end
		end
	})
	PlayerView:AddSlider("SpinSpeed", {
		Text = "velocidade do giro",
		Default = 5,
		Min = 1,
		Max = 50,
		Rounding = 0,
		Callback = function(Value) spinSpeed = Value end
	})

	local infJump = false
	PlayerView:AddToggle("infJumpToggle", {
		Text = "Pulo infinito",
		Default = false,
		Callback = function(Value) infJump = Value end
	})
	UserInputService.JumpRequest:Connect(function()
		if infJump then
			local character = Player.Character
			if character and character:FindFirstChildOfClass("Humanoid") then
				character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)

	local espEnabled = false
	local espBoxes = {}
	local targetNames = {"partesp", "playercharacterlocationdetector"}
	local function IsTarget(obj)
		if not obj:IsA("BasePart") then return false end
		for _, name in ipairs(targetNames) do if string.lower(obj.Name) == string.lower(name) then return true end end
		return false
	end
	local function AddBoxESP(obj)
		if espBoxes[obj] then return end
		local box = Instance.new("BoxHandleAdornment")
		box.Adornee = obj
		box.AlwaysOnTop = true
		box.ZIndex = 5
		box.Color3 = Color3.fromRGB(255, 255, 255)
		box.Transparency = 0.5
		box.Size = obj.Size
		box.Parent = game.CoreGui
		espBoxes[obj] = box
		obj.AncestryChanged:Connect(function(_, parent)
			if not parent and espBoxes[obj] then espBoxes[obj]:Destroy() espBoxes[obj] = nil end
		end)
	end
	local function RemoveAllBoxes()
		for obj, box in pairs(espBoxes) do if box then box:Destroy() end end
		espBoxes = {}
	end
	local function Scan()
		for _, obj in ipairs(workspace:GetDescendants()) do if espEnabled and IsTarget(obj) then AddBoxESP(obj) end end
	end
	workspace.DescendantAdded:Connect(function(obj) if espEnabled and IsTarget(obj) then AddBoxESP(obj) end end)

	PlayerESP:AddToggle("BoxESPWhite", {
		Text = "Olhar de Noia",
		Default = false,
		Callback = function(Value)
			espEnabled = Value
			if espEnabled then Scan() else RemoveAllBoxes() end
		end
	})

	PlayerESP:AddToggle("NicknameESP", {
		Text = "esp de nome",
		Default = false,
		Callback = function(Value)
			local function createESP(plr)
				if plr == Player then return end
				if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					local hrp = plr.Character.HumanoidRootPart
					if hrp:FindFirstChild("NameESP") then return end
					local billboard = Instance.new("BillboardGui")
					billboard.Name = "NameESP"
					billboard.Adornee = hrp
					billboard.Size = UDim2.new(0, 100, 0, 30)
					billboard.StudsOffset = Vector3.new(0, 3, 0)
					billboard.AlwaysOnTop = true
					billboard.Parent = hrp
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = plr.Name
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextScaled = true
					textLabel.Parent = billboard
				end
			end
			if Value then
				for _, plr in pairs(PS:GetPlayers()) do createESP(plr) plr.CharacterAdded:Connect(function() createESP(plr) end) end
				PS.PlayerAdded:Connect(function(plr) plr.CharacterAdded:Connect(function() createESP(plr) end) end)
			else
				for _, plr in pairs(PS:GetPlayers()) do
					if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						local hrp = plr.Character.HumanoidRootPart
						if hrp:FindFirstChild("NameESP") then hrp.NameESP:Destroy() end
					end
				end
			end
		end
	})

	local oldProperties = {}
	PlayerPerf:AddButton({
		Text = "aumentar fps",
		Func = function()
			local Lighting = game:GetService("Lighting")
			for _, v in pairs(Workspace:GetDescendants()) do
				if v:IsA("BasePart") then
					if not oldProperties[v] then oldProperties[v] = {Material = v.Material, Reflectance = v.Reflectance, CastShadow = v.CastShadow} end
					v.Material = Enum.Material.Plastic v.Reflectance = 0 v.CastShadow = false
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
					if not oldProperties[v] then oldProperties[v] = {Enabled = v.Enabled} end
					v.Enabled = false
				end
			end
			for _, plr in pairs(PS:GetPlayers()) do
				if plr.Character then
					for _, part in pairs(plr.Character:GetDescendants()) do
						if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
							if not oldProperties[part] then oldProperties[part] = {Material = part.Material, Reflectance = part.Reflectance, CastShadow = part.CastShadow} end
							part.Material = Enum.Material.Plastic part.Reflectance = 0 part.CastShadow = false
						end
					end
				end
			end
			if not oldProperties["Lighting"] then oldProperties["Lighting"] = {GlobalShadows = Lighting.GlobalShadows, FogEnd = Lighting.FogEnd, Brightness = Lighting.Brightness} end
			Lighting.GlobalShadows = false Lighting.FogEnd = 100000 Lighting.Brightness = 2
		end
	})

	PlayerPerf:AddButton({
		Text = "deletar aumento de fps",
		Func = function()
			local Lighting = game:GetService("Lighting")
			for obj, props in pairs(oldProperties) do
				if typeof(obj) == "Instance" and obj.Parent then
					for prop, value in pairs(props) do obj[prop] = value end
				elseif obj == "Lighting" then
					for prop, value in pairs(props) do Lighting[prop] = value end
				end
			end
			oldProperties = {}
		end
	})

	local MiscGroup = Tabs.Misc:AddLeftGroupbox("Miscellaneous")
	local mouse = Player:GetMouse()
	local tpToolConn

	MiscGroup:AddToggle("TPToggle", {
		Text = "keybind de TP (T)",
		Default = false,
		Callback = function(Value)
			if Value then
				if tpToolConn then tpToolConn:Disconnect() end
				tpToolConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
					if gameProcessed then return end
					if input.KeyCode == Enum.KeyCode.T then
						local character = Player.Character
						if character and character:FindFirstChild("HumanoidRootPart") then
							local hrp = character.HumanoidRootPart
							local targetPos = mouse.Hit.Position
							hrp.CFrame = CFrame.new(targetPos + Vector3.new(0,3,0))
						end
					end
				end)
			else
				if tpToolConn then tpToolConn:Disconnect() tpToolConn = nil end
			end
		end
	})

	local waterParts = {}
	task.spawn(function()
		if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("AlwaysHereTweenedObjects") then
			local oceanModel = workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
			for _, v in pairs(oceanModel:GetChildren()) do
				if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") or v:IsA("MeshPart") then
				table.insert(waterParts, {part = v, originalCollide = v.CanCollide})
				end
			end
		end
	end)

	MiscGroup:AddToggle("WaterWalkToggle", {
		Text = "andar na agua",
		Default = false,
		Callback = function(on)
			for _, item in pairs(waterParts) do
				if item.part then item.part.CanCollide = on end
			end
		end
	})

	local Triggerbot = {
		Enabled = false,
		Connection = nil,
		canGrab = true,
		maxDistance = 20,
		preGrabDelay = 0.00001,
		postGrabDelay = 0.05, 
		lastTarget = nil,
		lastHitTime = 0,
		targetMemoryDuration = 0.1,
		checkThrottle = 0.008,
		lastCheck = 0
	}

	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Exclude

	task.spawn(function()
		local success, result = pcall(function() return RS.GamepassEvents.CheckForGamepass:InvokeServer(20837132) end)
		if success and result then Triggerbot.maxDistance = 29.3 end
	end)

	if RS:FindFirstChild("GamepassEvents") and RS.GamepassEvents:FindFirstChild("FurtherReachBoughtNotifier") then
		RS.GamepassEvents.FurtherReachBoughtNotifier.OnClientEvent:Connect(function() Triggerbot.maxDistance = 29.3 end)
	end

	function Triggerbot:GetTarget()
		local c = Player.Character
		if not c or not c:FindFirstChild("HumanoidRootPart") then return end
		if Workspace:FindFirstChild("GrabParts") then return end
		
		local origin, dir = Camera.CFrame.Position, Camera.CFrame.LookVector
		rayParams.FilterDescendantsInstances = { c, Workspace.Terrain }
		
		local result = Workspace:Raycast(origin, dir * 1000, rayParams)
		if not result then
			local dirs = { dir, (dir + Vector3.new(0, 0.075, 0)).Unit, (dir - Vector3.new(0, 0.075, 0)).Unit }
			for _, d in ipairs(dirs) do
				result = Workspace:Raycast(origin, d * 1000, rayParams)
				if result then break end
			end
		end
		
		if not result then return end
		local hit = result.Instance
		local model = hit:FindFirstAncestorOfClass("Model")
		if not model or not model:FindFirstChildOfClass("Humanoid") or model == c then return end
		
		local hum = model:FindFirstChildOfClass("Humanoid")
		if hum.Health <= 0 then return end
		
		local root = model:FindFirstChild("HumanoidRootPart")
		if not root then return end
		
		local dist = (c.HumanoidRootPart.Position - root.Position).Magnitude
		if dist > self.maxDistance then return end
		
		return model
	end

	function Triggerbot:OnHeartbeat()
		if not self.Enabled or not self.canGrab then return end
		if UserInputService:GetFocusedTextBox() then return end
		
		if tick() - self.lastCheck < self.checkThrottle then return end
		self.lastCheck = tick()
		
		local t = self:GetTarget()
		if t then 
			self.lastTarget = t 
			self.lastHitTime = tick()
		elseif self.lastTarget and tick() - self.lastHitTime > self.targetMemoryDuration then 
			self.lastTarget = nil 
		end
		
		local c = Player.Character
		local root = self.lastTarget and self.lastTarget:FindFirstChild("HumanoidRootPart")
		
		if not (self.lastTarget and c and c:FindFirstChild("HumanoidRootPart") and root) then return end
		
		if (c.HumanoidRootPart.Position - root.Position).Magnitude > self.maxDistance then 
			self.lastTarget = nil 
			return 
		end
		
		if self.lastTarget then
			self.canGrab = false
			task.spawn(function()
				task.wait(self.preGrabDelay)
				pcall(mouse1press)
				local t0 = tick()
				repeat 
					task.wait(0.02) 
				until not Workspace:FindFirstChild("GrabParts") or tick() - t0 > 1.6
				task.wait(self.postGrabDelay)
				self.canGrab = true
				self.lastTarget = nil
			end)
		end
	end

local PacketSpamAmount = 100

    MiscGroup:AddSlider("PacketAmountSlider", {
        Text = "lag de ping",
        Default = 100,
        Min = 10,
        Max = 5000,
        Rounding = 0,
        Callback = function(Value)
            PacketSpamAmount = Value
        end
    })

    MiscGroup:AddToggle("PacketLagToggle", {
        Text = "Packet Lag",
        Default = false,
        Callback = function(Value)
            _G.PacketLagActive = Value

            if Value then
                task.spawn(function()
                    for i, e in pairs(game.Players:GetPlayers()) do
                        if e.Name == "MaybeFlashh" then
                            return
                        end
                    end

                    local RS = game:GetService("ReplicatedStorage")
                    local GrabEvent = RS:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine")

                    while _G.PacketLagActive do
                        pcall(function()
                            GrabEvent:FireServer(string.rep("Balls Balls Balls Balls", PacketSpamAmount))
                        end)
                        task.wait()
                    end
                end)
            else
                _G.PacketLagActive = false
            end
        end
    })

	MiscGroup:AddToggle("AutoResetToggle", {
		Text = "reset automático",
		Default = false,
		Callback = function(on)
			autoResetEnabled = on

			if not on then
				autoResetEnabled = false
				return
			end

			task.spawn(function()
				local plr = game.Players.LocalPlayer
				while autoResetEnabled do
					local char = plr.Character
					local hum = char and char:FindFirstChild("Humanoid")

					if hum and hum.Health > 0 then
						hum.Health = 0
					end

					task.wait(0.5)
				end
			end)
		end
	})

	MiscGroup:AddToggle("TriggerbotToggle", {
		Text = "Trigger Bot",
		Default = Triggerbot.Enabled,
		Callback = function(value)
			Triggerbot.Enabled = value
			if Triggerbot.Enabled and not Triggerbot.Connection then
				Triggerbot.Connection = R.Heartbeat:Connect(function() Triggerbot:OnHeartbeat() end)
			elseif not Triggerbot.Enabled and Triggerbot.Connection then
				Triggerbot.Connection:Disconnect() 
				Triggerbot.Connection = nil
			end
		end
	})

	MiscGroup:AddSlider("FOVSlider", {
		Text = "FOV",
		Default = 90,
		Min = 1,
		Max = 120,
		Rounding = 0,
		Suffix = "°",
		Callback = function(value) game.Workspace.CurrentCamera.FieldOfView = value end
	})

	local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
	MenuGroup:AddButton("Unload", function() Library:Unload() end)
	MenuGroup:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind", { Default = "N", NoUI = true, Text = "Menu keybind" })
	Library.ToggleKeybind = Options.MenuKeybind

	ThemeManager:SetLibrary(Library)
	SaveManager:SetLibrary(Library)
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
	ThemeManager:SetFolder("VaBHub")
	SaveManager:SetFolder("VaBHub/Configs")
	SaveManager:BuildConfigSection(Tabs["UI Settings"])
	ThemeManager:ApplyToTab(Tabs["UI Settings"])

	PS.PlayerRemoving:Connect(function(player)
		notify("Notify", (player and player.Name or "Unknown") .. " kito", 5)
	end)
	PS.PlayerAdded:Connect(function(plr)
		if plr:IsFriendsWith(Player.UserId) then
			notify("Player", plr.Name .. " entrou", 5)
		end
	end)

-- ✨ AGAIN HUB - FTAP KICK DETECTOR (SCANNER LOOP)
local Players = game:GetService("Players")
local Workspace = game:GetService("workspace")

-- Função para disparar o aviso
local function AlertarKick(pos)
    local vitima = "Alguém"
    local menorDist = 30 -- Raio de busca um pouco maior para garantir
    
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - pos).Magnitude
            if d < menorDist then
                menorDist = d
                vitima = p.Name
            end
        end
    end

    -- Seu Notify personalizado
    Rayfield:Notify({
        Title = "🚨 KICK DETECTADO",
        Content = "Player (" .. vitima .. ") tomou kick bobão",
        Duration = 7,
        Image = 4483362458
    })
end

-- Tabela para não repetir o aviso pro mesmo objeto
local jaDetectado = {}

-- LOOP DE VARREDURA (Roda o tempo todo em segundo plano)
task.spawn(function()
    while task.wait(0.5) do -- Checa 2 vezes por segundo
        local bh = Workspace:FindFirstChild("BlackHoleKick", true) -- O 'true' faz ele procurar em subpastas também
        
        if bh and not jaDetectado[bh] then
            -- Achou o BlackHoleKick, agora busca o Hole dentro dele
            local hole = bh:FindFirstChild("Hole")
            if hole and hole:IsA("BasePart") then
                jaDetectado[bh] = true -- Marca para não avisar de novo o mesmo
                AlertarKick(hole.Position)
                
                -- Limpa da tabela quando o objeto sumir do jogo
                task.spawn(function()
                    while bh.Parent do task.wait(1) end
                    jaDetectado[bh] = nil
                end)
            end
        end
    end
end)

	local heartHighRun = false
	local heartConnection = nil
	local heartToy = nil

	MiscGroup:AddToggle("HeartSparklerHigh", {
		Text = "Coração",
		Default = false,
		Callback = function(Value)
			heartHighRun = Value
			local RS = game:GetService("ReplicatedStorage")
			local RunService = game:GetService("RunService")
			local player = game.Players.LocalPlayer

			if Value then
				task.spawn(function()
					if not player.Character then return end
					local hrp = player.Character:FindFirstChild("HumanoidRootPart")
					if not hrp then return end

					pcall(function()
						RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("FireworkSparkler", hrp.CFrame * CFrame.new(0, 50, 0), Vector3.zero)
					end)

					local folderName = player.Name .. "SpawnedInToys"
					local folder = workspace:WaitForChild(folderName, 5)
					if not folder then return end
					
					heartToy = folder:WaitForChild("FireworkSparkler", 5)
					if not heartToy then return end
					
					local part = heartToy:FindFirstChild("Handle") or heartToy:FindFirstChildWhichIsA("BasePart")
					if not part then return end

					task.wait(0.2)
					
					for _, v in pairs(heartToy:GetDescendants()) do
						if v:IsA("BasePart") then
							v.Anchored = false
							v.CanCollide = false
							v.Massless = true
						end
					end
					part:BreakJoints()

					local bp = Instance.new("BodyPosition")
					bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					bp.P = 20000
					bp.D = 500
					bp.Parent = part

					local bg = Instance.new("BodyGyro")
					bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					bg.P = 3000
					bg.CFrame = CFrame.new()
					bg.Parent = part

					local t = 0
					
					if heartConnection then heartConnection:Disconnect() end
					
					heartConnection = RunService.Heartbeat:Connect(function(dt)
						if not heartHighRun or not part or not part.Parent then
							if heartConnection then heartConnection:Disconnect() end
							if heartToy then pcall(function() heartToy:Destroy() end) end
							return
						end

						local currentHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
						if not currentHrp then return end

						pcall(function()
							RS.GrabEvents.SetNetworkOwner:FireServer(part, part.CFrame)
						end)

						t = t + (8 * dt)
						
						local scale = 1.5
						local x = 16 * math.sin(t)^3
						local y = 13 * math.cos(t) - 5 * math.cos(2*t) - 2 * math.cos(3*t) - math.cos(4*t)

						local relPos = Vector3.new(x * scale, (y * scale) + 25, 3) 
						local finalPos = currentHrp.CFrame:PointToWorldSpace(relPos)

						bp.Position = finalPos
						bg.CFrame = currentHrp.CFrame
					end)
				end)
			else
				if heartConnection then heartConnection:Disconnect() heartConnection = nil end
				if heartToy then 
					pcall(function() heartToy:Destroy() end) 
					heartToy = nil 
				end
			end
		end,
	})

	MiscGroup:AddLabel("Anchor Object Bind"):AddKeyPicker("AnchorObjectKey", {
		Default = "G",
		Text = "Congelar Objeto",
		NoUI = false,
		Callback = function()
			local original = workspace:FindFirstChild("GrabParts")
			if not original then return end

			local grabPart = original:FindFirstChild("GrabPart", true)
			if not grabPart or not grabPart:IsA("BasePart") then return end

			local wasCollide = grabPart.CanCollide
			grabPart.CanCollide = true
			task.wait(0.1)

			local targetModel = nil
			local touchingParts = grabPart:GetTouchingParts()

			if #touchingParts == 0 then
				grabPart.CanCollide = wasCollide
				return
			end

			for _, part in ipairs(touchingParts) do
				if not part:IsDescendantOf(original) then
					local current = part
					while current and current ~= workspace do
						if current:IsA("Model") then
							targetModel = current
							break
						end
						current = current.Parent
					end
					if targetModel then break end
				end
			end

			grabPart.CanCollide = wasCollide

			if not targetModel then return end

			if not targetModel.Parent then
				local found = false
				local connection
				connection = targetModel.AncestryChanged:Connect(function(_, parent)
					if parent then
						found = true
						connection:Disconnect()
					end
				end)

				local startTime = tick()
				while not found and tick() - startTime < 2 do
					task.wait(0.1)
				end

				if not found then return end
			end

			local existing = targetModel:FindFirstChild("CleanedGrabParts")
			if existing then
				local existingHighlight = targetModel:FindFirstChild("AnchorHighlight")
				if existingHighlight then
					existingHighlight:Destroy()
				end
				existing:Destroy()
				return
			end

			local clone = original:Clone()
			clone.Name = "CleanedGrabParts"

			for _, desc in ipairs(clone:GetDescendants()) do
				if desc:IsA("BasePart") then
					desc.Transparency = 1
					desc.CanCollide = false

					local beam = desc:FindFirstChild("GrabBeam")
					if beam then beam:Destroy() end

					for _, sName in ipairs({"AttachSound1", "AttachSound", "BeamSound", "BeamSound1"}) do
						local sound = desc:FindFirstChild(sName)
						if sound then sound:Destroy() end
					end
				end
			end

			clone.Parent = targetModel

			local hl = Instance.new("Highlight")
			hl.Name = "AnchorHighlight"
			hl.FillColor = Color3.fromRGB(0, 85, 255)
			hl.FillTransparency = 0.4
			hl.OutlineColor = Color3.fromRGB(0, 170, 255)
			hl.OutlineTransparency = 0.7
			hl.Adornee = targetModel
			hl.Parent = targetModel

			local connection
			connection = game:GetService("RunService").Heartbeat:Connect(function()
				if not clone or not clone.Parent or not targetModel or not targetModel.Parent then
					if connection then connection:Disconnect() end
					return
				end

				if hl and hl.Parent then
					hl.Adornee = targetModel
				else
					connection:Disconnect()
				end
			end)
		end
	})


if Tabs.Build then
   

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- SOM AO EXECUTAR

local SoundService = game:GetService("SoundService")

pcall(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120358061"
    sound.Volume = 0.5
    sound.Looped = false
    sound.Parent = SoundService
    sound:Play()

    -- opcional: limpa depois de tocar
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end)



-- Anti Fogo [Setup]

pcall(function() 
	ExtinguishPart = workspace["Map"]["Hole"]["PoisonBigHole"]["ExtinguishPart"]
	ExtinguishPart.Size = Vector3.new(0.5, 0.5, 0.5)
	ExtinguishPart.Transparency = 1
	ExtinguishPart["Tex"].Transparency = 1
end)

local Player = game:GetService("Players").LocalPlayer

function AntiFireC()
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	local IsBurning = HumanoidRootPart:WaitForChild("FirePlayerPart"):WaitForChild("CanBurn")

	IsBurning.Changed:Connect(function(v)
		if v and _G.AntiFogo then
			while IsBurning.Value do
				if firetouchinterest then
					firetouchinterest(HumanoidRootPart["FirePlayerPart"], ExtinguishPart, 0)
				else
					ExtinguishPart.CFrame = HumanoidRootPart["FirePlayerPart"].CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
					task.wait()
					ExtinguishPart.Position = Vector3.new(0, -100, 0)
				end

				task.wait()
			end
		end
	end)
end

task.spawn(AntiFireC)

Player.CharacterAdded:Connect(AntiFireC)

-- [Fim do Setup do Anti-Fogo]


-- 1. FUNÇÃO DA TAG VISUAL (TAMANHO FIXO)
local function CriarTag(char)
    if char and not char:FindFirstChild("AgainUser_Tag") then
        local torso = char:WaitForChild("Torso", 5)
        if torso then
            local gui = Instance.new("BillboardGui", char)
            gui.Name = "AgainUser_Tag"
            gui.Adornee = torso
            
            -- AJUSTE AQUI: Usando Scale (os dois primeiros números) 
            -- Isso faz a tag ocupar uma porcentagem da visão, não pixels fixos.
            gui.Size = UDim2.new(4, 0, 1.5, 0) 
            
            gui.StudsOffset = Vector3.new(0, 4.5, 0)
            gui.AlwaysOnTop = true
            
            -- ESSA LINHA É O SEGREDO:
            -- Impede que a tag fique minúscula de longe ou gigante de perto.
            gui.DistanceUpperLimit = 500 -- Distância máxima que ela ainda aparece
            
            local txt = Instance.new("TextLabel", gui)
            txt.BackgroundTransparency = 1
            
            -- O Texto também deve preencher o Scale da GUI
            txt.Size = UDim2.new(1, 0, 1, 0)
            
            txt.Text = "⚡ AGAIN USER ⚡"
            txt.TextColor3 = Color3.fromRGB(0, 170, 255)
            txt.Font = Enum.Font.Arcade
            
            -- TextScaled garante que o texto preencha o espaço da BillboardGui
            txt.TextScaled = true 
            
            -- Opcional: Adiciona um contorno para ler melhor de longe
            local stroke = Instance.new("UIStroke", txt)
            stroke.Thickness = 2
            stroke.Color = Color3.fromRGB(0, 0, 0)
        end
    end
end

-- 2. LOOP DE SINALIZAÇÃO (Roda a cada 10 segundos para todos verem)
task.spawn(function()
    while true do
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            local anim = Instance.new("Animation")
            anim.AnimationId = ANIM_ID
            local track = hum:LoadAnimation(anim)
            track.Priority = Enum.AnimationPriority.Action
            -- Play(fadeTime, weight, speed) -> Speed 0.001 deixa quase estático
            track:Play(0.1, 1, 0.001) 
            
            -- Para a animação após 1 segundo para não travar o boneco
            task.delay(1, function()
                track:Stop()
            end)
        end
        task.wait(10) -- O intervalo que você pediu
    end
end)

-- 3. RADAR DE ESCANEAMENTO
-- Fica de olho em qualquer animação que comece a tocar no servidor
local function Monitorar(p)
    p.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid", 10)
        hum.AnimationPlayed:Connect(function(track)
            if track.Animation.AnimationId == ANIM_ID then
                CriarTag(char)
            end
        end)
    end)
    
    -- Checagem inicial para quem já está sinalizando
    if p.Character then
        local hum = p.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.AnimationPlayed:Connect(function(track)
                if track.Animation.AnimationId == ANIM_ID then
                    CriarTag(p.Character)
                end
            end)
        end
    end
end
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
end
-- Ativa o monitoramento para todos
for _, p in pairs(Players:GetPlayers()) do
    if p ~= LP then Monitorar(p) end
end
Players.PlayerAdded:Connect(Monitorar)

-- ✨ AGAIN HUB - ANTI-AFK DEFINITIVO (SISTEMA DE BYPASS TOTAL)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

local TEMPO_LIMITE = 20 * 60 -- 20 Minutos
local tempoParado = 0
local afkAtivo = false

-- 1. BYPASS DE INATIVIDADE (MÉTODO RADICAL)
-- Esse sinal desconecta a função interna do Roblox que te chuta por AFK
for _, v in pairs(getconnections(player.Idled)) do
    v:Disable()
end

-- Fallback caso o executor não suporte getconnections:
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    -- Micro-movimento físico para o servidor validar atividade
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.0001, 0)
    end
end)

-- 2. INTERFACE (MODO AFK)
local afkGui = Instance.new("ScreenGui", pGui)
afkGui.Name = "AgainAntiAFK"
afkGui.Enabled = false
afkGui.IgnoreGuiInset = true
afkGui.DisplayOrder = 9999

local fundo = Instance.new("Frame", afkGui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fundo.BorderSizePixel = 0

local textoPrincipal = Instance.new("TextLabel", fundo)
textoPrincipal.Size = UDim2.new(1, 0, 0, 50)
textoPrincipal.Position = UDim2.new(0, 0, 0.45, 0)
textoPrincipal.BackgroundTransparency = 1
textoPrincipal.Font = Enum.Font.GothamBold
textoPrincipal.Text = "MODO ANTI-AFK ATIVO"
textoPrincipal.TextColor3 = Color3.fromRGB(255, 255, 255)
textoPrincipal.TextSize = 45

local textoSub = Instance.new("TextLabel", fundo)
textoSub.Size = UDim2.new(1, 0, 0, 30)
textoSub.Position = UDim2.new(0, 0, 0.53, 0)
textoSub.BackgroundTransparency = 1
textoSub.Font = Enum.Font.Gotham
textoSub.Text = "MOVA O MOUSE PARA DESATIVAR"
textoSub.TextColor3 = Color3.fromRGB(200, 200, 200)
textoSub.TextSize = 22

-- 3. A COBRINHA (VERSÃO SEM DEPENDÊNCIA DE IMAGEM)
local snakeContainer = Instance.new("Frame", fundo)
snakeContainer.Name = "LoadingSnake"
snakeContainer.Size = UDim2.new(0, 80, 0, 80)
snakeContainer.Position = UDim2.new(0.5, -40, 0.65, 0)
snakeContainer.BackgroundTransparency = 1

local stroke = Instance.new("UIStroke", snakeContainer)
stroke.Thickness = 5
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local corner = Instance.new("UICorner", snakeContainer)
corner.CornerRadius = UDim.new(1, 0) -- Força o frame a ser um círculo perfeito

local grad = Instance.new("UIGradient", stroke)
grad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),     -- Cabeça
    NumberSequenceKeypoint.new(0.6, 1),   -- Rastro sumindo
    NumberSequenceKeypoint.new(1, 1)     -- Cauda invisível
})
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})

-- 4. LÓGICA DE DETECÇÃO ROBUSTA
local function ResetTempo()
    tempoParado = 0
    if afkAtivo then
        afkAtivo = false
        afkGui.Enabled = false
    end
end

-- Captura inputs mesmo com a janela em segundo plano (se o executor permitir)
UIS.InputBegan:Connect(ResetTempo)
UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then ResetTempo() end
end)

-- O segredo está no Heartbeat: ele não para mesmo se você estiver em outra aba
RunService.Heartbeat:Connect(function(dt)
    tempoParado = tempoParado + dt
    
    if tempoParado >= TEMPO_LIMITE and not afkAtivo then
        afkAtivo = true
        afkGui.Enabled = true
    end
    
    if afkAtivo then
        grad.Rotation = (tick() * 150) % 360
    end
end)

print("Again Hub: Anti-AFK.")
