--[[
    Obsidian UI V5 - Full Features (Complete)
    
    [Invisibility]
    - Anti Grab
    - Anti Gucci (6 Types)
    - Anti Blobman Kill
    - Anti Banana (Sit Glitch + FloorMaterial Bypass)
    
    [Player] (NEW)
    - Noclip
    - TP Walk (Speed 1~10)
    - Infinite Jump
    
    [Anti Loop]
    - Lock Position, Toggle, Radius, Steps
    
    [Attack]
    - Spam SetOwner (Kick, Ragdoll)
    - Set Owner Aura
    
    단축키: RightShift
]]

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Options = Library.Options
local Toggles = Library.Toggles

-- ==========================================
-- [[ EndGrabEarly Bypass - 자동 적용 ]]
-- ==========================================
pcall(function()
    local G = ReplicatedStorage:WaitForChild("GrabEvents")
    local endGrab = G:FindFirstChild("EndGrabEarly")
    if endGrab then
        endGrab:Destroy()
    end
    local fake = Instance.new("RemoteEvent")
    fake.Name = "EndGrabEarly"
    fake.Parent = G
end)

-- ==========================================
-- [[ ANTI GRAB ]]
-- ==========================================
local AntiGrabState = {
    Connection = nil
}

local function StartAntiGrab()
    if AntiGrabState.Connection then AntiGrabState.Connection:Disconnect() end
    
    local Struggle = ReplicatedStorage:WaitForChild("CharacterEvents"):FindFirstChild("Struggle")
    local Ragdoll = ReplicatedStorage:WaitForChild("CharacterEvents"):FindFirstChild("RagdollRemote")
    
    AntiGrabState.Connection = RunService.Heartbeat:Connect(function()
        if not Toggles.AntiGrab or not Toggles.AntiGrab.Value then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        local isHeld = LocalPlayer:FindFirstChild("IsHeld")
        
        if hrp and hum and isHeld and isHeld.Value == true then
            pcall(function()
                if Struggle then Struggle:FireServer() end
                if Ragdoll then Ragdoll:FireServer(hrp, 0) end
                hum.Sit = false
            end)
        end
    end)
end

local function StopAntiGrab()
    if AntiGrabState.Connection then
        AntiGrabState.Connection:Disconnect()
        AntiGrabState.Connection = nil
    end
end

-- ==========================================
-- [[ ANTI BANANA V2 (User Requested Integration) ]]
-- ==========================================
local AntiBanana = {
    Connection = nil,
    GlitchToggle = false
}

local function StartAntiBanana()
    if AntiBanana.Connection then return end 

    AntiBanana.Connection = RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        
        if hum then
            -- 1. Sit 강제 고정
            if not hum.Sit then
                hum.Sit = true
            end
            
            -- 2. 상태 글리치 (Air ↔ Ground 반복)
            AntiBanana.GlitchToggle = not AntiBanana.GlitchToggle
            
            if AntiBanana.GlitchToggle then
                hum:ChangeState(Enum.HumanoidStateType.Freefall)
            else
                hum:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
    end)
end

local function StopAntiBanana()
    if AntiBanana.Connection then
        AntiBanana.Connection:Disconnect()
        AntiBanana.Connection = nil
        
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then
            hum.Sit = false
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
end

-- ==========================================
-- [[ TYPE 1: Blob Man Gucci (Automatic) - V51 ]]
-- ==========================================
local Type1 = {
    systemOn = false,
    autoRespawnEnabled = false,
    currentSeat = nil,
    ragdollConnection = nil,
    sitConnection = nil,
    Remotes = { ragdoll = nil, spawn = nil, destroy = nil }
}

local function Type1_CacheRemotes()
    if not Type1.Remotes.ragdoll then
        local charEvents = ReplicatedStorage:WaitForChild("CharacterEvents", 5)
        if charEvents then
            Type1.Remotes.ragdoll = charEvents:FindFirstChild("RagdollRemote")
        end
    end
    if not Type1.Remotes.spawn or not Type1.Remotes.destroy then
        local menuToys = ReplicatedStorage:WaitForChild("MenuToys", 5)
        if menuToys then
            Type1.Remotes.spawn = menuToys:WaitForChild("SpawnToyRemoteFunction", 5)
            Type1.Remotes.destroy = menuToys:FindFirstChild("DestroyToy")
        end
    end
end

local function Type1_StartRagdollSpam(rootPart)
    if Type1.ragdollConnection then Type1.ragdollConnection:Disconnect() end
    if not Type1.Remotes.ragdoll then return end
    
    Type1.ragdollConnection = RunService.Heartbeat:Connect(function()
        if not Type1.systemOn or not rootPart then return end
        pcall(function() Type1.Remotes.ragdoll:FireServer(rootPart, 2) end)
    end)
end

local function Type1_StartSitSpam(humanoid, seat)
    if Type1.sitConnection then Type1.sitConnection:Disconnect() end
    
    Type1.sitConnection = RunService.Heartbeat:Connect(function()
        if not Type1.systemOn or not seat or not seat.Parent then return end
        seat:Sit(humanoid)
    end)
end

local function Type1_CleanUpOldToys()
    if not Type1.Remotes.destroy then return end
    local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if not folder then return end
    for _, toy in pairs(folder:GetChildren()) do
        if toy.Name == "CreatureBlobman" then
            pcall(function() Type1.Remotes.destroy:FireServer(toy) end)
        end
    end
end

local function Type1_RunStableGucci()
    if Type1.systemOn then return end
    
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid", 3)
    local root = char:WaitForChild("HumanoidRootPart", 3)
    
    if not (hum and root) then 
        Type1.systemOn = false
        return 
    end
    
    Type1.systemOn = true
    Type1_CleanUpOldToys()
    
    local savedCFrame = root.CFrame
    
    local spawnCFrame = CFrame.new(103.85, -7.45, -538.58)
    task.spawn(function()
        if Type1.Remotes.spawn then
            Type1.Remotes.spawn:InvokeServer("CreatureBlobman", spawnCFrame, Vector3.zero)
        end
    end)
    
    local blobman = nil
    local folder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 5)
    if not folder then
        Type1.systemOn = false
        return
    end
    
    local startTick = tick()
    while not blobman and tick() - startTick < 3 do
        local target = folder:FindFirstChild("CreatureBlobman")
        if target then blobman = target break end
        RunService.Heartbeat:Wait()
    end
    
    if not blobman then
        Type1.systemOn = false
        return
    end
    
    local head = blobman:FindFirstChild("Head")
    if head then head.Anchored = true end
    
    local seat = blobman:WaitForChild("VehicleSeat", 2)
    if not seat then Type1.systemOn = false return end
    Type1.currentSeat = seat
    
    Type1_StartRagdollSpam(root)
    
    root.CFrame = seat.CFrame + Vector3.new(0, 2, 0)
    seat:Sit(hum)
    
    Type1_StartSitSpam(hum, seat)
    
    task.wait(0.6)
    
    hum.Sit = false
    hum.PlatformStand = true
    
    if seat then 
        seat.Disabled = true 
        pcall(function() seat:Destroy() end)
    end
    
    if blobman then
        for _, v in pairs(blobman:GetDescendants()) do
            if v:IsA("Weld") or v:IsA("Snap") then v:Destroy() end
        end
    end
    
    root.CFrame = savedCFrame
    root.Velocity = Vector3.zero
    hum.PlatformStand = false
    
    task.wait(0.5)
    
    if Type1.sitConnection then Type1.sitConnection:Disconnect() Type1.sitConnection = nil end
    if Type1.ragdollConnection then Type1.ragdollConnection:Disconnect() Type1.ragdollConnection = nil end
    
    task.wait(0.5)
    
    Type1.systemOn = false
    
    Library:Notify({ Title = "Anti Gucci", Description = "Blob Man Gucci (Automatic) 완료!", Time = 2 })
end

local function Type1_StopSystem()
    Type1.systemOn = false
    Type1.autoRespawnEnabled = false
    Type1.currentSeat = nil
    if Type1.ragdollConnection then Type1.ragdollConnection:Disconnect() Type1.ragdollConnection = nil end
    if Type1.sitConnection then Type1.sitConnection:Disconnect() Type1.sitConnection = nil end
end

local function Type1_ConnectDeathEvent(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    hum.Died:Connect(function()
        if Type1.autoRespawnEnabled then
            Type1.systemOn = false
            Type1_CleanUpOldToys()
        end
    end)
end

Type1_CacheRemotes()

-- ==========================================
-- [[ TYPE 2: Blob Man Gucci (Passivity) - V32 ]]
-- ==========================================
local Type2 = {
    systemOn = false,
    isReadyToGhost = false,
    currentSeat = nil,
    ragdollConnection = nil,
    sitConnection = nil
}

local function Type2_startRagdollSpam(rootPart)
    if Type2.ragdollConnection then Type2.ragdollConnection:Disconnect() end
    
    local ragdollRemote = ReplicatedStorage:WaitForChild("CharacterEvents"):FindFirstChild("RagdollRemote")
    
    Type2.ragdollConnection = RunService.Heartbeat:Connect(function()
        if not Type2.systemOn then return end
        if rootPart and ragdollRemote then
            pcall(function()
                ragdollRemote:FireServer(rootPart, 0)
            end)
        end
    end)
end

local function Type2_startSitSpam(humanoid, seat)
    if Type2.sitConnection then Type2.sitConnection:Disconnect() end
    
    Type2.sitConnection = RunService.Heartbeat:Connect(function()
        if not Type2.systemOn then return end
        if seat and seat.Parent then
            seat:Sit(humanoid)
        end
    end)
end

local function Type2_onJumpRequest()
    if not Type2.systemOn or not Type2.isReadyToGhost then return end
    
    if Type2.currentSeat and Type2.currentSeat:IsDescendantOf(workspace) then
        
        if Type2.sitConnection then 
            Type2.sitConnection:Disconnect() 
            Type2.sitConnection = nil
        end
        
        local weld = Type2.currentSeat:FindFirstChild("SeatWeld")
        if weld then weld:Destroy() end
        
        for _, v in pairs(Type2.currentSeat:GetChildren()) do
            if v:IsA("Weld") then v:Destroy() end
        end
        
        Type2.currentSeat = nil
        
        Library:Notify({ Title = "Anti Gucci", Description = "Blob Man Gucci (Passivity) 완료! (Ragdoll 유지 중)", Time = 2 })
    end
end

local function Type2_activateSystem()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    
    if not (hum and root) then return end
    
    if not hum.Sit or not hum.SeatPart or hum.SeatPart.Parent.Name ~= "CreatureBlobman" then
        Library:Notify({ Title = "Anti Gucci", Description = "오류: 블롭맨에 먼저 앉으세요!", Time = 3 })
        return
    end
    
    Type2.systemOn = true
    Type2.currentSeat = hum.SeatPart
    Type2.isReadyToGhost = false
    
    Type2_startRagdollSpam(root)
    Type2_startSitSpam(hum, Type2.currentSeat)
    
    Library:Notify({ Title = "Anti Gucci", Description = "강제 고정 중... (2초 대기)", Time = 2 })
    
    task.wait(2)
    
    if not Type2.systemOn then return end
    
    Type2.isReadyToGhost = true
    Library:Notify({ Title = "Anti Gucci", Description = "준비 끝! 점프하세요 (Space)", Time = 3 })
end

local function Type2_deactivateSystem()
    Type2.systemOn = false
    Type2.isReadyToGhost = false
    Type2.currentSeat = nil
    
    if Type2.ragdollConnection then Type2.ragdollConnection:Disconnect() Type2.ragdollConnection = nil end
    if Type2.sitConnection then Type2.sitConnection:Disconnect() Type2.sitConnection = nil end
end

UserInputService.JumpRequest:Connect(Type2_onJumpRequest)

-- ==========================================
-- [[ TYPE 3: House Blob Man Gucci (Automatic) - V31 ]]
-- ==========================================
local Type3 = {
    IsAutoMode = false,
    MyPlotIndex = nil,
    OriginalCFrame = nil,
    IsGucciRunning = false,
    ragdollConnection = nil,
    sitConnection = nil,
    Remotes = {}
}

local function Type3_InitRemotes()
    Type3.Remotes.spawn = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
    Type3.Remotes.ragdoll = ReplicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote")
    Type3.Remotes.destroy = ReplicatedStorage:WaitForChild("MenuToys"):FindFirstChild("DestroyToy")
    Type3.Remotes.claim = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
end

local Type3_PlotsData = {
    [1] = { GetPart = function() return Workspace.Plots.Plot1.PlotSign.Sign.Plus.PlusGrabPart end },
    [2] = { GetPart = function() return Workspace.Plots.Plot2.PlotSign.Sign.Plus.PlusGrabPart end },
    [3] = { GetPart = function() return Workspace.Plots.Plot3.PlotSign.Sign.Plus.PlusGrabPart end },
    [4] = { GetPart = function() return Workspace.Plots.Plot4.PlotSign.Sign.Plus.PlusGrabPart end },
    [5] = { GetPart = function() return Workspace.Plots.Plot5.PlotSign.Sign.Plus.PlusGrabPart end }
}

local function Type3_FindEmptyPlot()
    for i = 1, 5 do
        local plot = Workspace.Plots:FindFirstChild("Plot"..i)
        if plot then
            local ownersFolder = plot.PlotSign.ThisPlotsOwners
            if #ownersFolder:GetChildren() == 0 then return i end
            if ownersFolder:FindFirstChild(LocalPlayer.Name) then return i end
            for _, v in pairs(ownersFolder:GetChildren()) do
                if v:IsA("StringValue") and v.Value == LocalPlayer.Name then return i end
            end
        end
    end
    return nil
end

local function Type3_ClaimPlot(index)
    local plotData = Type3_PlotsData[index]
    if not plotData then return false end
    local char = LocalPlayer.Character
    if not char then return false end
    
    local grabPart = plotData.GetPart()
    if not grabPart then return false end
    
    local targetPos = grabPart.CFrame * CFrame.new(0, 3, 0)
    char.HumanoidRootPart.CFrame = targetPos
    task.wait(0.3)
    char.HumanoidRootPart.CFrame = targetPos
    
    Type3.Remotes.claim:FireServer(grabPart, grabPart.CFrame)
    task.wait(1.0)
    
    return true
end

local function Type3_CleanSpam()
    if Type3.ragdollConnection then Type3.ragdollConnection:Disconnect() Type3.ragdollConnection = nil end
    if Type3.sitConnection then Type3.sitConnection:Disconnect() Type3.sitConnection = nil end
end

local function Type3_ForceCleanToys()
    local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if folder then
        for _, t in pairs(folder:GetChildren()) do
            if t.Name == "CreatureBlobman" then
                pcall(function() Type3.Remotes.destroy:FireServer(t) end)
            end
        end
    end
    task.wait(0.1)
end

local function Type3_DestroyAllMyBlobmen()
    local pItems = Workspace:FindFirstChild("PlotItems")
    if pItems then
        for _, plotFolder in pairs(pItems:GetChildren()) do
            for _, child in pairs(plotFolder:GetChildren()) do
                if child.Name == "CreatureBlobman" then
                    pcall(function() child:Destroy() end)
                end
            end
        end
    end
    
    local myFolder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if myFolder then
        for _, child in pairs(myFolder:GetChildren()) do
            if child.Name == "CreatureBlobman" then
                pcall(function() child:Destroy() end)
            end
        end
    end
end

local function Type3_FindGlobalBlobman()
    local myFolder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if myFolder then
        for _, child in pairs(myFolder:GetChildren()) do
            if child.Name == "CreatureBlobman" then
                if child:FindFirstChild("VehicleSeat") or child:FindFirstChild("Seat") then
                    return child
                end
            end
        end
    end

    local pItems = Workspace:FindFirstChild("PlotItems")
    if pItems then
        for _, p in pairs(pItems:GetChildren()) do
            for _, child in pairs(p:GetChildren()) do
                if child.Name == "CreatureBlobman" then
                    if child:FindFirstChild("VehicleSeat") or child:FindFirstChild("Seat") then
                        return child
                    end
                end
            end
        end
    end
    
    return nil
end

local function Type3_PerformGucci(returnToOriginal)
    if Type3.IsGucciRunning then return end
    Type3.IsGucciRunning = true
    
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    
    if not (char and root and hum) then
        Type3.IsGucciRunning = false
        return
    end

    local function SafeReturn()
        if returnToOriginal and Type3.OriginalCFrame then
            char.HumanoidRootPart.CFrame = Type3.OriginalCFrame
        end
        Type3_CleanSpam()
        Type3.IsGucciRunning = false
    end

    Type3_ForceCleanToys()
    
    local spawnPos = root.CFrame * CFrame.new(0, 5, -5)
    
    task.spawn(function()
        Type3.Remotes.spawn:InvokeServer("CreatureBlobman", spawnPos, Vector3.zero)
    end)

    task.wait(0.2)

    local blobman = nil
    local startT = tick()
    
    while (tick() - startT < 3) do
        blobman = Type3_FindGlobalBlobman()
        if blobman then
            local head = blobman:FindFirstChild("Head")
            if head then head.Anchored = true end
            break
        end
        RunService.Heartbeat:Wait()
    end

    if not blobman then
        SafeReturn()
        return
    end

    local seat = blobman:FindFirstChild("VehicleSeat") or blobman:FindFirstChild("Seat")
    if not seat then
        SafeReturn()
        return
    end
    
    if Type3.ragdollConnection then Type3.ragdollConnection:Disconnect() end
    Type3.ragdollConnection = RunService.Heartbeat:Connect(function()
        pcall(function() Type3.Remotes.ragdoll:FireServer(root, 2) end)
    end)

    root.CFrame = seat.CFrame + Vector3.new(0, 2, 0)
    seat:Sit(hum)

    if Type3.sitConnection then Type3.sitConnection:Disconnect() end
    Type3.sitConnection = RunService.Heartbeat:Connect(function()
        if seat and seat.Parent then seat:Sit(hum) end
    end)

    task.wait(0.5)

    hum.Sit = false
    hum.PlatformStand = true
    if seat then
        seat.Disabled = true
        pcall(function() seat:Destroy() end)
    end
    if blobman then
        for _, v in pairs(blobman:GetDescendants()) do
            if v:IsA("Weld") or v:IsA("Snap") then v:Destroy() end
        end
    end

    root.Velocity = Vector3.zero
    hum.PlatformStand = false
    
    SafeReturn()
    
    Library:Notify({ Title = "Anti Gucci", Description = "House Blob Man Gucci (Automatic) 완료!", Time = 2 })
end

local function Type3_StartAutoSequence()
    local char = LocalPlayer.Character
    if not char then return end
    
    if not Type3.OriginalCFrame then
        Type3.OriginalCFrame = char.HumanoidRootPart.CFrame
    end

    local emptyIndex = Type3_FindEmptyPlot()
    if not emptyIndex then
        Library:Notify({ Title = "Anti Gucci", Description = "서버 풀! 빈 플롯 없음", Time = 2 })
        Type3.IsAutoMode = false
        return
    end

    local claimed = Type3_ClaimPlot(emptyIndex)
    if claimed then
        Type3.MyPlotIndex = emptyIndex
        Type3_PerformGucci(true)
    else
        Type3.IsAutoMode = false
    end
end

local function Type3_ConnectDeath(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    
    hum.Died:Connect(function()
        if Type3.IsAutoMode then
            Type3_CleanSpam()
            Type3_DestroyAllMyBlobmen()
            Type3.IsGucciRunning = false
        end
    end)
end

local function Type3_StopSystem()
    Type3.IsAutoMode = false
    Type3_CleanSpam()
    Type3.IsGucciRunning = false
end

pcall(Type3_InitRemotes)

-- ==========================================
-- [[ TYPE 4: House Tractor Gucci (Automatic) - V26 ]]
-- ==========================================
local Type4 = {
    Config = {
        ToyName = "TractorGreen",
        SpawnHeight = 3,
        LockTime = 0.5,
        SpawnDelay = 0.1
    },
    IsAutoMode = false,
    MyPlotIndex = nil,
    OriginalCFrame = nil,
    IsGucciRunning = false,
    ragdollConnection = nil,
    sitConnection = nil,
    seatGuardConnection = nil,
    currentTractor = nil,
    Remotes = {}
}

local function Type4_InitRemotes()
    Type4.Remotes.spawn = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
    Type4.Remotes.ragdoll = ReplicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote")
    Type4.Remotes.destroy = ReplicatedStorage:WaitForChild("MenuToys"):FindFirstChild("DestroyToy")
    Type4.Remotes.claim = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
end

local Type4_PlotsData = {
    [1] = { GetPart = function() return workspace.Plots.Plot1.PlotSign.Sign.Plus.PlusGrabPart end },
    [2] = { GetPart = function() return workspace.Plots.Plot2.PlotSign.Sign.Plus.PlusGrabPart end },
    [3] = { GetPart = function() return workspace.Plots.Plot3.PlotSign.Sign.Plus.PlusGrabPart end },
    [4] = { GetPart = function() return workspace.Plots.Plot4.PlotSign.Sign.Plus.PlusGrabPart end },
    [5] = { GetPart = function() return workspace.Plots.Plot5.PlotSign.Sign.Plus.PlusGrabPart end }
}

local function Type4_FindEmptyPlot()
    for i = 1, 5 do
        local plot = workspace.Plots:FindFirstChild("Plot"..i)
        if plot then
            local owners = plot.PlotSign.ThisPlotsOwners
            if #owners:GetChildren() == 0 then return i end
            if owners:FindFirstChild(LocalPlayer.Name) then return i end
            for _, v in pairs(owners:GetChildren()) do
                if v:IsA("StringValue") and v.Value == LocalPlayer.Name then return i end
            end
        end
    end
    return nil
end

local function Type4_ClaimPlot(index)
    local plotData = Type4_PlotsData[index]
    if not plotData then return false end
    local char = LocalPlayer.Character
    if not char then return false end
    
    local grabPart = plotData.GetPart()
    if not grabPart then return false end
    
    local targetPos = grabPart.CFrame * CFrame.new(0, 3, 0)
    char.HumanoidRootPart.CFrame = targetPos
    task.wait(0.3)
    char.HumanoidRootPart.CFrame = targetPos
    
    Type4.Remotes.claim:FireServer(grabPart, grabPart.CFrame)
    task.wait(1.0)
    
    return true
end

local function Type4_CleanSpam()
    if Type4.ragdollConnection then Type4.ragdollConnection:Disconnect() Type4.ragdollConnection = nil end
    if Type4.sitConnection then Type4.sitConnection:Disconnect() Type4.sitConnection = nil end
end

local function Type4_DestroyAllMyTractors()
    local pItems = workspace:FindFirstChild("PlotItems")
    if pItems then
        for _, plotFolder in pairs(pItems:GetChildren()) do
            for _, child in pairs(plotFolder:GetChildren()) do
                if child.Name == Type4.Config.ToyName then
                    pcall(function() child:Destroy() end)
                end
            end
        end
    end
    
    local myFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if myFolder then
        for _, child in pairs(myFolder:GetChildren()) do
            if child.Name == Type4.Config.ToyName then
                pcall(function() child:Destroy() end)
            end
        end
    end
end

local function Type4_FindMyTractor()
    local myFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if myFolder then
        for _, child in pairs(myFolder:GetChildren()) do
            if child.Name == Type4.Config.ToyName then
                if child:FindFirstChild("VehicleSeat") or child:FindFirstChild("Seat") then
                    return child
                end
            end
        end
    end
    
    local pItems = workspace:FindFirstChild("PlotItems")
    if pItems then
        for _, p in pairs(pItems:GetChildren()) do
            for _, child in pairs(p:GetChildren()) do
                if child.Name == Type4.Config.ToyName then
                    if child:FindFirstChild("VehicleSeat") or child:FindFirstChild("Seat") then
                        return child
                    end
                end
            end
        end
    end
    
    return nil
end

local function Type4_StartSeatGuard(tractor)
    if Type4.seatGuardConnection then Type4.seatGuardConnection:Disconnect() end
    
    Type4.seatGuardConnection = RunService.Heartbeat:Connect(function()
        if not tractor or not tractor.Parent then
            if Type4.seatGuardConnection then
                Type4.seatGuardConnection:Disconnect()
                Type4.seatGuardConnection = nil
            end
            return
        end
        
        for _, part in pairs(tractor:GetDescendants()) do
            if part:IsA("VehicleSeat") or part:IsA("Seat") then
                local occupant = part.Occupant
                if occupant then
                    local player = Players:GetPlayerFromCharacter(occupant.Parent)
                    if player and player ~= LocalPlayer then
                        pcall(function()
                            part:Sit(nil)
                            occupant.Sit = false
                            occupant.PlatformStand = true
                            task.delay(0.1, function()
                                if occupant then occupant.PlatformStand = false end
                            end)
                        end)
                    end
                end
                pcall(function() part.Disabled = true end)
            end
        end
    end)
end

local function Type4_PerformGucci()
    if Type4.IsGucciRunning then return end
    Type4.IsGucciRunning = true
    
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    
    if not (char and root and hum) then
        Type4.IsGucciRunning = false
        return
    end
    
    if Type4.seatGuardConnection then
        Type4.seatGuardConnection:Disconnect()
        Type4.seatGuardConnection = nil
    end
    
    local spawnPos = root.CFrame * CFrame.new(0, 5, -8)
    task.spawn(function()
        Type4.Remotes.spawn:InvokeServer(Type4.Config.ToyName, spawnPos, Vector3.zero)
    end)
    
    task.wait(Type4.Config.SpawnDelay)
    
    local tractor = nil
    local startT = tick()
    while tick() - startT < 3 do
        tractor = Type4_FindMyTractor()
        if tractor then break end
        RunService.Heartbeat:Wait()
    end
    
    if not tractor then
        if Type4.OriginalCFrame then root.CFrame = Type4.OriginalCFrame end
        Type4_CleanSpam()
        Type4.IsGucciRunning = false
        return
    end
    
    Type4.currentTractor = tractor
    
    local mainPart = tractor:FindFirstChild("Main")
    if mainPart then mainPart.Anchored = true end
    
    local seat = tractor:FindFirstChild("VehicleSeat") or tractor:FindFirstChild("Seat")
    if not seat then
        seat = tractor:WaitForChild("VehicleSeat", 2)
    end
    if not seat then
        if Type4.OriginalCFrame then root.CFrame = Type4.OriginalCFrame end
        Type4_CleanSpam()
        Type4.IsGucciRunning = false
        return
    end
    seat.Anchored = true
    
    if Type4.ragdollConnection then Type4.ragdollConnection:Disconnect() end
    Type4.ragdollConnection = RunService.Heartbeat:Connect(function()
        pcall(function() Type4.Remotes.ragdoll:FireServer(root, 2) end)
    end)
    
    root.CFrame = seat.CFrame + Vector3.new(0, 3, 0)
    seat:Sit(hum)
    
    if Type4.sitConnection then Type4.sitConnection:Disconnect() end
    Type4.sitConnection = RunService.Heartbeat:Connect(function()
        if seat and seat.Parent then seat:Sit(hum) end
    end)
    
    task.wait(Type4.Config.LockTime)
    
    hum.Sit = false
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    if seat then seat.Disabled = true end
    
    if Type4.OriginalCFrame then
        root.CFrame = Type4.OriginalCFrame
    end
    root.Velocity = Vector3.zero
    
    task.wait(0.5)
    Type4_CleanSpam()
    
    Type4_StartSeatGuard(tractor)
    
    Type4.IsGucciRunning = false
    
    Library:Notify({ Title = "Anti Gucci", Description = "House Tractor Gucci (Automatic) 완료!", Time = 2 })
end

local function Type4_StartAutoSequence()
    local char = LocalPlayer.Character
    if not char then return end
    
    if not Type4.OriginalCFrame then
        Type4.OriginalCFrame = char.HumanoidRootPart.CFrame
    end
    
    local emptyIndex = Type4_FindEmptyPlot()
    if not emptyIndex then
        Library:Notify({ Title = "Anti Gucci", Description = "서버 풀! 빈 플롯 없음", Time = 2 })
        Type4.IsAutoMode = false
        return
    end
    
    local claimed = Type4_ClaimPlot(emptyIndex)
    if claimed then
        Type4.MyPlotIndex = emptyIndex
        Type4_PerformGucci()
    else
        Type4.IsAutoMode = false
    end
end

local function Type4_ConnectDeath(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    
    hum.Died:Connect(function()
        if Type4.IsAutoMode then
            Type4_CleanSpam()
            if Type4.seatGuardConnection then Type4.seatGuardConnection:Disconnect() Type4.seatGuardConnection = nil end
            Type4_DestroyAllMyTractors()
            Type4.IsGucciRunning = false
            Type4.currentTractor = nil
        end
    end)
end

local function Type4_StopSystem()
    Type4.IsAutoMode = false
    Type4_CleanSpam()
    if Type4.seatGuardConnection then Type4.seatGuardConnection:Disconnect() Type4.seatGuardConnection = nil end
    Type4.IsGucciRunning = false
end

pcall(Type4_InitRemotes)
-- ==========================================
-- [[ TYPE 5: Tractor Gucci (Automatic) - V60 ]]
-- ==========================================
local Type5 = {
    Config = {
        ToyName = "TractorGreen",
        SpawnCFrame = CFrame.new(596.77, -7.35, 113.57) * CFrame.Angles(-1.9568651914596558, 0.5194976329803467, 2.2568700313568115),
        SpawnVector = Vector3.new(0, 123.36199951171875, 0)
    },
    systemOn = false,
    autoRespawnEnabled = false,
    currentSeat = nil,
    currentTractor = nil,
    ragdollConnection = nil,
    sitConnection = nil,
    seatGuardConnection = nil,
    Remotes = { ragdoll = nil, spawn = nil, destroy = nil }
}

local function Type5_CacheRemotes()
    if not Type5.Remotes.ragdoll then
        local charEvents = ReplicatedStorage:WaitForChild("CharacterEvents", 5)
        if charEvents then Type5.Remotes.ragdoll = charEvents:FindFirstChild("RagdollRemote") end
    end
    if not Type5.Remotes.spawn or not Type5.Remotes.destroy then
        local menuToys = ReplicatedStorage:WaitForChild("MenuToys", 5)
        if menuToys then
            Type5.Remotes.spawn = menuToys:WaitForChild("SpawnToyRemoteFunction", 5)
            Type5.Remotes.destroy = menuToys:FindFirstChild("DestroyToy")
        end
    end
end

local function Type5_StartRagdollSpam(rootPart)
    if Type5.ragdollConnection then Type5.ragdollConnection:Disconnect() end
    if not Type5.Remotes.ragdoll then return end
    Type5.ragdollConnection = RunService.Heartbeat:Connect(function()
        if not Type5.systemOn or not rootPart then return end
        pcall(function() Type5.Remotes.ragdoll:FireServer(rootPart, 2) end)
    end)
end

local function Type5_StartSitSpam(humanoid, seat)
    if Type5.sitConnection then Type5.sitConnection:Disconnect() end
    Type5.sitConnection = RunService.Heartbeat:Connect(function()
        if not Type5.systemOn or not seat or not seat.Parent then return end
        seat:Sit(humanoid)
    end)
end

local function Type5_CleanUpOldToys()
    if not Type5.Remotes.destroy then return end
    local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if not folder then return end
    for _, toy in pairs(folder:GetChildren()) do
        if toy.Name == Type5.Config.ToyName then
            pcall(function() Type5.Remotes.destroy:FireServer(toy) end)
        end
    end
end

local function Type5_StartSeatGuard(tractor)
    if Type5.seatGuardConnection then Type5.seatGuardConnection:Disconnect() end
    Type5.seatGuardConnection = RunService.Heartbeat:Connect(function()
        if not tractor or not tractor.Parent then
            if Type5.seatGuardConnection then Type5.seatGuardConnection:Disconnect() Type5.seatGuardConnection = nil end
            return
        end
        for _, part in pairs(tractor:GetDescendants()) do
            if part:IsA("VehicleSeat") or part:IsA("Seat") then
                local occupant = part.Occupant
                if occupant then
                    local player = Players:GetPlayerFromCharacter(occupant.Parent)
                    if player and player ~= LocalPlayer then
                        pcall(function()
                            part:Sit(nil)
                            occupant.Sit = false
                            occupant.PlatformStand = true
                            task.delay(0.1, function() if occupant then occupant.PlatformStand = false end end)
                        end)
                    end
                end
                pcall(function() part.Disabled = true end)
            end
        end
    end)
end

local function Type5_RunStableGucci()
    if Type5.systemOn then return end
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid", 3)
    local root = char:WaitForChild("HumanoidRootPart", 3)
    if not (hum and root) then Type5.systemOn = false return end
    
    Type5.systemOn = true
    if Type5.seatGuardConnection then Type5.seatGuardConnection:Disconnect() Type5.seatGuardConnection = nil end
    Type5_CleanUpOldToys()
    local savedCFrame = root.CFrame
    
    task.spawn(function()
        if Type5.Remotes.spawn then
            Type5.Remotes.spawn:InvokeServer(Type5.Config.ToyName, Type5.Config.SpawnCFrame, Type5.Config.SpawnVector)
        end
    end)
    
    local tractor = nil
    local folder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 5)
    if not folder then Type5.systemOn = false return end
    
    local startTick = tick()
    while not tractor and tick() - startTick < 3 do
        local target = folder:FindFirstChild(Type5.Config.ToyName)
        if target then tractor = target break end
        RunService.Heartbeat:Wait()
    end
    
    if not tractor then Type5.systemOn = false return end
    Type5.currentTractor = tractor
    
    local mainPart = tractor:FindFirstChild("Main")
    if mainPart then mainPart.Anchored = true end
    
    local seat = tractor:WaitForChild("VehicleSeat", 2)
    if not seat then Type5.systemOn = false return end
    seat.Anchored = true
    Type5.currentSeat = seat
    
    Type5_StartRagdollSpam(root)
    root.CFrame = seat.CFrame + Vector3.new(0, 3, 0)
    seat:Sit(hum)
    Type5_StartSitSpam(hum, seat)
    
    task.wait(0.6)
    hum.Sit = false
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    if seat then seat.Disabled = true end
    
    if tractor then
        for _, v in pairs(tractor:GetDescendants()) do
            if v:IsA("Weld") or v:IsA("Snap") or v:IsA("WeldConstraint") then v:Destroy() end
        end
    end
    
    root.CFrame = savedCFrame
    root.Velocity = Vector3.zero
    task.wait(0.5)
    
    if Type5.sitConnection then Type5.sitConnection:Disconnect() Type5.sitConnection = nil end
    if Type5.ragdollConnection then Type5.ragdollConnection:Disconnect() Type5.ragdollConnection = nil end
    Type5_StartSeatGuard(tractor)
    
    task.wait(0.5)
    Type5.systemOn = false
    Library:Notify({ Title = "Anti Gucci", Description = "Tractor Gucci (Automatic) 완료!", Time = 2 })
end

local function Type5_StopSystem()
    Type5.systemOn = false
    Type5.autoRespawnEnabled = false
    Type5.currentSeat = nil
    Type5.currentTractor = nil
    if Type5.ragdollConnection then Type5.ragdollConnection:Disconnect() Type5.ragdollConnection = nil end
    if Type5.sitConnection then Type5.sitConnection:Disconnect() Type5.sitConnection = nil end
    if Type5.seatGuardConnection then Type5.seatGuardConnection:Disconnect() Type5.seatGuardConnection = nil end
end

local function Type5_ConnectDeathEvent(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    hum.Died:Connect(function()
        if Type5.autoRespawnEnabled then
            Type5.systemOn = false
            if Type5.seatGuardConnection then Type5.seatGuardConnection:Disconnect() end
            Type5_CleanUpOldToys()
        end
    end)
end

Type5_CacheRemotes()

-- ==========================================
-- [[ TYPE 6: Train Gucci (Automatic) - Train V2 ]]
-- ==========================================
local Type6 = {
    systemOn = false,
    autoRespawnEnabled = false,
    ragdollConnection = nil,
    sitConnection = nil
}

local function Type6_startRagdollSpam(rootPart)
    if Type6.ragdollConnection then Type6.ragdollConnection:Disconnect() end
    local ragdollRemote = ReplicatedStorage:WaitForChild("CharacterEvents"):FindFirstChild("RagdollRemote")
    Type6.ragdollConnection = RunService.Heartbeat:Connect(function()
        if not Type6.systemOn then return end
        if rootPart and ragdollRemote then
            pcall(function() ragdollRemote:FireServer(rootPart, 0) end)
        end
    end)
end

local function Type6_startSitSpam(humanoid, seat)
    if Type6.sitConnection then Type6.sitConnection:Disconnect() end
    Type6.sitConnection = RunService.Heartbeat:Connect(function()
        if not Type6.systemOn then return end
        if seat and seat.Parent then seat:Sit(humanoid) end
    end)
end

local function Type6_runTrainGucci()
    if Type6.systemOn then return end
    Type6.systemOn = true
    
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid", 3)
    local root = char:WaitForChild("HumanoidRootPart", 3)
    if not (hum and root) then Type6.systemOn = false return end
    
    local savedCFrame = root.CFrame
    local trainModel = Workspace:FindFirstChild("Map")
        and Workspace.Map:FindFirstChild("AlwaysHereTweenedObjects")
        and Workspace.Map.AlwaysHereTweenedObjects:FindFirstChild("Train")
        and Workspace.Map.AlwaysHereTweenedObjects.Train:FindFirstChild("Object")
        and Workspace.Map.AlwaysHereTweenedObjects.Train.Object:FindFirstChild("ObjectModel")
    
    if not trainModel then
        Library:Notify({ Title = "Anti Gucci", Description = "오류: 기차 없음", Time = 2 })
        Type6.systemOn = false
        return
    end
    
    local targetSeat = nil
    for _, child in pairs(trainModel:GetChildren()) do
        if child.Name == "Seat" and child:IsA("Seat") then targetSeat = child break end
    end
    
    if not targetSeat then
        Library:Notify({ Title = "Anti Gucci", Description = "오류: 의자 없음", Time = 2 })
        Type6.systemOn = false
        return
    end
    
    root.CFrame = targetSeat.CFrame + Vector3.new(0, 2, 0)
    targetSeat:Sit(hum)
    Type6_startRagdollSpam(root)
    Type6_startSitSpam(hum, targetSeat)
    
    task.wait(0.2)
    if Type6.sitConnection then Type6.sitConnection:Disconnect() Type6.sitConnection = nil end
    targetSeat.Disabled = true
    hum.Sit = false
    
    local weld = targetSeat:FindFirstChild("SeatWeld")
    if weld then weld:Destroy() end
    
    for _, part in pairs(trainModel:GetDescendants()) do
        if part:IsA("BasePart") then part.Anchored = true end
    end
    
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    root.CFrame = savedCFrame
    root.Velocity = Vector3.zero
    
    task.wait(1)
    if Type6.ragdollConnection then Type6.ragdollConnection:Disconnect() Type6.ragdollConnection = nil end
    Type6.systemOn = false
    Library:Notify({ Title = "Anti Gucci", Description = "Train Gucci (Automatic) 완료!", Time = 2 })
end

local function Type6_stopSystem()
    Type6.systemOn = false
    Type6.autoRespawnEnabled = false
    if Type6.ragdollConnection then Type6.ragdollConnection:Disconnect() Type6.ragdollConnection = nil end
    if Type6.sitConnection then Type6.sitConnection:Disconnect() Type6.sitConnection = nil end
end

-- ==========================================
-- [[ ANTI BLOBMAN KILL - V16 ]]
-- ==========================================
local AntiBlobmanKill = {
    isEnabled = false,
    connections = {},
    SanctuaryCFrame = nil,
    moveSpeed = 16
}

local function AntiBlobmanKill_LockValue(valueObj)
    if not valueObj then return end
    if valueObj:GetAttribute("IsLocked") then return end
    valueObj:SetAttribute("IsLocked", true)
    local changeConn = valueObj:GetPropertyChangedSignal("Value"):Connect(function()
        if AntiBlobmanKill.isEnabled and valueObj.Value == false then valueObj.Value = true end
    end)
    table.insert(AntiBlobmanKill.connections, changeConn)
end

local function AntiBlobmanKill_StartRemoteWar()
    local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents", 5)
    local SetOwnerRemote = GrabEvents and GrabEvents:FindFirstChild("SetNetworkOwner")
    local stepConn = RunService.Stepped:Connect(function()
        if not AntiBlobmanKill.isEnabled or not SetOwnerRemote then return end
        local Char = LocalPlayer.Character
        if not Char then return end
        local Root = Char:FindFirstChild("HumanoidRootPart")
        if not AntiBlobmanKill.SanctuaryCFrame and Root then
            AntiBlobmanKill.SanctuaryCFrame = Root.CFrame
        end
        if Root and AntiBlobmanKill.SanctuaryCFrame then
            pcall(function()
                SetOwnerRemote:FireServer(Root, AntiBlobmanKill.SanctuaryCFrame)
                local Torso = Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
                if Torso then SetOwnerRemote:FireServer(Torso, AntiBlobmanKill.SanctuaryCFrame) end
            end)
        end
    end)
    table.insert(AntiBlobmanKill.connections, stepConn)
end

local function AntiBlobmanKill_StartWatchdog()
    local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents", 5)
    local SetOwnerRemote = GrabEvents and GrabEvents:FindFirstChild("SetNetworkOwner")
    local heartConn = RunService.Heartbeat:Connect(function()
        if not AntiBlobmanKill.isEnabled then return end
        local Char = LocalPlayer.Character
        if not Char then return end
        local Root = Char:FindFirstChild("HumanoidRootPart")
        if Root and AntiBlobmanKill.SanctuaryCFrame then
            local dist = (Root.Position - AntiBlobmanKill.SanctuaryCFrame.Position).Magnitude
            if dist > 5 then
                Root.CFrame = AntiBlobmanKill.SanctuaryCFrame
                Root.AssemblyLinearVelocity = Vector3.zero
                if SetOwnerRemote then
                    for i = 1, 3 do SetOwnerRemote:FireServer(Root, AntiBlobmanKill.SanctuaryCFrame) end
                end
            end
        end
    end)
    table.insert(AntiBlobmanKill.connections, heartConn)
end

local function AntiBlobmanKill_StartGhostMove()
    local renderConn = RunService.RenderStepped:Connect(function(dt)
        if not AntiBlobmanKill.isEnabled then return end
        local Char = LocalPlayer.Character
        if not Char then return end
        local Root = Char:FindFirstChild("HumanoidRootPart")
        local Hum = Char:FindFirstChild("Humanoid")
        local Cam = workspace.CurrentCamera
        if Root and Hum and Cam then
            Hum.PlatformStand = true
            Hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            Hum:SetStateEnabled(Enum.HumanoidStateType.Running, false)
            Hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            local moveDir = Vector3.zero
            local forward = Vector3.new(Cam.CFrame.LookVector.X, 0, Cam.CFrame.LookVector.Z).Unit
            local right = Vector3.new(Cam.CFrame.RightVector.X, 0, Cam.CFrame.RightVector.Z).Unit
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + forward end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - forward end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + right end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - right end
            if moveDir.Magnitude > 0 then
                local nextPos = Root.CFrame + (moveDir * AntiBlobmanKill.moveSpeed * dt)
                Root.CFrame = CFrame.new(nextPos.Position) * Root.CFrame.Rotation
                Root.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end)
    table.insert(AntiBlobmanKill.connections, renderConn)
end

local function AntiBlobmanKill_StartDefense()
    if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
        AntiBlobmanKill.SanctuaryCFrame = LocalPlayer.Character.PrimaryPart.CFrame
    end
    AntiBlobmanKill_StartRemoteWar()
    AntiBlobmanKill_StartWatchdog()
    AntiBlobmanKill_StartGhostMove()
    local mainLoop = RunService.Heartbeat:Connect(function()
        if not AntiBlobmanKill.isEnabled then return end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(LocalPlayer.Character.HumanoidRootPart, 9999999)
            end)
        end
        local Char = LocalPlayer.Character
        if Char then
            local IsHeld = Char:FindFirstChild("IsHeld") or LocalPlayer:FindFirstChild("IsHeld")
            if IsHeld then
                AntiBlobmanKill_LockValue(IsHeld)
                if IsHeld.Value == false then IsHeld.Value = true end
            end
        end
    end)
    table.insert(AntiBlobmanKill.connections, mainLoop)
end

local function AntiBlobmanKill_Toggle(state)
    AntiBlobmanKill.isEnabled = state
    if AntiBlobmanKill.isEnabled then
        AntiBlobmanKill_StartDefense()
    else
        for _, conn in pairs(AntiBlobmanKill.connections) do conn:Disconnect() end
        AntiBlobmanKill.connections = {}
        AntiBlobmanKill.SanctuaryCFrame = nil
        if LocalPlayer.Character then
            local Hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if Hum then
                Hum.PlatformStand = false
                Hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                Hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
            local Root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if Root then
                pcall(function()
                    ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(Root, 0)
                end)
                Root.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end
end

-- ==========================================
-- [[ ANTI LOOP - V6.3 ]]
-- ==========================================
local AntiLoop = {
    TargetCFrame = nil,
    Enabled = false,
    Radius = 8,
    StepCount = 8,
    Speed = 40,
    Connection = nil
}

local function AntiLoop_LockPosition()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        AntiLoop.TargetCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        Library:Notify({ Title = "Anti Loop", Description = "Position Locked!", Time = 2 })
        return true
    end
    return false
end

local function AntiLoop_Start()
    if AntiLoop.Connection then AntiLoop.Connection:Disconnect() end
    AntiLoop.Connection = RunService.Heartbeat:Connect(function()
        if not AntiLoop.Enabled or not AntiLoop.TargetCFrame then return end
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local stepAngle = (360 / AntiLoop.StepCount)
            local currentStep = math.floor(tick() * AntiLoop.Speed) % AntiLoop.StepCount
            local angle = math.rad(currentStep * stepAngle)
            local offset = Vector3.new(math.cos(angle) * AntiLoop.Radius, 0, math.sin(angle) * AntiLoop.Radius)
            pcall(function()
                hrp.CFrame = AntiLoop.TargetCFrame + offset
                hrp.Velocity = Vector3.zero
                hrp.RotVelocity = Vector3.zero
                if math.random(1, 2) == 1 then
                    hrp.CFrame = hrp.CFrame * CFrame.new(0, 500, 0)
                end
            end)
        end
    end)
end

local function AntiLoop_Stop()
    if AntiLoop.Connection then AntiLoop.Connection:Disconnect() AntiLoop.Connection = nil end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp and AntiLoop.TargetCFrame then
        hrp.CFrame = AntiLoop.TargetCFrame
        hrp.Velocity = Vector3.zero
        hrp.RotVelocity = Vector3.zero
    end
end

local function AntiLoop_Toggle(state)
    AntiLoop.Enabled = state
    if AntiLoop.Enabled then
        if not AntiLoop.TargetCFrame then
            Library:Notify({ Title = "Anti Loop", Description = "먼저 Lock Position을 눌러주세요!", Time = 2 })
            AntiLoop.Enabled = false
            return false
        end
        AntiLoop_Start()
    else
        AntiLoop_Stop()
    end
    return true
end
-- ==========================================
-- [[ SPAM SET OWNER - Kick Grab V48+ v16 ]]
-- ==========================================
local SpamSetOwner = {
    Target = nil,
    Looping = false,
    AutoRagdoll = false,
    OffsetX = 0,
    OffsetY = 0,
    OffsetZ = 0,
    DetentionDist = 19,
    Mode = "Up",
    Segments = 8,
    ImpactPower = 10,
    FetchTime = 0.5,
    RecoverTime = 0.3,
    SyncThreshold = 10,
    StuckCheckFrames = 60,
    ApproachThreshold = 0.5,
    RecoverCooldown = 120,
    RenderConnection = nil,
    CurrentPallet = nil
}

local function SpamSetOwner_GetRemote(name)
    if name == "Spawn" then return ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction") end
    if name == "DestroyToy" then return ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy") end
    local grabEvents = ReplicatedStorage:FindFirstChild("GrabEvents")
    if not grabEvents then return nil end
    if name == "SetOwner" then return grabEvents:FindFirstChild("SetNetworkOwner") end
    if name == "DestroyGrab" then return grabEvents:FindFirstChild("DestroyGrabLine") end
    return nil
end

local function SpamSetOwner_EnforcePosition(targetRoot, targetChar, goalCFrame)
    if not targetRoot then return end
    targetRoot.CFrame = goalCFrame
    targetRoot.AssemblyLinearVelocity = Vector3.zero
    targetRoot.AssemblyAngularVelocity = Vector3.zero
    for _, part in pairs(targetChar:GetDescendants()) do
        if part:IsA("BasePart") then
            part.AssemblyLinearVelocity = Vector3.zero
            part.AssemblyAngularVelocity = Vector3.zero
        end
    end
end

local function SpamSetOwner_FindDetectorByHRP(targetHrp)
    local targetPos = targetHrp.CFrame.Position
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj.Name == "PlayerCharacterLocationDetector" and obj:IsA("BasePart") then
            local dist = (targetPos - obj.CFrame.Position).Magnitude
            if dist < 1 then return obj end
        end
    end
    return nil
end

local function SpamSetOwner_ExecuteKickGrabLoop()
    local frameToggle = true
    local hasClaimed = false
    local isRecovering = false
    local recoveryCooldown = 0
    local targetPLCDDetector = nil
    local detectorLocked = false
    local initialFetchDone = false
    local lastTargetChar = nil
    local lastHrpPlcdDist = math.huge
    local stuckCounter = 0

    SpamSetOwner.RenderConnection = RunService.RenderStepped:Connect(function()
        if not SpamSetOwner.Looping or not SpamSetOwner.Target then return end
        if isRecovering or not hasClaimed then return end
        local tChar = SpamSetOwner.Target.Character
        if not tChar then return end
        local tHrp = tChar:FindFirstChild("HumanoidRootPart")
        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local cam = workspace.CurrentCamera
        if tHrp and myHrp and cam then
            local baseCFrame
            if SpamSetOwner.Mode == "Up" then baseCFrame = myHrp.CFrame * CFrame.new(0, 18, 0)
            elseif SpamSetOwner.Mode == "Down" then baseCFrame = myHrp.CFrame * CFrame.new(0, -10, 0)
            else baseCFrame = cam.CFrame * CFrame.new(0, 0, -SpamSetOwner.DetentionDist) end
            local finalPos = baseCFrame * CFrame.new(SpamSetOwner.OffsetX, SpamSetOwner.OffsetY, SpamSetOwner.OffsetZ)
            SpamSetOwner_EnforcePosition(tHrp, tChar, finalPos)
        end
    end)

    while SpamSetOwner.Looping do
        RunService.Heartbeat:Wait()
        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local target = SpamSetOwner.Target
        local targetChar = target and target.Character
        local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        local cam = workspace.CurrentCamera

        if myHrp and targetHrp and targetChar.Parent and cam then
            local rOwner = SpamSetOwner_GetRemote("SetOwner")
            local rDestroy = SpamSetOwner_GetRemote("DestroyGrab")
            local vitalParts = {targetHrp, targetChar:FindFirstChild("Torso"), targetChar:FindFirstChild("UpperTorso"), targetChar:FindFirstChild("LowerTorso")}

            if lastTargetChar ~= nil and lastTargetChar ~= targetChar then
                hasClaimed = false isRecovering = false recoveryCooldown = 0
                targetPLCDDetector = nil detectorLocked = false initialFetchDone = false
                lastHrpPlcdDist = math.huge stuckCounter = 0
            end
            lastTargetChar = targetChar
            if recoveryCooldown > 0 then recoveryCooldown = recoveryCooldown - 1 end

            local plcdDist = math.huge
            if detectorLocked and targetPLCDDetector and targetPLCDDetector.Parent then
                plcdDist = (myHrp.Position - targetPLCDDetector.CFrame.Position).Magnitude
            end
            local hrpPlcdDist = math.huge
            if detectorLocked and targetPLCDDetector and targetPLCDDetector.Parent then
                hrpPlcdDist = (targetHrp.Position - targetPLCDDetector.CFrame.Position).Magnitude
            end

            local isStuck = false
            if detectorLocked and hrpPlcdDist ~= math.huge then
                if recoveryCooldown > 0 then stuckCounter = 0
                else
                    if lastHrpPlcdDist - hrpPlcdDist > SpamSetOwner.ApproachThreshold then stuckCounter = 0
                    else stuckCounter = stuckCounter + 1 end
                    if stuckCounter >= SpamSetOwner.StuckCheckFrames then isStuck = true end
                end
                lastHrpPlcdDist = hrpPlcdDist
            end

            if not detectorLocked and hasClaimed then
                local detector = SpamSetOwner_FindDetectorByHRP(targetHrp)
                if detector then targetPLCDDetector = detector detectorLocked = true lastHrpPlcdDist = math.huge stuckCounter = 0 end
            end

            if not initialFetchDone and not hasClaimed and not isRecovering and rOwner then
                initialFetchDone = true isRecovering = true
                local originalCFrame = myHrp.CFrame
                local detector = SpamSetOwner_FindDetectorByHRP(targetHrp)
                if detector then targetPLCDDetector = detector detectorLocked = true end
                myHrp.CFrame = targetHrp.CFrame
                local fetchStart = tick()
                while tick() - fetchStart < SpamSetOwner.FetchTime do
                    if not SpamSetOwner.Looping then break end
                    myHrp.CFrame = targetHrp.CFrame
                    for _, part in pairs(vitalParts) do if part then rOwner:FireServer(part, part.CFrame) end end
                    RunService.Heartbeat:Wait()
                end
                myHrp.CFrame = originalCFrame
                hasClaimed = true isRecovering = false recoveryCooldown = SpamSetOwner.RecoverCooldown
                lastHrpPlcdDist = math.huge stuckCounter = 0
            end

            if detectorLocked and plcdDist > 25 and not isRecovering and recoveryCooldown <= 0 then
                isRecovering = true hasClaimed = false
                local originalCFrame = myHrp.CFrame
                myHrp.CFrame = targetPLCDDetector.CFrame
                local recoverStart = tick()
                while tick() - recoverStart < SpamSetOwner.RecoverTime do
                    if not SpamSetOwner.Looping then break end
                    myHrp.CFrame = targetPLCDDetector.CFrame
                    for _, part in pairs(vitalParts) do if part then rOwner:FireServer(part, part.CFrame) end end
                    RunService.Heartbeat:Wait()
                end
                myHrp.CFrame = originalCFrame
                hasClaimed = true isRecovering = false recoveryCooldown = SpamSetOwner.RecoverCooldown
                lastHrpPlcdDist = math.huge stuckCounter = 0
            end

            if detectorLocked and plcdDist <= 25 and hrpPlcdDist > SpamSetOwner.SyncThreshold and isStuck and not isRecovering and recoveryCooldown <= 0 and hasClaimed then
                isRecovering = true
                local originalCFrame = myHrp.CFrame
                myHrp.CFrame = targetPLCDDetector.CFrame
                local recoverStart = tick()
                while tick() - recoverStart < SpamSetOwner.RecoverTime do
                    if not SpamSetOwner.Looping then break end
                    myHrp.CFrame = targetPLCDDetector.CFrame
                    for _, part in pairs(vitalParts) do if part then rOwner:FireServer(part, part.CFrame) end end
                    RunService.Heartbeat:Wait()
                end
                myHrp.CFrame = originalCFrame
                isRecovering = false recoveryCooldown = SpamSetOwner.RecoverCooldown
                lastHrpPlcdDist = math.huge stuckCounter = 0
            end

            if not isRecovering and hasClaimed and rOwner and rDestroy then
                local baseCFrame
                if SpamSetOwner.Mode == "Up" then baseCFrame = myHrp.CFrame * CFrame.new(0, 18, 0)
                elseif SpamSetOwner.Mode == "Down" then baseCFrame = myHrp.CFrame * CFrame.new(0, -10, 0)
                else baseCFrame = cam.CFrame * CFrame.new(0, 0, -SpamSetOwner.DetentionDist) end
                local finalPos = baseCFrame * CFrame.new(SpamSetOwner.OffsetX, SpamSetOwner.OffsetY, SpamSetOwner.OffsetZ)
                if frameToggle then
                    for _, part in pairs(vitalParts) do if part then rOwner:FireServer(part, finalPos) end end
                else
                    for _, part in pairs(vitalParts) do if part then rDestroy:FireServer(part) end end
                end
                frameToggle = not frameToggle
            end
        else
            hasClaimed = false targetPLCDDetector = nil detectorLocked = false
            recoveryCooldown = 0 initialFetchDone = false lastTargetChar = nil
            lastHrpPlcdDist = math.huge stuckCounter = 0
        end
    end
    if SpamSetOwner.RenderConnection then SpamSetOwner.RenderConnection:Disconnect() SpamSetOwner.RenderConnection = nil end
end

local function SpamSetOwner_StartKick()
    if SpamSetOwner.Looping then return false end
    if not SpamSetOwner.Target then
        Library:Notify({ Title = "Spam SetOwner", Description = "타겟을 먼저 선택하세요!", Time = 2 })
        return false
    end
    SpamSetOwner.Looping = true
    task.spawn(SpamSetOwner_ExecuteKickGrabLoop)
    return true
end

local function SpamSetOwner_StopKick()
    SpamSetOwner.Looping = false
    if SpamSetOwner.RenderConnection then SpamSetOwner.RenderConnection:Disconnect() SpamSetOwner.RenderConnection = nil end
end

local function SpamSetOwner_StartPalletLifecycle()
    task.spawn(function()
        local rSpawn = SpamSetOwner_GetRemote("Spawn")
        if rSpawn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            task.spawn(function() rSpawn:InvokeServer("PalletLightBrown", LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0), Vector3.zero) end)
        end
        local toyFolder = workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 5)
        if not toyFolder then return end
        local palletModel = toyFolder:WaitForChild("PalletLightBrown", 5)
        if not palletModel then return end
        local palletPart = palletModel:WaitForChild("SoundPart", 5)
        if not palletPart then return end
        SpamSetOwner.CurrentPallet = palletModel
        local rOwner = SpamSetOwner_GetRemote("SetOwner")
        if rOwner then rOwner:FireServer(palletPart, palletPart.CFrame) end
        local hammerGoingDown = true
        local segmentIndex = 0
        local lastOwnerTime = tick()
        while SpamSetOwner.AutoRagdoll and palletModel.Parent do
            RunService.Heartbeat:Wait()
            local targetChar = SpamSetOwner.Target and SpamSetOwner.Target.Character
            local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            if targetHrp and rOwner then
                if tick() - lastOwnerTime > 1.0 then rOwner:FireServer(palletPart, palletPart.CFrame) lastOwnerTime = tick() end
                local startPos = targetHrp.Position + Vector3.new(0, 50000, 0)
                local endPos = targetHrp.Position
                if hammerGoingDown then
                    segmentIndex = segmentIndex + 1
                    local alpha = segmentIndex / SpamSetOwner.Segments
                    local nextPos = startPos:Lerp(endPos, alpha)
                    palletPart.CFrame = CFrame.new(nextPos)
                    palletPart.AssemblyLinearVelocity = Vector3.new(0, -50000, 0)
                    palletPart.AssemblyAngularVelocity = Vector3.zero
                    if segmentIndex >= SpamSetOwner.Segments then
                        palletPart.AssemblyLinearVelocity = Vector3.new(0, -SpamSetOwner.ImpactPower, 0)
                        hammerGoingDown = false
                    end
                else
                    palletPart.CFrame = CFrame.new(startPos)
                    palletPart.AssemblyLinearVelocity = Vector3.zero
                    segmentIndex = 0
                    hammerGoingDown = true
                end
            else
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    palletPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                    palletPart.AssemblyLinearVelocity = Vector3.zero
                end
            end
        end
        local rDestroy = SpamSetOwner_GetRemote("DestroyToy")
        if rDestroy and palletModel then rDestroy:FireServer(palletModel) end
        SpamSetOwner.CurrentPallet = nil
    end)
end

local function SpamSetOwner_StartRagdoll()
    if SpamSetOwner.AutoRagdoll then return false end
    if not SpamSetOwner.Target then
        Library:Notify({ Title = "Spam SetOwner", Description = "타겟을 먼저 선택하세요!", Time = 2 })
        return false
    end
    SpamSetOwner.AutoRagdoll = true
    SpamSetOwner_StartPalletLifecycle()
    return true
end

local function SpamSetOwner_StopRagdoll()
    SpamSetOwner.AutoRagdoll = false
end

-- ==========================================
-- [[ SET OWNER AURA - V4 ]]
-- ==========================================
local SetOwnerAura = {
    Enabled = false,
    Type = "Circle",
    DetectRange = 20,
    CircleRadius = 10,
    CircleHeight = 5,
    BlackholeHeight = 8,
    SpeedThreshold = 2,
    Connection = nil,
    Cache = { Remote = nil, DestroyRemote = nil, Players = {}, LastUpdate = 0 }
}

local function SetOwnerAura_CacheRemotes()
    local f = ReplicatedStorage:FindFirstChild("GrabEvents")
    if f then
        SetOwnerAura.Cache.Remote = f:FindFirstChild("SetNetworkOwner")
        SetOwnerAura.Cache.DestroyRemote = f:FindFirstChild("DestroyGrabLine")
    end
end

local function SetOwnerAura_UpdatePlayerCache()
    if tick() - SetOwnerAura.Cache.LastUpdate < 0.5 then return end
    SetOwnerAura.Cache.Players = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(SetOwnerAura.Cache.Players, p) end
    end
    SetOwnerAura.Cache.LastUpdate = tick()
end

local function SetOwnerAura_Start()
    if SetOwnerAura.Connection then SetOwnerAura.Connection:Disconnect() end
    SetOwnerAura_CacheRemotes()
    if not SetOwnerAura.Cache.Remote then
        Library:Notify({ Title = "Set Owner Aura", Description = "Remote 없음!", Time = 2 })
        return false
    end
    local lastMyPos = Vector3.zero
    local frameCount = 0
    local frameToggle = true
    local pi2 = 2 * math.pi
    SetOwnerAura.Connection = RunService.Heartbeat:Connect(function()
        if not SetOwnerAura.Enabled then return end
        frameCount = frameCount + 1
        if frameCount % 2 ~= 0 then return end
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myHrp = myChar:FindFirstChild("HumanoidRootPart")
        if not myHrp then return end
        SetOwnerAura_UpdatePlayerCache()
        local currentMyPos = myHrp.Position
        local moveDist = (currentMyPos - lastMyPos).Magnitude
        lastMyPos = currentMyPos
        local caughtData = {}
        for _, player in ipairs(SetOwnerAura.Cache.Players) do
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local torso = char:FindFirstChild("Torso")
                if hrp then
                    local dist = (myHrp.Position - hrp.Position).Magnitude
                    if dist <= SetOwnerAura.DetectRange then
                        table.insert(caughtData, {hrp = hrp, torso = torso})
                    end
                end
            end
        end
        local totalCount = #caughtData
        if totalCount > 0 then
            local isCircle = SetOwnerAura.Type == "Circle"
            local radius = SetOwnerAura.CircleRadius
            local height = isCircle and SetOwnerAura.CircleHeight or SetOwnerAura.BlackholeHeight
            local myCFrame = myHrp.CFrame
            for i, data in ipairs(caughtData) do
                local goalCFrame
                if isCircle then
                    local angle = (i - 1) * (pi2 / totalCount)
                    goalCFrame = myCFrame * CFrame.new(math.cos(angle) * radius, height, math.sin(angle) * radius)
                else
                    goalCFrame = myCFrame * CFrame.new(0, height, 0)
                end
                if moveDist > SetOwnerAura.SpeedThreshold then
                    local pullCFrame = myCFrame * CFrame.new(0, 3, 0)
                    if data.hrp then
                        data.hrp.CFrame = pullCFrame
                        data.hrp.AssemblyLinearVelocity = Vector3.zero
                        data.hrp.AssemblyAngularVelocity = Vector3.zero
                        SetOwnerAura.Cache.Remote:FireServer(data.hrp, pullCFrame)
                    end
                    if data.torso then
                        data.torso.CFrame = pullCFrame
                        SetOwnerAura.Cache.Remote:FireServer(data.torso, pullCFrame)
                    end
                else
                    if data.hrp then
                        data.hrp.CFrame = goalCFrame
                        data.hrp.AssemblyLinearVelocity = Vector3.zero
                        data.hrp.AssemblyAngularVelocity = Vector3.zero
                    end
                    if data.torso then data.torso.CFrame = goalCFrame end
                    if frameToggle then
                        if data.hrp then SetOwnerAura.Cache.Remote:FireServer(data.hrp, goalCFrame) end
                        if data.torso then SetOwnerAura.Cache.Remote:FireServer(data.torso, goalCFrame) end
                    elseif SetOwnerAura.Cache.DestroyRemote then
                        if data.hrp then SetOwnerAura.Cache.DestroyRemote:FireServer(data.hrp) end
                        if data.torso then SetOwnerAura.Cache.DestroyRemote:FireServer(data.torso) end
                    end
                end
            end
            frameToggle = not frameToggle
        end
    end)
    return true
end

local function SetOwnerAura_Stop()
    SetOwnerAura.Enabled = false
    if SetOwnerAura.Connection then SetOwnerAura.Connection:Disconnect() SetOwnerAura.Connection = nil end
end

-- ==========================================
-- [[ PLAYER FEATURES (Noclip, TPWalk, InfJump) ]]
-- ==========================================

-- 1. Infinite Jump (JumpRequest Event)
UserInputService.JumpRequest:Connect(function()
    if Toggles.InfiniteJump and Toggles.InfiniteJump.Value then
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass('Humanoid')
            if hum then
                hum:ChangeState("Jumping")
            end
        end
    end
end)

-- 2. Noclip & TP Walk (RunService Stepped)
RunService.Stepped:Connect(function()
    -- Noclip Logic
    if Toggles.Noclip and Toggles.Noclip.Value and LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end

    -- TP Walk Logic
    if Toggles.TPWalk and Toggles.TPWalk.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local hrp = LocalPlayer.Character.HumanoidRootPart
        
        if hum and hum.MoveDirection.Magnitude > 0 then
            -- Note: Using the exact math requested (Value / 10)
            -- Slider 1-10 -> Speed 0.1 - 1.0 per frame
            hrp.CFrame = hrp.CFrame + (hum.MoveDirection * Options.TPWalkSpeed.Value / 10)
        end
    end
end)

-- ==========================================
-- [[ 캐릭터 이벤트 연결 ]]
-- ==========================================
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Type1_ConnectDeathEvent(newChar)
    if Type1.autoRespawnEnabled then
        Type1.systemOn = false
        if Type1.ragdollConnection then Type1.ragdollConnection:Disconnect() end
        if Type1.sitConnection then Type1.sitConnection:Disconnect() end
        task.wait(0.5)
        Type1_RunStableGucci()
    end
    Type3_ConnectDeath(newChar)
    if Type3.IsAutoMode and Type3.MyPlotIndex then
        local root = newChar:WaitForChild("HumanoidRootPart", 10)
        local hum = newChar:WaitForChild("Humanoid", 10)
        if root and hum then
            task.wait(0)
            local plotData = Type3_PlotsData[Type3.MyPlotIndex]
            if plotData then
                local grabPart = plotData.GetPart()
                if grabPart then root.CFrame = grabPart.CFrame * CFrame.new(0, 3, 0) end
            end
            task.wait(0.5)
            Type3_PerformGucci(true)
        end
    end
    Type4_ConnectDeath(newChar)
    if Type4.IsAutoMode and Type4.MyPlotIndex then
        local root = newChar:WaitForChild("HumanoidRootPart", 10)
        local hum = newChar:WaitForChild("Humanoid", 10)
        if root and hum then
            task.wait(0)
            local plotData = Type4_PlotsData[Type4.MyPlotIndex]
            if plotData then
                local grabPart = plotData.GetPart()
                if grabPart then root.CFrame = grabPart.CFrame * CFrame.new(0, 3, 0) end
            end
            task.wait(0.5)
            Type4_PerformGucci()
        end
    end
    Type5_ConnectDeathEvent(newChar)
    if Type5.autoRespawnEnabled then
        Type5.systemOn = false
        if Type5.ragdollConnection then Type5.ragdollConnection:Disconnect() end
        if Type5.sitConnection then Type5.sitConnection:Disconnect() end
        if Type5.seatGuardConnection then Type5.seatGuardConnection:Disconnect() end
        task.wait(0.5)
        Type5_RunStableGucci()
    end
    if Type6.autoRespawnEnabled then
        Type6.systemOn = false
        if Type6.ragdollConnection then Type6.ragdollConnection:Disconnect() end
        if Type6.sitConnection then Type6.sitConnection:Disconnect() end
        task.wait(0)
        Type6_runTrainGucci()
    end
    task.wait(0.5)
    if Toggles.AntiGrab and Toggles.AntiGrab.Value then StartAntiGrab() end

    -- [Anti Banana - Auto Re-enable]
    if Toggles.AntiBanana and Toggles.AntiBanana.Value then
        task.wait(1)
        StartAntiBanana()
    end
end)

if LocalPlayer.Character then
    Type1_ConnectDeathEvent(LocalPlayer.Character)
    Type3_ConnectDeath(LocalPlayer.Character)
    Type4_ConnectDeath(LocalPlayer.Character)
    Type5_ConnectDeathEvent(LocalPlayer.Character)
end
-- ==========================================
-- [[ UI 생성 ]]
-- ==========================================
local Window = Library:CreateWindow({
    Title = "Fling Things and People",
    Footer = "Obsidian Hub",
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab("Main", "user"),
    Attack = Window:AddTab("Attack", "sword"),
    Settings = Window:AddTab("Settings", "settings"),
}

-- ==========================================
-- [[ Main Tab - Invisibility ]]
-- ==========================================
local InvisGroup = Tabs.Main:AddLeftGroupbox("Invisibility", "eye-off")

InvisGroup:AddToggle("AntiGrab", {
    Text = "Anti Grab",
    Default = false,
    Tooltip = "잡힐 때 자동 탈출",
})

Toggles.AntiGrab:OnChanged(function()
    if Toggles.AntiGrab.Value then
        StartAntiGrab()
        Library:Notify({ Title = "Anti Grab", Description = "ON", Time = 1 })
    else
        StopAntiGrab()
        Library:Notify({ Title = "Anti Grab", Description = "OFF", Time = 1 })
    end
end)

InvisGroup:AddToggle("AntiGucci", {
    Text = "Anti Gucci",
    Default = false,
    Tooltip = "선택한 타입으로 구찌 실행",
})

InvisGroup:AddDropdown("AntiGucciType", {
    Values = {
        "Blob Man Gucci (Automatic)",
        "Blob Man Gucci (Passivity)",
        "House Blob Man Gucci (Automatic)",
        "House Tractor Gucci (Automatic)",
        "Tractor Gucci (Automatic)",
        "Train Gucci (Automatic)",
    },
    Default = 1,
    Multi = false,
    Text = "Anti Gucci Type",
    Tooltip = "구찌 타입 선택",
})

Toggles.AntiGucci:OnChanged(function()
    local selectedType = Options.AntiGucciType.Value
    if Toggles.AntiGucci.Value then
        Type1_StopSystem()
        Type2_deactivateSystem()
        Type3_StopSystem()
        Type4_StopSystem()
        Type5_StopSystem()
        Type6_stopSystem()
        
        if selectedType == "Blob Man Gucci (Automatic)" then
            Type1.autoRespawnEnabled = true
            if LocalPlayer.Character then Type1_ConnectDeathEvent(LocalPlayer.Character) end
            task.spawn(Type1_RunStableGucci)
        elseif selectedType == "Blob Man Gucci (Passivity)" then
            task.spawn(Type2_activateSystem)
        elseif selectedType == "House Blob Man Gucci (Automatic)" then
            Type3.IsAutoMode = true
            local char = LocalPlayer.Character
            if char then
                Type3.OriginalCFrame = char.HumanoidRootPart.CFrame
                Type3_ConnectDeath(char)
            end
            task.spawn(Type3_StartAutoSequence)
        elseif selectedType == "House Tractor Gucci (Automatic)" then
            Type4.IsAutoMode = true
            local char = LocalPlayer.Character
            if char then
                Type4.OriginalCFrame = char.HumanoidRootPart.CFrame
                Type4_ConnectDeath(char)
            end
            task.spawn(Type4_StartAutoSequence)
        elseif selectedType == "Tractor Gucci (Automatic)" then
            Type5.autoRespawnEnabled = true
            if LocalPlayer.Character then Type5_ConnectDeathEvent(LocalPlayer.Character) end
            task.spawn(Type5_RunStableGucci)
        elseif selectedType == "Train Gucci (Automatic)" then
            Type6.autoRespawnEnabled = true
            task.spawn(Type6_runTrainGucci)
        end
        Library:Notify({ Title = "Anti Gucci", Description = selectedType .. " 실행!", Time = 2 })
    else
        Type1_StopSystem()
        Type2_deactivateSystem()
        Type3_StopSystem()
        Type4_StopSystem()
        Type5_StopSystem()
        Type6_stopSystem()
        Library:Notify({ Title = "Anti Gucci", Description = "OFF", Time = 1 })
    end
end)

InvisGroup:AddToggle("AntiBanana", {
    Text = "Anti Banana",
    Default = false,
    Tooltip = "Sit Glitch + FloorMaterial Air/Ground Bypass",
})

Toggles.AntiBanana:OnChanged(function()
    if Toggles.AntiBanana.Value then
        StartAntiBanana()
        Library:Notify({ Title = "Anti Banana", Description = "ON", Time = 1 })
    else
        StopAntiBanana()
        Library:Notify({ Title = "Anti Banana", Description = "OFF", Time = 1 })
    end
end)

InvisGroup:AddButton({
    Text = "Anti Blobman Kill",
    Func = function()
        AntiBlobmanKill_Toggle(not AntiBlobmanKill.isEnabled)
        if AntiBlobmanKill.isEnabled then
            Library:Notify({ Title = "Anti Blobman Kill", Description = "ON - Defense Active", Time = 2 })
        else
            Library:Notify({ Title = "Anti Blobman Kill", Description = "OFF", Time = 1 })
        end
    end,
    Tooltip = "블롭맨 킥 방어 (버튼으로 ON/OFF)",
})

-- ==========================================
-- [[ Main Tab - Player (NEW) ]]
-- ==========================================
local PlayerGroup = Tabs.Main:AddRightGroupbox("Player", "user")

PlayerGroup:AddToggle("Noclip", {
    Text = "Noclip",
    Default = false,
    Tooltip = "벽 통과",
})

Toggles.Noclip:OnChanged(function()
    if Toggles.Noclip.Value then
        Library:Notify({ Title = "Player", Description = "Noclip ON", Time = 1 })
    else
        Library:Notify({ Title = "Player", Description = "Noclip OFF", Time = 1 })
    end
end)

PlayerGroup:AddToggle("TPWalk", {
    Text = "TP Walk",
    Default = false,
    Tooltip = "좌표 이동 (CFrame)",
})

PlayerGroup:AddSlider("TPWalkSpeed", {
    Text = "TP Walk Speed",
    Default = 5,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Compact = false,
    Tooltip = "이동 속도 조절",
})

Toggles.TPWalk:OnChanged(function()
    if Toggles.TPWalk.Value then
        Library:Notify({ Title = "Player", Description = "TP Walk ON", Time = 1 })
    else
        Library:Notify({ Title = "Player", Description = "TP Walk OFF", Time = 1 })
    end
end)

PlayerGroup:AddToggle("InfiniteJump", {
    Text = "Infinite Jump",
    Default = false,
    Tooltip = "공중 점프",
})

Toggles.InfiniteJump:OnChanged(function()
    if Toggles.InfiniteJump.Value then
        Library:Notify({ Title = "Player", Description = "Infinite Jump ON", Time = 1 })
    else
        Library:Notify({ Title = "Player", Description = "Infinite Jump OFF", Time = 1 })
    end
end)

-- ==========================================
-- [[ Main Tab - Anti Loop ]]
-- ==========================================
local AntiLoopGroup = Tabs.Main:AddLeftGroupbox("Anti Loop", "zap")

AntiLoopGroup:AddButton({
    Text = "Lock Position",
    Func = function()
        AntiLoop_LockPosition()
    end,
    Tooltip = "현재 위치를 중심점으로 설정",
})

AntiLoopGroup:AddToggle("AntiLoop", {
    Text = "Anti Loop",
    Default = false,
    Tooltip = "스트로보 점멸 티피 시작",
})

Toggles.AntiLoop:OnChanged(function()
    local success = AntiLoop_Toggle(Toggles.AntiLoop.Value)
    if not success and Toggles.AntiLoop.Value then
        Toggles.AntiLoop:SetValue(false)
    else
        if Toggles.AntiLoop.Value then
            Library:Notify({ Title = "Anti Loop", Description = "STROBE VORTEX ON", Time = 2 })
        else
            Library:Notify({ Title = "Anti Loop", Description = "OFF - 원위치 복귀", Time = 1 })
        end
    end
end)

AntiLoopGroup:AddSlider("AntiLoopRadius", {
    Text = "Radius",
    Default = 8,
    Min = 1,
    Max = 50000,
    Rounding = 0,
    Compact = false,
    Tooltip = "원 반경 (스터드) - 1~50000",
})

Options.AntiLoopRadius:OnChanged(function()
    AntiLoop.Radius = Options.AntiLoopRadius.Value
end)

AntiLoopGroup:AddSlider("AntiLoopSteps", {
    Text = "Steps",
    Default = 8,
    Min = 4,
    Max = 32,
    Rounding = 0,
    Compact = false,
    Tooltip = "원을 나누는 점 개수",
})

Options.AntiLoopSteps:OnChanged(function()
    AntiLoop.StepCount = Options.AntiLoopSteps.Value
end)

-- ==========================================
-- [[ Attack Tab - Spam SetOwner ]]
-- ==========================================
local SpamGroup = Tabs.Attack:AddLeftGroupbox("Spam SetOwner", "crosshair")

local playerNames = {}
for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then table.insert(playerNames, p.Name) end
end

SpamGroup:AddDropdown("SpamTarget", {
    Values = playerNames,
    Default = 1,
    Multi = false,
    Text = "Target Player",
    Tooltip = "타겟 플레이어 선택",
})

Options.SpamTarget:OnChanged(function()
    local targetName = Options.SpamTarget.Value
    SpamSetOwner.Target = Players:FindFirstChild(targetName)
end)

Players.PlayerAdded:Connect(function(p)
    if p ~= LocalPlayer then
        local newList = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then table.insert(newList, player.Name) end
        end
        Options.SpamTarget:SetValues(newList)
    end
end)

Players.PlayerRemoving:Connect(function(p)
    local newList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player ~= p then table.insert(newList, player.Name) end
    end
    Options.SpamTarget:SetValues(newList)
    if SpamSetOwner.Target == p then SpamSetOwner.Target = nil end
end)

SpamGroup:AddSlider("SpamPosX", {
    Text = "Position X",
    Default = 0,
    Min = -100,
    Max = 100,
    Rounding = 0,
    Compact = false,
})

Options.SpamPosX:OnChanged(function()
    SpamSetOwner.OffsetX = Options.SpamPosX.Value
end)

SpamGroup:AddSlider("SpamPosY", {
    Text = "Position Y",
    Default = 0,
    Min = -100,
    Max = 100,
    Rounding = 0,
    Compact = false,
})

Options.SpamPosY:OnChanged(function()
    SpamSetOwner.OffsetY = Options.SpamPosY.Value
end)

SpamGroup:AddSlider("SpamPosZ", {
    Text = "Position Z",
    Default = 0,
    Min = -100,
    Max = 100,
    Rounding = 0,
    Compact = false,
})

Options.SpamPosZ:OnChanged(function()
    SpamSetOwner.OffsetZ = Options.SpamPosZ.Value
end)

SpamGroup:AddToggle("SetOwnerKick", {
    Text = "Set Owner Kick",
    Default = false,
    Tooltip = "적을 내 머리 위에 고정 (Kick Grab V48+ v16)",
})

Toggles.SetOwnerKick:OnChanged(function()
    if Toggles.SetOwnerKick.Value then
        local success = SpamSetOwner_StartKick()
        if success then
            Library:Notify({ Title = "Spam SetOwner", Description = "Set Owner Kick ON!", Time = 2 })
        else
            Toggles.SetOwnerKick:SetValue(false)
        end
    else
        SpamSetOwner_StopKick()
        Library:Notify({ Title = "Spam SetOwner", Description = "Set Owner Kick OFF", Time = 1 })
    end
end)

SpamGroup:AddToggle("RagdollSpam", {
    Text = "Ragdoll Spam",
    Default = false,
    Tooltip = "판자로 적 때리기 (Pallet Hammer)",
})

Toggles.RagdollSpam:OnChanged(function()
    if Toggles.RagdollSpam.Value then
        local success = SpamSetOwner_StartRagdoll()
        if success then
            Library:Notify({ Title = "Spam SetOwner", Description = "Ragdoll Spam ON!", Time = 2 })
        else
            Toggles.RagdollSpam:SetValue(false)
        end
    else
        SpamSetOwner_StopRagdoll()
        Library:Notify({ Title = "Spam SetOwner", Description = "Ragdoll Spam OFF", Time = 1 })
    end
end)

-- ==========================================
-- [[ Attack Tab - Set Owner Aura ]]
-- ==========================================
local AuraGroup = Tabs.Attack:AddRightGroupbox("Set Owner Aura", "target")

AuraGroup:AddToggle("SetOwnerAura", {
    Text = "Set Owner Aura",
    Default = false,
    Tooltip = "범위 내 모든 플레이어를 내 주위로 끌어당김",
})

Toggles.SetOwnerAura:OnChanged(function()
    if Toggles.SetOwnerAura.Value then
        SetOwnerAura.Enabled = true
        local success = SetOwnerAura_Start()
        if success then
            Library:Notify({ Title = "Set Owner Aura", Description = "ON - 범위 감지 시작!", Time = 2 })
        else
            Toggles.SetOwnerAura:SetValue(false)
        end
    else
        SetOwnerAura_Stop()
        Library:Notify({ Title = "Set Owner Aura", Description = "OFF", Time = 1 })
    end
end)

AuraGroup:AddDropdown("AuraType", {
    Values = { "Circle", "Blackhole" },
    Default = 1,
    Multi = false,
    Text = "Aura Type",
    Tooltip = "Circle: 원형 배치 / Blackhole: 한 점에 모음",
})

Options.AuraType:OnChanged(function()
    SetOwnerAura.Type = Options.AuraType.Value
end)

AuraGroup:AddSlider("AuraDetectRange", {
    Text = "Detect Range",
    Default = 20,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Compact = false,
    Tooltip = "감지 범위 (스터드)",
})

Options.AuraDetectRange:OnChanged(function()
    SetOwnerAura.DetectRange = Options.AuraDetectRange.Value
end)

AuraGroup:AddSlider("AuraCircleRadius", {
    Text = "Circle Radius",
    Default = 10,
    Min = 3,
    Max = 20,
    Rounding = 0,
    Compact = false,
    Tooltip = "원형 배치 반경",
})

Options.AuraCircleRadius:OnChanged(function()
    SetOwnerAura.CircleRadius = Options.AuraCircleRadius.Value
end)

AuraGroup:AddSlider("AuraCircleHeight", {
    Text = "Circle Height",
    Default = 5,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Compact = false,
    Tooltip = "Circle 모드 높이",
})

Options.AuraCircleHeight:OnChanged(function()
    SetOwnerAura.CircleHeight = Options.AuraCircleHeight.Value
end)

AuraGroup:AddSlider("AuraBlackholeHeight", {
    Text = "Blackhole Height",
    Default = 8,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Compact = false,
    Tooltip = "Blackhole 모드 높이",
})

Options.AuraBlackholeHeight:OnChanged(function()
    SetOwnerAura.BlackholeHeight = Options.AuraBlackholeHeight.Value
end)

-- ==========================================
-- [[ Settings Tab ]]
-- ==========================================
local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("ShowKeybinds", {
    Text = "Show Keybind Menu",
    Default = false,
})

Toggles.ShowKeybinds:OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.ShowKeybinds.Value
end)

MenuGroup:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind",
})

MenuGroup:AddButton({
    Text = "Unload",
    Func = function()
        StopAntiGrab()
        Type1_StopSystem()
        Type2_deactivateSystem()
        Type3_StopSystem()
        Type4_StopSystem()
        Type5_StopSystem()
        Type6_stopSystem()
        AntiBlobmanKill_Toggle(false)
        AntiLoop_Toggle(false)
        SpamSetOwner_StopKick()
        SpamSetOwner_StopRagdoll()
        SetOwnerAura_Stop()
        StopAntiBanana()
        Library:Unload()
    end,
})

Library.ToggleKeybind = Options.MenuKeybind

-- ==========================================
-- [[ Theme & Save Manager ]]
-- ==========================================
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("FlingThings")
SaveManager:SetFolder("FlingThings/configs")

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

task.spawn(function()
    task.wait(0.1)
    Options.ThemeManager_ThemeList:SetValue("BBot")
    Library:SetFont(Enum.Font.Fantasy)
end)
Library:Notify({
    Title = "Obsidian Hub",
    Description = "V5 로드 완료! RightShift로 토글",
    Time = 3,
})
