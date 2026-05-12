task.wait(2)

------------ UI Loader ------------
 Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
 ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
 SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()

 Options = Library.Options
 Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

------------ Services ------------
 Players = game:GetService("Players")
 ReplicatedStorage = game:GetService("ReplicatedStorage")
 RunService = game:GetService("RunService")
 Workspace = game:GetService("Workspace")
 UserInputService = game:GetService("UserInputService")

------------ Player Variables ------------
 LocalPlayer = Players.LocalPlayer
 CurrentCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Helper function to safely get current character
 function getCurrentCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

------------ Global Variables ------------
 rainbowHue = 0
 lastRainbowUpdate = tick()
 cachedPCLDs = {}
 selectionBoxes = {}
 running = false
local connAdded, connRemoving
firstPersonBoxes = {}
 firstPersonRunning = false
 hiddenPCLDs = {}
 lastFirstPersonCheck = 0
 selectedTargets = nil
 isToggled = false
 isKilling = false
 targetPlayer = nil
 toggleActive = false
 safeHeight = 50000
 pallet = nil
 alignObjects = {}
 durationTime = 0.1
 studsRadius = 35
 studsParts = {}
 studsConnections = {}
 showStudsToggle = false
 flingT = false
 strengthV = 9999
 infLineExtendT = false
 increaseLineExtendV = 1
 RagdollGrabT = false
 AntiGrabTP_Active = false
 AntiGrabT = false
 AntiDeathT = false
 AntiBlobT = false
 masslessT = false
 permRagdollT = false
 autoGucciT = false
 sitJumpT = false
 ToggleActive = false
 autoDeleteLegs = false
 selectedAutoDeletePart = "Arm/Leg"
 antiInPlotsEnabled = false
 antiLagT = false
 AntiBurnT = false
 AntiStickyGBT = false
 permRagdollRunningS = false

------------ Utility Functions ------------
 function getRainbowColor()
    local currentTime = tick()
    local deltaTime = currentTime - lastRainbowUpdate
    
    if deltaTime > 0.1 then
        rainbowHue = (rainbowHue + deltaTime * 0.25) % 1
        lastRainbowUpdate = currentTime
    end
    
    return Color3.fromHSV(rainbowHue, 0.6, 1)
end

 function createESP(obj)
    if not obj or not obj:IsA("BasePart") or selectionBoxes[obj] then return end

    local box = Instance.new("SelectionBox")
    box.Adornee = obj
    box.LineThickness = 0.03
    box.SurfaceColor3 = Color3.fromRGB(255,255,255)
    box.SurfaceTransparency = 0.9
    box.Parent = obj
    selectionBoxes[obj] = box
end

 function removeESP(obj)
    local box = selectionBoxes[obj]
    if box then
        box:Destroy()
        selectionBoxes[obj] = nil
    end
end

 function cacheExistingPCLDs()
    table.clear(cachedPCLDs)
    for _, detector in ipairs(Workspace:GetDescendants()) do
        if detector.Name == "PlayerCharacterLocationDetector" and detector:IsA("BasePart") then
            cachedPCLDs[detector] = true
        end
    end
end

 function enableESP()
    cacheExistingPCLDs()
    
    for detector in pairs(cachedPCLDs) do
        if detector.Parent then
            createESP(detector)
        end
    end

    connAdded = Workspace.DescendantAdded:Connect(function(detector)
        if detector.Name == "PlayerCharacterLocationDetector" and detector:IsA("BasePart") then
            cachedPCLDs[detector] = true
            createESP(detector)
        end
    end)

    connRemoving = Workspace.DescendantRemoving:Connect(function(detector)
        if selectionBoxes[detector] then
            removeESP(detector)
        end
        cachedPCLDs[detector] = nil
    end)

    running = true
    
    task.spawn(function()
        while running do
            local color = getRainbowColor()
            for detector, box in pairs(selectionBoxes) do
                if box and box.Parent then
                    box.Color3 = color
                else
                    selectionBoxes[detector] = nil
                end
            end
            task.wait(0.1)
        end
    end)
end

 function disableESP()
    running = false
    if connAdded then connAdded:Disconnect() connAdded = nil end
    if connRemoving then connRemoving:Disconnect() connRemoving = nil end

    for obj, box in pairs(selectionBoxes) do
        if box then box:Destroy() end
    end
    table.clear(selectionBoxes)
    table.clear(cachedPCLDs)
end

 targetParts = {
    "HumanoidRootPart","UpperTorso","LowerTorso","Torso",
    "Left Arm","Right Arm","Left Leg","Right Leg",
    "LeftUpperArm","RightUpperArm","LeftLowerArm","RightLowerArm",
    "LeftHand","RightHand","LeftUpperLeg","RightUpperLeg",
    "LeftLowerLeg","RightLowerLeg","LeftFoot","RightFoot"
}

 function createCharESP(char)
    if not char then return end
    
    for _, partName in ipairs(targetParts) do
        local part = char:FindFirstChild(partName)
        if part and part:IsA("BasePart") and not firstPersonBoxes[part] then
            local box = Instance.new("SelectionBox")
            box.Adornee = part
            box.LineThickness = 0.002
            box.Color3 = Color3.new(0,0,0)
            box.SurfaceTransparency = 1
            box.Parent = part
            firstPersonBoxes[part] = box
        end
    end
end

 function removeCharESP()
    for part, box in pairs(firstPersonBoxes) do
        if box then box:Destroy() end
    end
    table.clear(firstPersonBoxes)
end

 function updatePCLDESP(isFirstPerson)
    local currentTime = tick()
    if currentTime - lastFirstPersonCheck < 0.15 then
        return
    end
    lastFirstPersonCheck = currentTime

    local hrp = CurrentCharacter and CurrentCharacter:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for detector in pairs(cachedPCLDs) do
        if detector and detector.Parent then
            local dist = (hrp.Position - detector.Position).Magnitude

            if isFirstPerson and dist <= 3 then
                if selectionBoxes[detector] then
                    removeESP(detector)
                    hiddenPCLDs[detector] = true
                end
            else
                if hiddenPCLDs[detector] then
                    createESP(detector)
                    hiddenPCLDs[detector] = nil
                end
            end
        end
    end
end

local function enableFirstPersonESP()
    firstPersonRunning = true
    
    task.spawn(function()
        local blinkTick = 0
        local blinkTime = 5
        
        while firstPersonRunning do
            local char = getCurrentCharacter()
            local isFirstPerson = false

            if char and char:FindFirstChild("Head") then
                local head = char.Head
                local dist = (Workspace.CurrentCamera.CFrame.Position - head.Position).Magnitude
                if dist < 1.5 then
                    isFirstPerson = true
                    if next(firstPersonBoxes) == nil then
                        createCharESP(char)
                    end
                else
                    if next(firstPersonBoxes) ~= nil then
                        removeCharESP()
                    end
                end
            else
                removeCharESP()
            end

            blinkTick = blinkTick + 0.1
            local alpha = (math.sin((blinkTick / blinkTime) * math.pi * 2) + 1) / 2
            local color = Color3.new(alpha, alpha, alpha)
            
            for part, box in pairs(firstPersonBoxes) do
                if box and box.Parent then
                    box.Color3 = color
                else
                    firstPersonBoxes[part] = nil
                end
            end

            updatePCLDESP(isFirstPerson)
            task.wait(0.1)
        end

        updatePCLDESP(false)
    end)
end

 function disableFirstPersonESP()
    firstPersonRunning = false
    removeCharESP()
    updatePCLDESP(false)
end

 function findPlayerCharacter(playerName)
    local char = Workspace:FindFirstChild(playerName)
    if char then return char end
    
    local plotItems = Workspace:FindFirstChild("PlotItems")
    if plotItems then
        local playersInPlots = plotItems:FindFirstChild("PlayersInPlots")
        if playersInPlots then
            char = playersInPlots:FindFirstChild(playerName)
            if char then return char end
        end
    end
    
    for _, folder in ipairs(Workspace:GetChildren()) do
        if folder:IsA("Folder") or folder:IsA("Model") then
            local foundChar = folder:FindFirstChild(playerName)
            if foundChar then return foundChar end
        end
    end
    
    return nil
end

 function getPlayerList()
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(players, player.Name)
        end
    end
    return players
end

 function getBlobman()
    local blobFolder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if blobFolder then
        return blobFolder:FindFirstChild("CreatureBlobman")
    end
    return nil
end

 function runGrabLoop()
    if not selectedTargets then
        Library:Notify("No target selected!", 3)
        return
    end
    
    local blob = getBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return
    end
    
    local targetChar = findPlayerCharacter(selectedTargets)
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
        selectedTargets = nil
        BlobDropdown:SetValue(nil)
        return
    end
    
    local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
    local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
    
    while isToggled and selectedTargets do
        local targetChar = findPlayerCharacter(selectedTargets)
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
            local target = targetChar.HumanoidRootPart
            
            local predictedPosition = target.Position
            if target.Velocity.Magnitude > 10 then
                predictedPosition = target.Position + (target.Velocity * 0.1)
            end
            
            local tempPart = Instance.new("Part")
            tempPart.Size = Vector3.new(2, 2, 2)
            tempPart.Position = predictedPosition
            tempPart.Anchored = true
            tempPart.CanCollide = false
            tempPart.Transparency = 1
            tempPart.Parent = Workspace
            
            grab:FireServer(blob.LeftDetector, tempPart, blob.LeftDetector.LeftWeld)
            grab:FireServer(blob.RightDetector, tempPart, blob.RightDetector.RightWeld)
            
            tempPart:Destroy()
            
            drop:FireServer(blob.LeftDetector.LeftWeld)
            drop:FireServer(blob.RightDetector.RightWeld)
        else
            selectedTargets = nil
            BlobDropdown:SetValue(nil)
            isToggled = false
        end
        task.wait()
    end
end
 function killTarget()
    if not selectedTargets then
        Library:Notify("Please select a target first!", 3)
        return
    end
    
    local blob = getBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return
    end
    
    isKilling = true
    Library:Notify("Killing " .. selectedTargets, 3)
    
    local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
    local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
    
    while isKilling and selectedTargets do
        local targetChar = findPlayerCharacter(selectedTargets)
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
            selectedTargets = nil
            -- FIX: Safe check before calling SetValue
            if BlobDropdown and typeof(BlobDropdown.SetValue) == "function" then
                BlobDropdown:SetValue(nil)
            end
            isKilling = false
            Library:Notify("Target removed", 3)
            break
        end
        
        local targetHead = targetChar:FindFirstChild("Head")
        if not targetHead then
            task.wait(0.5)
            continue
        end

        -- 원래 위치 저장
        local originalPosition = getCurrentCharacter().HumanoidRootPart.CFrame

        -- 블롭을 대상 위치로 이동
        getCurrentCharacter().HumanoidRootPart.CFrame = targetHead.CFrame
        task.wait(0.15)

        -- Grab / Release 실행
        grab:FireServer(blob.RightDetector, targetChar.HumanoidRootPart, blob.RightDetector.RightWeld)
        release:FireServer(blob.RightDetector.RightWeld)
        task.wait(0.3)

        -- 대상 머리 좌표 강제 이동
        targetHead.CFrame = CFrame.new(0, -99999, 0)

        -- 자기 원래 위치 복귀
        getCurrentCharacter().HumanoidRootPart.CFrame = originalPosition

        -- 1초 대기 후 반복
        task.wait(1)
    end
end

 function stopKillTarget()
    isKilling = false
    Library:Notify("Stopped killing", 3)
end






 function toggleTargetByMouse()
    local target = game:GetService("Players").LocalPlayer:GetMouse().Target
    if target then
        local char = target:FindFirstAncestorOfClass("Model")
        if char and Players:FindFirstChild(char.Name) then
            local player = Players[char.Name]
            if player ~= LocalPlayer then
                if selectedTargets == player.Name then
                    selectedTargets = nil
                    Library:Notify("Removed " .. player.Name .. " from target", 2)
                    BlobDropdown:SetValue(nil)
                else
                    selectedTargets = player.Name
                    Library:Notify("Selected " .. player.Name .. " as target", 2)
                    BlobDropdown:SetValue(player.Name)
                end
                return
            end
        end
    end
    Library:Notify("No valid target under mouse", 2)
end

 function setupAlign(palletObj)
    if not palletObj or not palletObj.Parent then return end

    if alignObjects[palletObj] then
        local worldPart = alignObjects[palletObj].worldPart
        if worldPart and worldPart.Parent then
            worldPart.Position = Vector3.new(palletObj.Position.X, safeHeight, palletObj.Position.Z)
        end
        return
    end

    local rootAttachment = Instance.new("Attachment")
    rootAttachment.Name = "_RootAttachment"
    rootAttachment.Parent = palletObj

    local worldPart = Instance.new("Part")
    worldPart.Name = "_AlignAnchor_" .. tostring(math.random(1, 1e9))
    worldPart.Size = Vector3.new(1,1,1)
    worldPart.Transparency = 1
    worldPart.CanCollide = false
    worldPart.Anchored = true
    worldPart.CFrame = CFrame.new(palletObj.Position.X, safeHeight, palletObj.Position.Z)
    worldPart.Parent = Workspace

    local worldAttachment = Instance.new("Attachment")
    worldAttachment.Name = "_WorldAttachment"
    worldAttachment.Parent = worldPart

    local ap = Instance.new("AlignPosition")
    ap.Name = "_AlignPosition"
    ap.Attachment0 = rootAttachment
    ap.Attachment1 = worldAttachment
    ap.MaxForce = 1e9
    ap.Responsiveness = 200
    ap.Mode = Enum.PositionAlignmentMode.TwoAttachment
    ap.ApplyAtCenterOfMass = true
    ap.Parent = palletObj

    local ao = Instance.new("AlignOrientation")
    ao.Name = "_AlignOrientation"
    ao.Attachment0 = rootAttachment
    ao.Attachment1 = worldAttachment
    ao.MaxTorque = 1e9
    ao.Responsiveness = 200
    ao.Mode = Enum.OrientationAlignmentMode.TwoAttachment
    ao.Parent = palletObj

    alignObjects[palletObj] = {
        rootAttachment = rootAttachment,
        worldPart = worldPart,
        worldAttachment = worldAttachment,
        ap = ap,
        ao = ao,
    }
end

 function clearAlign(palletObj)
    local data = alignObjects[palletObj]
    if not data then return end

    if data.ap and data.ap.Parent then
        data.ap:Destroy()
    end
    if data.ao and data.ao.Parent then
        data.ao:Destroy()
    end
    if data.rootAttachment and data.rootAttachment.Parent then
        data.rootAttachment:Destroy()
    end
    if data.worldAttachment and data.worldAttachment.Parent then
        data.worldAttachment:Destroy()
    end
    if data.worldPart and data.worldPart.Parent then
        data.worldPart:Destroy()
    end

    alignObjects[palletObj] = nil
end

 function findPallet()
    local playerName = LocalPlayer.Name
    local spawnedToys = Workspace:FindFirstChild(playerName .. "SpawnedInToys")
    
    if not spawnedToys then
        return nil
    end
    
    local palletNames = {
        "PalletLightBrown",
    }
    
    for _, name in ipairs(palletNames) do
        local palletObj = spawnedToys:FindFirstChild(name)
        if palletObj then
            local soundPart = palletObj:FindFirstChild("SoundPart") or palletObj:FindFirstChildWhichIsA("BasePart")
            if soundPart then
                return soundPart
            end
        end
    end
    
    return nil
end

local function spawnPallet()
    local SpawnToyRemoteFunction = ReplicatedStorage.MenuToys.SpawnToyRemoteFunction
    
    local char = CurrentCharacter
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local spawnPosition = hrp.CFrame
        
        -- 1. 팔레트 스폰
        SpawnToyRemoteFunction:InvokeServer(
            "PalletLightBrown",
            spawnPosition,
            Vector3.new(0, 0, 0)
        )

        -- 2. 스폰되자마자 바로 SetNetworkOwner 실행
        local palletModel = workspace:WaitForChild(LocalPlayer.Name.."SpawnedInToys"):WaitForChild("PalletLightBrown")
        local palletPart = palletModel:WaitForChild("SoundPart")

        game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(
            palletPart,
            palletPart.CFrame
        )

        -- 3. 새 팔레트 위치 동기화
        local newPallet = findPallet()
        if newPallet then
            newPallet.CFrame = hrp.CFrame
            return newPallet
        end
    end
    return nil
end


 function setupPallet()
    local palletObj = findPallet()
    if not palletObj then
        palletObj = spawnPallet()
        if not palletObj then
            return nil
        end
    end

    local palletModel = palletObj.Parent
    for _, part in ipairs(palletModel:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    setupAlign(palletObj)
    return palletObj
end

local function ensurePalletExists()
    if not pallet or not pallet.Parent then
        pallet = setupPallet()
    end
    return pallet ~= nil
end

local function getPlayerOptions()
    local options = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(options, p.Name)
        end
    end
    return options
end

local function toggleTargetByMouseTargetTab()
    if toggleActive then
        toggleActive = false
        -- 상대 캐릭터의 모든 파트 고정 해제
        if targetPlayer and targetPlayer.Character then
            for _, part in pairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                end
            end
        end
        
        targetPlayer = nil
        if ownershipLoop then
            ownershipLoop:Disconnect()
            ownershipLoop = nil
        end
        Library:Notify("Cancelled", 2)
    else
        local target = game:GetService("Players").LocalPlayer:GetMouse().Target
        if target then
            local char = target:FindFirstAncestorOfClass("Model")
            if char and Players:FindFirstChild(char.Name) then
                local player = Players[char.Name]
                if player ~= LocalPlayer then
                    targetPlayer = player
                    
                    -- 상대 캐릭터의 모든 파트 고정
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Anchored = true
                        end
                    end
                    
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(hrp, hrp.CFrame)
                        task.wait(0.1)
                    end
                    
                    local head = char:FindFirstChild("Head")
                    if not head then
                        -- 고정 해제 후 반환
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                        Library:Notify("No head found!", 2)
                        return
                    end
                    
                    local ballSocket = head:FindFirstChild("BallSocketConstraint")
                    if not ballSocket then
                        -- 고정 해제 후 반환
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                        Library:Notify("No BallSocketConstraint found!", 2)
                        return
                    end
                    
                    if not ensurePalletExists() then
                        -- 고정 해제 후 반환
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                        Library:Notify("Failed to create pallet!", 2)
                        return
                    end
                    
                    Library:Notify("Targeting " .. player.Name, 3)
                    
                    toggleActive = true
                    
                    -- BallSocketConstraint 모니터링 루프 시작
                    ownershipLoop = game:GetService("RunService").Heartbeat:Connect(function()
                        if not toggleActive or not char or not char.Parent then
                            -- 루프 종료 시 고정 해제
                            if char then
                                for _, part in pairs(char:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.Anchored = false
                                    end
                                end
                            end
                            if ownershipLoop then
                                ownershipLoop:Disconnect()
                                ownershipLoop = nil
                            end
                            return
                        end
                        
                        local currentHead = char:FindFirstChild("Head")
                        if currentHead then
                            local currentBallSocket = currentHead:FindFirstChild("BallSocketConstraint")
                            if currentBallSocket and not currentBallSocket.Enabled then
                                -- BallSocket이 비활성화되면 터치 + 힘 적용
                                firetouchinterest(pallet, char.HumanoidRootPart, 0)
                                firetouchinterest(pallet, char.HumanoidRootPart, 1)
                                
                                local bv = Instance.new("BodyVelocity")
                                bv.Velocity = Vector3.new(0, 100, 0)
                                bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                                bv.P = 1e5
                                bv.Parent = pallet
                                
                                task.wait(0.05)
                                
                                if bv and bv.Parent then
                                    bv:Destroy()
                                end
                                
                                -- 소유권 다시 설정
                                local currentHrp = char:FindFirstChild("HumanoidRootPart")
                                if currentHrp then
                                    ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(currentHrp, currentHrp.CFrame)
                                end
                            end
                        end
                    end)
                    
                    Library:Notify("BallSocket monitoring started", 3)
                else
                    Library:Notify("Cannot target yourself!", 2)
                end
            else
                Library:Notify("No valid player character found!", 2)
            end
        else
            Library:Notify("No target under mouse!", 2)
        end
    end
end

local function dropLimbsAndMoveTorso()
    local mouse = LocalPlayer:GetMouse()
    local target = mouse.Target
    
    if not target then
        Library:Notify("No target under mouse!", 3)
        return
    end
    
    local char = target:FindFirstAncestorOfClass("Model")
    if not char or not Players:FindFirstChild(char.Name) then
        Library:Notify("No valid player character found!", 3)
        return
    end
    
    local player = Players[char.Name]
    if player == LocalPlayer then
        Library:Notify("Cannot target yourself!", 3)
        return
    end
    
    local head = char:FindFirstChild("Head")
    if not head then
        Library:Notify("No head found!", 3)
        return
    end
    
    local ballSocket = head:FindFirstChild("BallSocketConstraint")
    if not ballSocket then
        Library:Notify("No BallSocketConstraint found!", 3)
        return
    end
    
    if not ensurePalletExists() then
        Library:Notify("Failed to create pallet!", 3)
        return
    end
    
    ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(char.Torso, char.Torso.CFrame)

    local maxAttempts = 20
    local attempts = 0

    while attempts < maxAttempts and not ballSocket.Enabled do
        firetouchinterest(pallet, char.HumanoidRootPart, 0)
        firetouchinterest(pallet, char.HumanoidRootPart, 1)
        
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(0, 100, 0)
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.P = 1e5
        bv.Parent = pallet
        
        task.wait(0.1)
        
        if bv and bv.Parent then
            bv:Destroy()
        end
        
        attempts = attempts + 1
        task.wait(0.3)
    end
    
    if not ballSocket.Enabled then
        Library:Notify("Failed to enable BallSocketConstraint!", 3)
        return
    end
    
    local limbParts = {
        "Left Arm", "Right Arm", "Left Leg", "Right Leg",
        "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
        "LeftHand", "RightHand", "LeftUpperLeg", "RightUpperLeg",
        "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot"
    }

    for _, partName in ipairs(limbParts) do
        local part = char:FindFirstChild(partName)
        if part and part:IsA("BasePart") then
            part.CFrame = part.CFrame * CFrame.new(0, -9999999999, 0)
        end
    end

    wait(0.1)

    local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    local leftLeg = char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftUpperLeg")

    if not torso or not leftLeg then
        Library:Notify("Torso or left leg not found!", 3)
        return
    end

    if leftLeg and leftLeg.Parent then
        torso.CFrame = leftLeg.CFrame
        
        task.wait()

    
        Library:Notify("Limbs dropped and torso moved!", 3)
    end
end

local function getUtilityBlobman()
    local blobFolder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if blobFolder then
        return blobFolder:FindFirstChild("CreatureBlobman")
    end
    return nil
end

local function autoGucciTrigger()
    local blob = getUtilityBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return
    end

    local autoGucciActive = true

    task.spawn(function()
        while autoGucciActive do
            if getCurrentCharacter() and getCurrentCharacter():FindFirstChild("HumanoidRootPart") then
                local ragdollRemote = ReplicatedStorage:FindFirstChild("CharacterEvents"):FindFirstChild("RagdollRemote")
                if ragdollRemote then
                    for i = 1, 3 do
                        ragdollRemote:FireServer(getCurrentCharacter().HumanoidRootPart, 0)
                        task.wait()
                    end
                end
            end
            task.wait()
        end
    end)

    task.spawn(function()
        while autoGucciActive do
            local humanoid = getCurrentCharacter() and getCurrentCharacter():FindFirstChild("Humanoid")
            if humanoid and blob then
                local seat = blob:FindFirstChildWhichIsA("VehicleSeat")
                if seat then
                    seat:Sit(humanoid)
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.wait()
                end
            end
            task.wait()
        end
    end)

    task.wait(durationTime)
    autoGucciActive = false
end

local function autoGucciWorking()
    local blob = getUtilityBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return
    end

    local head = blob:FindFirstChild("HumanoidRootPart")
    if not head then
        Library:Notify("Blobman head not found!", 3)
        return
    end

    local hrp = getCurrentCharacter() and getCurrentCharacter():FindFirstChild("HumanoidRootPart")
    if not hrp then
        Library:Notify("Your HRP not found!", 3)
        return
    end

    local originalCFrame = hrp.CFrame
    hrp.CFrame = head.CFrame

    local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
    local del = ReplicatedStorage.GrabEvents.DestroyGrabLine

    set:FireServer(head, head.CFrame)
    del:FireServer(head)

    head.CFrame = CFrame.new(head.Position.X, 55555, head.Position.Z)
    task.wait(0.5)
    head.Anchored = true

    hrp.CFrame = originalCFrame
end

local function disablePlotBarriers()
    local plotsFolder = Workspace:FindFirstChild("Plots")
    if not plotsFolder then
        Library:Notify("Plots folder not found!", 3)
        return
    end
    
    local barrierCount = 0
    
    for _, plot in ipairs(plotsFolder:GetDescendants()) do
        if plot:IsA("BasePart") and plot.Name == "PlotBarrier" then
            plot.CanCollide = false
            plot.CanTouch = false
            plot.CanQuery = false
            barrierCount = barrierCount + 1
        end
    end
    
    Library:Notify(barrierCount .. " barriers disabled", 3)
end

local function hamburgerTeleport()
    local player = LocalPlayer
    local hrp = getCurrentCharacter() and getCurrentCharacter():FindFirstChild("HumanoidRootPart")
    if not hrp then
        Library:Notify("Your HumanoidRootPart not found!", 3)
        return
    end

    local originalCFrame = hrp.CFrame

    local SpawnToyRemoteFunction = ReplicatedStorage:FindFirstChild("MenuToys") and ReplicatedStorage.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
    if not SpawnToyRemoteFunction then
        Library:Notify("SpawnToyRemoteFunction not found!", 3)
        return
    end

    local FoodHamburger = SpawnToyRemoteFunction:InvokeServer(
        "FoodHamburger",
        hrp.CFrame,
        Vector3.new(0, 0, 0)
    )

    if not FoodHamburger then
        Library:Notify("Failed to spawn Hamburger!", 3)
        return
    end

    local spawnedToys = Workspace:FindFirstChild(player.Name .. "SpawnedInToys")
    if not spawnedToys then
        Library:Notify("SpawnedInToys folder not found!", 3)
        return
    end

    FoodHamburger = spawnedToys:WaitForChild("FoodHamburger", 5)
    if not FoodHamburger then
        Library:Notify("Hamburger object not found!", 3)
        return
    end

    local HoldItemRemoteFunction = FoodHamburger:FindFirstChild("HoldPart") and FoodHamburger.HoldPart:FindFirstChild("HoldItemRemoteFunction")
    if not HoldItemRemoteFunction then
        Library:Notify("HoldItemRemoteFunction not found!", 3)
        return
    end

    HoldItemRemoteFunction:InvokeServer(FoodHamburger, player.Character)

    local plotsFolder = Workspace:FindFirstChild("Plots")
    local plot3 = plotsFolder and plotsFolder:FindFirstChild("Plot3")
    local plotArea = plot3 and plot3:FindFirstChild("PlotArea")
    if not plotArea then
        Library:Notify("Plot3 or PlotArea not found!", 3)
        return
    end

    hrp.CFrame = plotArea.CFrame

    task.wait(0.1)

    hrp.CFrame = originalCFrame

    local DestroyToy = ReplicatedStorage:FindFirstChild("MenuToys") and ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")
    if not DestroyToy then
        Library:Notify("DestroyToy RemoteEvent not found!", 3)
        return
    end

    DestroyToy:FireServer(FoodHamburger)

    Library:Notify("Hamburger teleport to Plot3 completed!", 3)
end

local function createStudsIndicator(position)
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1)
    part.Shape = Enum.PartType.Ball
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(255, 0, 0)
    part.Position = position
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.3
    part.Parent = Workspace
    
    local beam = Instance.new("Beam")
    beam.Attachment0 = Instance.new("Attachment")
    beam.Attachment0.Parent = part
    beam.Attachment1 = Instance.new("Attachment")
    beam.Attachment1.Position = Vector3.new(0, -10, 0)
    beam.Attachment1.Parent = part
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
    beam.Width0 = 0.5
    beam.Width1 = 0.5
    beam.Parent = part
    
    return part
end

local function getPlayersInRadius(radius)
    local playersInRadius = {}
    local localPos = getCurrentCharacter() and getCurrentCharacter():FindFirstChild("HumanoidRootPart")
    if not localPos then return playersInRadius end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and (hrp.Position - localPos.Position).Magnitude <= radius then
                table.insert(playersInRadius, player)
            end
        end
    end
    
    return playersInRadius
end

local function updateStudsDisplay()
    for _, part in ipairs(studsParts) do
        if part and part.Parent then
            part:Destroy()
        end
    end
    table.clear(studsParts)
    
    if not showStudsToggle then return end
    
    local players = getPlayersInRadius(studsRadius)
    for _, player in ipairs(players) do
        if player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local stud = createStudsIndicator(hrp.Position)
                table.insert(studsParts, stud)
            end
        end
    end
end

local function makePlayerLookAndWalk(targetPlayer, duration)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    local localHrp = getCurrentCharacter() and getCurrentCharacter():FindFirstChild("HumanoidRootPart")
    if not localHrp then return end
    
    humanoid.AutoRotate = false
    local startTime = tick()
    
    local walkConnection
    walkConnection = RunService.Heartbeat:Connect(function()
        if tick() - startTime > duration or not targetPlayer.Character or not humanoid.Parent then
            if walkConnection then walkConnection:Disconnect() end
            humanoid.AutoRotate = true
            return
        end
        
        local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetHrp and localHrp then
            local direction = (localHrp.Position - targetHrp.Position).Unit
            targetHrp.CFrame = CFrame.lookAt(targetHrp.Position, targetHrp.Position + Vector3.new(direction.X, 0, direction.Z))
        end
        
        humanoid:MoveTo(localHrp.Position)
    end)
end

local function autoGrabAndTarget()
    if not showStudsToggle then
        Library:Notify("Please enable 'Show Studs' first!", 3)
        return
    end
    
    local players = getPlayersInRadius(studsRadius)
    if #players == 0 then
        Library:Notify("No players found within " .. studsRadius .. " studs", 3)
        return
    end
    
    local blob = getBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return
    end
    
    local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
    local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
    
    task.delay(0.3, function()
        for _, player in ipairs(players) do
            if player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    grab:FireServer(blob.RightDetector, hrp, blob.RightDetector.RightWeld)
                    release:FireServer(blob.RightDetector.RightWeld)
                    makePlayerLookAndWalk(player, 15)
                end
            end
        end
    end)
end

local function teleportToBlob()
    local blob = getBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return false
    end
    
    local hrp = getCurrentCharacter() and getCurrentCharacter():FindFirstChild("HumanoidRootPart")
    if not hrp then
        Library:Notify("Your character not found!", 3)
        return false
    end
    
    local blobHrp = blob:FindFirstChild("HumanoidRootPart")
    if blobHrp then
        hrp.CFrame = blobHrp.CFrame
        Library:Notify("Teleported to Blobman!", 3)
        return true
    end
    
    return false
end

local function sitOnBlob()
    local blob = getBlobman()
    if not blob then
        Library:Notify("Blobman not found!", 3)
        return false
    end
    
    local humanoid = getCurrentCharacter() and getCurrentCharacter():FindFirstChildOfClass("Humanoid")
    if not humanoid then
        Library:Notify("Your humanoid not found!", 3)
        return false
    end
    
    local seat = blob:FindFirstChildWhichIsA("VehicleSeat")
    if not seat then
        Library:Notify("No seat found on Blobman!", 3)
        return false
    end
    
    if teleportToBlob() then
        task.wait()
        seat:Sit(humanoid)
        Library:Notify("Sitting on Blobman!", 3)
        return true
    end
    
    return false
end

local function flingF()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:WaitForChild("HumanoidRootPart")
    Workspace.ChildAdded:Connect(function(model)
        if model.Name == "GrabParts" then
            local part_to_impulse = model:FindFirstChild("GrabPart") and model.GrabPart:FindFirstChild("WeldConstraint") and model.GrabPart.WeldConstraint.Part1
            if part_to_impulse then
                model:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not model.Parent and flingT then
                        UserInputService.InputBegan:Connect(function(inp, gameProcessed)
                            if not gameProcessed and inp.UserInputType == Enum.UserInputType.MouseButton2 then
                                local velocityObj = Instance.new("BodyVelocity", part_to_impulse)
                                velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                velocityObj.Velocity = Workspace.CurrentCamera.CFrame.lookVector * strengthV
                                game:GetService("Debris"):AddItem(velocityObj, 1)
                            end
                        end)
                    end
                end)
            end
        end
    end)
end

local function infLineExtendF()
    local char = LocalPlayer.Character
    if not char then return end
    local cam = Workspace.CurrentCamera
    local lineDistanceV = 11

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseWheel then
            if lineDistanceV < 11 then
                lineDistanceV = 11
            end

            if input.Position.Z > 0 then
                lineDistanceV = lineDistanceV + increaseLineExtendV
            elseif input.Position.Z < 0 then
                lineDistanceV = lineDistanceV - increaseLineExtendV
            end
        end
    end)

    Workspace.ChildAdded:Connect(function(child)
        if child.Name == "GrabParts" and child:IsA("Model") then
            if infLineExtendT and UserInputService.MouseEnabled then
                local grabPartsModel = child

                grabPartsModel:WaitForChild("GrabPart")
                grabPartsModel:WaitForChild("DragPart")

                local clonedDragPart = grabPartsModel.DragPart:Clone()
                clonedDragPart.Name = "DragPart1"
                clonedDragPart.AlignPosition.Attachment1 = clonedDragPart.DragAttach
                clonedDragPart.Parent = grabPartsModel

                lineDistanceV = (clonedDragPart.Position - cam.CFrame.Position).Magnitude

                clonedDragPart.AlignOrientation.Enabled = false
                grabPartsModel.DragPart.AlignPosition.Enabled = false

                task.spawn(function()
                    while grabPartsModel.Parent do
                        clonedDragPart.Position = cam.CFrame.Position + cam.CFrame.LookVector * lineDistanceV
                        task.wait()
                    end

                    lineDistanceV = 0
                end)
            end
        end
    end)
end

local function RagdollGrabF()
    if not RagdollGrabT then return end

    local inv = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
    local desk = inv:FindFirstChild("JapaneseDeskMini")
    if not desk then return end

    for _, part in ipairs(desk:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    local main = desk:FindFirstChild("Main")
    if main then
        local bp = main:FindFirstChildOfClass("BodyPosition")
        if not bp then
            bp = Instance.new("BodyPosition")
            bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bp.Position = Vector3.new(9999999, 9999999, 9999999)
            bp.Parent = main
        end
    end

    task.spawn(function()
        while RagdollGrabT do
            local currentDesk = inv:FindFirstChild("JapaneseDeskMini")
            if not currentDesk then break end
            local soundPart = currentDesk:FindFirstChild("SoundPart")
            if soundPart then
                for _, other in pairs(Players:GetPlayers()) do
                    if other.Character and other.Character:FindFirstChild("Head") then
                        local head = other.Character.Head
                        local partOwner = head:FindFirstChild("PartOwner")
                        if partOwner and partOwner:IsA("StringValue") and partOwner.Value == LocalPlayer.Name then
                            local hrp = other.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                soundPart.CFrame = hrp.CFrame
                                task.wait(0.06)
                            end
                        end
                    end
                end
            end
            task.wait(0.06)
        end
    end)
end

-- 수정된 Anti-Grab 함수
local function setRagdollF(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char:WaitForChild("HumanoidRootPart")
        ReplicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote"):FireServer(hrp, state and 1 )
    end
end


local function AntiGrabF()
    -- Services
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local LocalPlayer = Players.LocalPlayer

    -- References
    local IsHeld = LocalPlayer:WaitForChild("IsHeld")
    local TargetCharacter = Workspace:WaitForChild("du1234test1234")
    local HumanoidRootPart = TargetCharacter:WaitForChild("HumanoidRootPart")
    local Humanoid = TargetCharacter:WaitForChild("Humanoid")

    -- Heartbeat 연결 변수
    local moveConnection

    --------------------------------------------------------
    -- Humanoid 설정 함수
    --------------------------------------------------------
    local function configureHumanoid(char)
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.BreakJointsOnDeath = false
            hum.RequiresNeck = false
        end
    end

    -- 초기 설정
    if LocalPlayer.Character then
        configureHumanoid(LocalPlayer.Character)
    end

    -- 새 캐릭터가 생길 때마다 설정 재적용
    LocalPlayer.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid")
        configureHumanoid(char)
    end)

    --------------------------------------------------------
    -- RigType / EvaluateStateMachine 전환 함수
    --------------------------------------------------------
    local function setHumanoidMode(hum, evalState, rigType, duration)
        if not hum then return end
        hum.EvaluateStateMachine = evalState
        hum.RigType = rigType

        if duration then
            task.delay(duration, function()
                if hum then
                    hum.EvaluateStateMachine = true
                    hum.RigType = Enum.HumanoidRigType.R6
                end
            end)
        end
    end

    --------------------------------------------------------
    -- Ragdoll 호출 함수
    --------------------------------------------------------
    local function setRagdollF(state)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char:WaitForChild("HumanoidRootPart")
            ReplicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote"):FireServer(hrp, 1.5)
        end
    end

    --------------------------------------------------------
    -- Held 감지
    --------------------------------------------------------
    IsHeld.Changed:Connect(function(newValue)
        if newValue ~= true then return end

        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChild("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end

        -- ★ EvaluateStateMachine 끄고 RigType R15로 변경 (2초 후 복구)
        setHumanoidMode(hum, false, Enum.HumanoidRigType.R15, 0)

        -- Ragdoll 호출
        setRagdollF(true)
        hum:ChangeState(Enum.HumanoidStateType.GettingUp)

        -- HRP Anchored
        hrp.Anchored = true

        -- Heartbeat에서 반복 Struggle + BallSocketConstraint 끄기 + 이동
        if not moveConnection then
            moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
                if not IsHeld or IsHeld.Value == false then
                    hrp.Anchored = false
                    moveConnection:Disconnect()
                    moveConnection = nil
                    return
                end

                -- Struggle 반복 호출
                ReplicatedStorage.CharacterEvents.Struggle:FireServer(LocalPlayer)

                -- BallSocketConstraint 끄기
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        for _, c in pairs(part:GetDescendants()) do
                            if c:IsA("BallSocketConstraint") then
                                c.Enabled = false
                            end
                        end
                    end
                end

                -- 이동 처리
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    char:TranslateBy(moveDir * 16 * deltaTime)
                end
            end)
        end
    end)

    --------------------------------------------------------
    -- Blobman 웰드 감지
    --------------------------------------------------------
    local function setupWeldWatcher(weld)
        local prev = weld.Attachment0
        local ragdolling = false -- 중복 방지 플래그

        weld:GetPropertyChangedSignal("Attachment0"):Connect(function()
            local now = weld.Attachment0

            -- RootAttachment였다가 nil로 바뀔 때만 실행
            if prev and prev.Name == "RootAttachment" and now == nil then
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChild("Humanoid")
                if char and hum and char:FindFirstChild("HumanoidRootPart") and not ragdolling then
                    ragdolling = true

                    -- ★ 잡혔다고 판단 -> EvaluateStateMachine 끄고 R15로 변경
                    setHumanoidMode(hum, false, Enum.HumanoidRigType.R15, 2)

                    -- 5초 동안 0 호출 반복
                    task.spawn(function()
                        local start = tick()
                        while tick() - start < 5 do
                            pcall(function()
                                ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(char.HumanoidRootPart, 0)
                                for _, part in pairs(char:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        for _, c in pairs(part:GetDescendants()) do
                                            if c:IsA("BallSocketConstraint") then
                                                c.Enabled = false
                                            end
                                        end
                                    end
                                end
                            end)
                            task.wait(0.1)
                        end
                        ragdolling = false
                    end)
                end
            end
            prev = now
        end)
    end

    local function monitorBlobman(blobman)
        local rd = blobman:FindFirstChild("RightDetector")
        if rd and rd:FindFirstChild("RightWeld") then
            setupWeldWatcher(rd.RightWeld)
        end
        local ld = blobman:FindFirstChild("LeftDetector")
        if ld and ld:FindFirstChild("LeftWeld") then
            setupWeldWatcher(ld.LeftWeld)
        end
    end

    -- 처음 workspace에 존재하는 Blobman 감시
    for _, d in pairs(workspace:GetDescendants()) do
        if d.Name == "CreatureBlobman" then
            monitorBlobman(d)
        end
    end

    -- 나중에 생기는 Blobman도 감시
    workspace.DescendantAdded:Connect(function(d)
        if d.Name == "CreatureBlobman" then
            monitorBlobman(d)
        end
    end)
end





local function AntiDeathF()
    task.spawn(function()
        while AntiDeathT do
            local Character = LocalPlayer.Character
            if not Character then task.wait() continue end
            local inv = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")

            if inv and Character then
                for _, item in ipairs(inv:GetChildren()) do
                    if item.Name == "FoodDonut" and item:FindFirstChild("HoldPart") then
                        local HoldItemRemoteFunction = item.HoldPart:FindFirstChild("HoldItemRemoteFunction")
                        local DropItemRemoteFunction = item.HoldPart:FindFirstChild("DropItemRemoteFunction")

                        if HoldItemRemoteFunction and DropItemRemoteFunction then
                            HoldItemRemoteFunction:InvokeServer(item, Character)
                            DropItemRemoteFunction:InvokeServer(item, CFrame.new(0,1000,0), Vector3.new(0,1000,0))
                        end
                    end
                end
            end
            task.wait()
        end
    end)
end

local function AntiLagF()
    local sampleSize = 30
    local fpsSamples = {}
    local active = false
    local lastLow = tick()

    if _G.antiLagConnection then _G.antiLagConnection:Disconnect() end

    _G.antiLagConnection = RunService.RenderStepped:Connect(function()
        if not antiLagT then
            if _G.antiLagConnection then
                _G.antiLagConnection:Disconnect()
                _G.antiLagConnection = nil
            end
            LocalPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = true
            return
        end

        local now = tick()
        table.insert(fpsSamples, now)
        while #fpsSamples > sampleSize do
            table.remove(fpsSamples, 1)
        end

        local fps = 60
        if #fpsSamples >= 2 then
            local duration = fpsSamples[#fpsSamples] - fpsSamples[1]
            fps = math.floor((#fpsSamples - 1) / duration)
        end

        if fps <= 10 and not active then
            active = true
            LocalPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = true
            lastLow = tick()

            task.spawn(function()
                while active and antiLagT do
                    task.wait(7)

                    local fpsCheckSamples = {}
                    for _ = 1, sampleSize do
                        local t1 = tick()
                        RunService.RenderStepped:Wait()
                        table.insert(fpsCheckSamples, tick() - t1)
                    end

                    local avg = 0
                    for _, dt in ipairs(fpsCheckSamples) do
                        avg += dt
                    end

                    local avgFPS = math.floor(sampleSize / avg)

                    if avgFPS > 10 then
                        active = false
                        LocalPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = true
                        break
                    else
                        LocalPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = true
                    end
                end
            end)
        end
    end)
end

--[[local EP = Workspace:WaitForChild("Map"):WaitForChild("Hole"):WaitForChild("PoisonSmallHole"):WaitForChild("ExtinguishPart")
local AntiBurnRunning = false

local function antiBurnF()
    if not AntiBurnT then
        EP.Size = Vector3.new(103.9, 7.5, 95.14)
        EP.CFrame = CFrame.new(157.07, -58.82, 287.34, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        EP.Transparency = 0.5
        AntiBurnRunning = false
        return
    end

    if AntiBurnRunning then return end
    AntiBurnRunning = true

    task.spawn(function()
        while AntiBurnT do
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local debounce = hum and hum:FindFirstChild("FireDebounce")

            if EP and EP.Parent then
                EP.Size = Vector3.new(1, 1, 1)
                EP.Transparency = 1

                if debounce and debounce.Value == true and hrp then
                    EP.CFrame = hrp.CFrame
                else
                    EP.CFrame = CFrame.new(0, -50, 0)
                end
            end

            task.wait(0.2)
        end
    end)
end
]]
local plotItemsFolder = Workspace:WaitForChild("PlotItems")
local playersInPlotsFolder = plotItemsFolder:WaitForChild("PlayersInPlots")

local function antiInPlotsLoop()
    while antiInPlotsEnabled do
        for _, player in pairs(Players:GetPlayers()) do
            local char = player.Character
            if char and char.Parent then
                local inPlot = playersInPlotsFolder:FindFirstChild(player.Name)

                if inPlot then
                    if char.Parent ~= Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys") then
                        char.Parent = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
                    end
                end
            end
        end
        task.wait(0.2)
    end
end

local function spawnBlobmanF()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local inv = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
    local blob = inv and inv:FindFirstChild("CreatureBlobman")
    if blob then return blob end

    local spawnRemote = ReplicatedStorage:FindFirstChild("MenuToys") and ReplicatedStorage.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
    if spawnRemote then
        pcall(function()
            spawnRemote:InvokeServer("CreatureBlobman", hrp.CFrame, Vector3.new(0, 0, 0))
        end)
        
        local tries = 0
        repeat
            task.wait(0.2)
            blob = inv and inv:FindFirstChild("CreatureBlobman")
            tries += 1
        until blob or tries > 25
    end
    
    return blob
end

local ragdollLoopD = false
local function sitJumpF()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if not char or not hum then return end

    local inv = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
    local blob = inv:FindFirstChild("CreatureBlobman")
    if not blob then return end

    local seat = blob:FindFirstChildWhichIsA("VehicleSeat")
    if seat and seat.Occupant == hum then
        seat:Sit(hum)
    end
end

local function ragdollLoopF()
    if ragdollLoopD then return end
    ragdollLoopD = true

    while sitJumpT do
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if char and hrp then
            local args = {[1] = hrp, [2] = 0}
            local remote = ReplicatedStorage:FindFirstChild("CharacterEvents") and ReplicatedStorage.CharacterEvents:FindFirstChild("RagdollRemote")
            if remote then
                remote:FireServer(unpack(args))
            end
        end
        task.wait()
    end

    ragdollLoopD = false
end

------------ UI Setup ------------
local Window = Library:CreateWindow({
    Title = "Dungi? - bomba mode",
    Footer = "by nether",
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Toggle = Window:AddTab("Anti", "shield"),
    Visuals = Window:AddTab("Visuals", "eye"),
    Blob = Window:AddTab("Blob", "droplet"),
    Targets = Window:AddTab("Targets", "target"),
    Utilities = Window:AddTab("Utilities", "cpg"),
    UISettings = Window:AddTab("Settings", "settings"),
}

------------ Visuals Tab ------------
local VisualsLeftGroupBox = Tabs.Visuals:AddLeftGroupbox("ESP", "boxes")

VisualsLeftGroupBox:AddToggle("PCLD_Toggle", {
    Text = "Player ESP",
    Default = false,
    Callback = function(Value)
        if Value then
            enableESP()
        else
            disableESP()
        end
    end
})

VisualsLeftGroupBox:AddToggle("FP_ESP", {
    Text = "First Person ESP",
    Default = false,
    Callback = function(Value)
        if Value then
            enableFirstPersonESP()
        else
            disableFirstPersonESP()
        end
    end
})

------------ Blob Tab ------------
local BlobLeftGroupBox = Tabs.Blob:AddLeftGroupbox("Blob Features", "boxes")

-- 수정된 드롭다운
local BlobDropdown = BlobLeftGroupBox:AddDropdown("BlobTargetDropdown", {
    Values = getPlayerList(),
    Default = nil,
    Multi = false,
    Text = "Select Target",
    Tooltip = "Select a player to target with Blob features",
    Callback = function(Value)
        if Value and Players:FindFirstChild(Value) then
            selectedTargets = Value
            Library:Notify("Selected target: " .. Value, 2)
        else
            selectedTargets = nil
            Library:Notify("No target selected", 2)
        end
    end
})

local MouseTargetToggle = BlobLeftGroupBox:AddToggle("MouseTargetToggle", {
    Text = "Mouse Target",
    Default = false,
    Callback = function(Value)
        if Value then
            toggleTargetByMouse()
        end
    end
})

local MouseTargetKeybind = MouseTargetToggle:AddKeyPicker("MouseTargetKeybind", {
    Default = "Five",
    Text = "Mouse Target Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            toggleTargetByMouse()
        end
    end
})

-- 수정된 Grab Loop
-- 수정된 Grab Loop
-- 수정된 Grab Loop 부분
-- 수정된 Grab Loop 부분
BlobLeftGroupBox:AddToggle("GrabLoopToggle", {
    Text = "Grab Loop",
    Default = false,
    Callback = function(Value)
        isToggled = Value
        
        -- 토글이 꺼질 때는 알림 없이 종료
        if not Value then
            return
        end
        
        -- 토글이 켜질 때만 검증
        if not selectedTargets then
            Library:Notify("No target selected!", 3)
            Toggles.GrabLoopToggle:SetValue(false)
            return
        end
        
        task.spawn(function()
            local blob = getBlobman()
            if not blob then
                Library:Notify("Blobman not found!", 3)
                Toggles.GrabLoopToggle:SetValue(false)
                return
            end
            
            local targetChar = findPlayerCharacter(selectedTargets)
            if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
                selectedTargets = nil
                BlobDropdown:SetValue(nil)
                Toggles.GrabLoopToggle:SetValue(false)
                Library:Notify("Target character not found!", 3)
                return
            end
            
            local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
            local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
            local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
            local del = ReplicatedStorage.GrabEvents.DestroyGrabLine
            local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
            
            local localHrp = getCurrentCharacter().HumanoidRootPart
            if not localHrp then
                Library:Notify("Local player HRP not found!", 3)
                Toggles.GrabLoopToggle:SetValue(false)
                return
            end
            
            local originalPosition = localHrp.CFrame
            local target = targetChar.HumanoidRootPart
            
            -- 1. 로컬 플레이어가 상대에게 TP
            localHrp.CFrame = target.CFrame
            task.wait(0.2)
            
            -- 2. CreatureGrab과 CreatureRelease 호출
            grab:FireServer(blob.LeftDetector, target, blob.LeftDetector.LeftWeld)
            release:FireServer(blob.LeftDetector.LeftWeld)
            task.wait(0.1)
            
            -- 3. 로컬 플레이어가 원래 자리로 이동
            localHrp.CFrame = originalPosition
            task.wait(0.2)
            
            -- 4. 상대를 로컬 플레이어 위 Y 10 위치로 이동, Massless = true
            target.CFrame = localHrp.CFrame * CFrame.new(0, 10, 0)
            target.Massless = true
            task.wait(0.1)
            
            -- 5. SetNetworkOwner와 DestroyGrabLine 호출
            set:FireServer(target, target.CFrame)
            del:FireServer(target)
            
            -- 6. Massless = false
            target.Massless = false
            
            Library:Notify("Grab loop started on " .. selectedTargets, 3)
            
            -- 7. 왼쪽, 오른쪽 그랩 -> 왼쪽, 오른쪽 드롭 반복 호출
            while isToggled and selectedTargets do
                local targetChar = findPlayerCharacter(selectedTargets)
                if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
                    selectedTargets = nil
                    BlobDropdown:SetValue(nil)
                    Toggles.GrabLoopToggle:SetValue(false)
                    Library:Notify("Target removed", 3)
                    break
                end
                
                local target = targetChar.HumanoidRootPart
                
                -- 왼쪽 그랩
                grab:FireServer(blob.LeftDetector, target, blob.LeftDetector.LeftWeld)
                
                -- 오른쪽 그랩
                grab:FireServer(blob.RightDetector, target, blob.RightDetector.RightWeld)
                
                task.wait(0.1)
                
                -- 왼쪽 드롭
                drop:FireServer(blob.LeftDetector.LeftWeld)
                
                -- 오른쪽 드롭
                drop:FireServer(blob.RightDetector.RightWeld)
                
              
            end
        end)
    end
})

BlobLeftGroupBox:AddButton({
    Text = "Grab Targets",
    Func = function()
        if not selectedTargets then
            Library:Notify("No target selected!", 3)
            return
        end
        
        local blob = getBlobman()
        if not blob then
            Library:Notify("Blobman not found!", 3)
            return
        end
        
        local targetChar = findPlayerCharacter(selectedTargets)
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
            selectedTargets = nil
            BlobDropdown:SetValue(nil)
            Library:Notify("Target character not found!", 3)
            return
        end
        
        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = ReplicatedStorage.GrabEvents.DestroyGrabLine
        
        local localHrp = getCurrentCharacter().HumanoidRootPart
        if not localHrp then
            Library:Notify("Local player HRP not found!", 3)
            return
        end
        
        local originalPosition = localHrp.CFrame
        local target = targetChar.HumanoidRootPart
        
        -- 1. 로컬 플레이어가 상대에게 TP
        localHrp.CFrame = target.CFrame
        task.wait(0.2)
        -- 2. CreatureGrab과 CreatureRelease 호출 (task.wait 없음)
        grab:FireServer(blob.LeftDetector, target, blob.LeftDetector.LeftWeld)
        release:FireServer(blob.LeftDetector.LeftWeld)
        task.wait(0.1)
        -- 3. 로컬 플레이어가 원래 자리로 이동
        localHrp.CFrame = originalPosition
               task.wait(0.2)
        -- 4. 상대를 로컬 플레이어 위 Y 10 위치로 이동, Massless = true
        target.CFrame = localHrp.CFrame * CFrame.new(0, 10, 0)
        target.Massless = true
            task.wait(0.1)
        -- 5. SetNetworkOwner와 DestroyGrabLine 호출
        set:FireServer(target, target.CFrame)
        del:FireServer(target)
        
        -- 6. Massless = false
        target.Massless = false
        
        Library:Notify("Grab that skid... " .. selectedTargets .. " successfully!", 3)
    end,
    DoubleClick = false,
})
-- Blob Tab - Kill Target Toggle
BlobLeftGroupBox:AddToggle("KillTargetToggle", {
    Text = "Kill Target",
    Default = false,
    Tooltip = "Toggle to continuously kill selected target",
    Callback = function(Value)
        if Value then
            if not selectedTargets then
                Library:Notify("No target selected!", 3)
                Toggles.KillTargetToggle:SetValue(false)
                return
            end
            
            local blob = getBlobman()
            if not blob then
                Library:Notify("Blobman not found!", 3)
                Toggles.KillTargetToggle:SetValue(false)
                return
            end
            
            local targetChar = findPlayerCharacter(selectedTargets)
            if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
                selectedTargets = nil
                BlobDropdown:SetValue(nil)
                Toggles.KillTargetToggle:SetValue(false)
                Library:Notify("Target character not found!", 3)
                return
            end
            
            isKilling = true
            Library:Notify("Killing " .. selectedTargets, 3)
            
            -- Kill loop
            task.spawn(function()
                local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
                local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
                local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
                local del = ReplicatedStorage.GrabEvents.DestroyGrabLine
                
                while isKilling and selectedTargets do
                    local targetChar = findPlayerCharacter(selectedTargets)
                    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
                        -- 타겟이 삭제되어도 계속 기다리고 반복
                        Library:Notify("Target not found, waiting...", 3)
                        task.wait(2)
                        continue
                    end
                    
                    local targetHead = targetChar:FindFirstChild("Head")
                    if not targetHead then
                        task.wait(0.5)
                        continue
                    end

                    -- Save original position
                    local originalPosition = getCurrentCharacter().HumanoidRootPart.CFrame

                    -- Move blob to target
                    getCurrentCharacter().HumanoidRootPart.CFrame = targetHead.CFrame
                    task.wait(0.15)

                    -- Execute grab/release
                    grab:FireServer(blob.RightDetector, targetChar.HumanoidRootPart, blob.RightDetector.RightWeld)
                    release:FireServer(blob.RightDetector.RightWeld)
                  

                  task.wait(0.5)
                    -- Force target head to void
                    targetHead.CFrame = CFrame.new(0, -99999, 0)

                    -- Return to original position
                    getCurrentCharacter().HumanoidRootPart.CFrame = originalPosition

                    -- Wait before repeating
                    task.wait(2)
                end
            end)
        else
            isKilling = false
            Library:Notify("Stopped killing", 3)
        end
    end
})


-- Update the dropdown callback to handle kill toggle state
local originalDropdownCallback = BlobDropdown.Callback
BlobDropdown.Callback = function(Value)
    originalDropdownCallback(Value)
    
    -- If kill toggle is active and target changes, update the kill target
    if Toggles.KillTargetToggle and Toggles.KillTargetToggle.Value then
        if Value and Players:FindFirstChild(Value) then
            Library:Notify("Switched kill target to: " .. Value, 3)
        else
            -- 타겟이 삭제되어도 토글을 끄지 않고 계속 유지
            Library:Notify("Target removed, but kill toggle remains active", 3)
        end
    end
end

BlobLeftGroupBox:AddToggle("ShowStudsToggle", {
    Text = "Show Studs",
    Default = false,
    Callback = function(Value)
        showStudsToggle = Value
        
        if Value then
            updateStudsDisplay()
            
            studsConnections.update = RunService.Heartbeat:Connect(function()
                updateStudsDisplay()
            end)
        else
            for _, part in ipairs(studsParts) do
                if part and part.Parent then
                    part:Destroy()
                end
            end
            table.clear(studsParts)
            
            for _, connection in pairs(studsConnections) do
                connection:Disconnect()
            end
            table.clear(studsConnections)
        end
    end
})

BlobLeftGroupBox:AddButton({
    Text = "Auto Grab & Target",
    Func = function()
        autoGrabAndTarget()
    end,
    DoubleClick = false,
})

-- Quick Sit Keybind
local QuickSitToggle = BlobLeftGroupBox:AddToggle("QuickSitToggle", {
    Text = "Quick Sit on Blob",
    Default = false,
    Callback = function(Value)
        if Value then
            sitOnBlob()
        end
    end
})

local QuickSitKeybind = QuickSitToggle:AddKeyPicker("QuickSitKeybind", {
    Default = "Z",
    Text = "Quick Sit Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            sitOnBlob()
        end
    end
})

------------ Blob Tab - Kick All Section ------------
local BlobKickGroupBox = Tabs.Blob:AddLeftGroupbox("Mass Kick / Kill", "boxes")

local function snapBlobTo(blob, targetCFrame)
    local hrp = blob:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = targetCFrame

    local att0 = hrp:FindFirstChild("BlobAttachment") or Instance.new("Attachment", hrp)
    att0.Name = "BlobAttachment"

    local targetPart = workspace:FindFirstChild("BlobTarget") or Instance.new("Part")
    targetPart.Anchored = true
    targetPart.CanCollide = false
    targetPart.Size = Vector3.new(1,1,1)
    targetPart.Transparency = 1
    targetPart.CFrame = targetCFrame
    targetPart.Name = "BlobTarget"
    targetPart.Parent = workspace

    local att1 = targetPart:FindFirstChild("BlobTargetAttachment") or Instance.new("Attachment", targetPart)
    att1.Name = "BlobTargetAttachment"

    local ap = hrp:FindFirstChild("BlobAlignPos") or Instance.new("AlignPosition", hrp)
    ap.Name = "BlobAlignPos"
    ap.Attachment0 = att0
    ap.Attachment1 = att1
    ap.RigidityEnabled = true
    ap.Responsiveness = 300
    ap.MaxForce = math.huge

    local ao = hrp:FindFirstChild("BlobAlignOri") or Instance.new("AlignOrientation", hrp)
    ao.Name = "BlobAlignOri"
    ao.Attachment0 = att0
    ao.Attachment1 = att1
    ao.Responsiveness = 300
    ao.MaxTorque = math.huge
    ao.RigidityEnabled = true
end

local function releaseBlobAlign(blob)
    local hrp = blob:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if hrp:FindFirstChild("BlobAlignPos") then hrp.BlobAlignPos:Destroy() end
    if hrp:FindFirstChild("BlobAlignOri") then hrp.BlobAlignOri:Destroy() end
    if hrp:FindFirstChild("BlobAttachment") then hrp.BlobAttachment:Destroy() end
    local targetPart = workspace:FindFirstChild("BlobTarget")
    if targetPart then targetPart:Destroy() end
end

-- 🔹 Mass Kill 토글
local massKillToggle = BlobKickGroupBox:AddToggle("MassKillToggle", {
    Text = "Mass Kill All",
    Default = false,
    Tooltip = "Toggle to continuously kill players",
})

local massKillLooping = false
local originalBlobPosition = nil

massKillToggle:OnChanged(function()
    massKillLooping = massKillToggle.Value
    
    if massKillLooping then
        local blob = getBlobman()
        if blob and blob:FindFirstChild("HumanoidRootPart") then
            originalBlobPosition = blob.HumanoidRootPart.CFrame
        end
        
        Library:Notify("Mass Kill Toggle Enabled", 3)
        massKillLoop()
    else
        Library:Notify("Mass Kill Toggle Disabled", 3)
        -- Blob 원래 위치 복원
        if originalBlobPosition then
            local blob = getBlobman()
            if blob then
                snapBlobTo(blob, originalBlobPosition)
                task.wait(0.15)
                releaseBlobAlign(blob)
            end
        end
    end
end)

function massKillLoop()
    if not massKillLooping then return end

    local blob = getBlobman()
    if not blob then return end

    local players = getPlayerList()
    if #players == 0 then return end

    local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
    local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
    local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
    local del = ReplicatedStorage.GrabEvents.DestroyGrabLine

    -- 1️⃣ 모든 플레이어를 차례대로 Grab → Release (모두 Blob 근처로 이동)
    for _, playerName in ipairs(players) do
        if not massKillLooping then break end
        local player = Players:FindFirstChild(playerName)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetHrp = player.Character.HumanoidRootPart
            snapBlobTo(blob, targetHrp.CFrame)
            task.wait(0.15)
            grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
            release:FireServer(blob.RightDetector.RightWeld)
        end
    end

    task.wait(0.2) -- 잠깐 대기

    -- 2️⃣ 소유권 전체 변경 + Y = -99999로 내림
    for _, playerName in ipairs(players) do
        if not massKillLooping then break end
        local player = Players:FindFirstChild(playerName)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetHrp = player.Character.HumanoidRootPart
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
       
                targetHrp.CFrame = CFrame.new(0, -99999, 0)
            end
        end
    end

    task.wait(3) -- 체력 변화 대기

    -- 3️⃣ 체력이 0인 플레이어 확인
    local deadPlayersExist = false
    for _, playerName in ipairs(players) do
        local player = Players:FindFirstChild(playerName)
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health <= 0 then
                deadPlayersExist = true
            end
        end
    end

    -- 4️⃣ 죽은 플레이어 존재하면 2~3초 대기 후 다시 반복
    if deadPlayersExist and massKillLooping then
        task.wait(2.5)
        massKillLoop()
    elseif massKillLooping then
        task.wait(1.5)
        massKillLoop()
    end
end


-- 🔹 Mass Kick: 원래 있던 Set/Del/Grab 방식 (기존 코드 유지)
BlobKickGroupBox:AddButton({
    Text = "Mass Kick All",
    Func = function()
       local blob = getBlobman()
        if not blob then
            Library:Notify("Blobman not found!", 3)
            return
        end

        local players = getPlayerList()
        if #players == 0 then
            Library:Notify("No players to kick!", 3)
            return
        end

        Library:Notify("Starting mass kick...", 3)

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = ReplicatedStorage.GrabEvents.DestroyGrabLine

        -- Grab & Release
        for _, playerName in ipairs(players) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                snapBlobTo(blob, targetHrp.CFrame)
                task.wait(0.15)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                release:FireServer(blob.RightDetector.RightWeld)
                task.wait(0)
            end
        end

        -- Blob 맵 중앙 이동
        snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
        task.wait(0.05)


        for _, playerName in ipairs(players) do local player = Players:FindFirstChild(playerName) if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then local targetHrp = player.Character.HumanoidRootPart local blobHrp = blob.HumanoidRootPart targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z) end end task.wait(0)
   
        -- 원래 기능: Set + Del + Grab
        for _, playerName in ipairs(players) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                 set:FireServer(targetHrp, targetHrp.CFrame)
                del:FireServer(targetHrp)
                task.wait(0.05)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
            end
        end

 task.wait(2)
        releaseBlobAlign(blob)
        Library:Notify("Mass kick completed!", 3)

    end,
    DoubleClick = false,
})



------------ Blob Tab - More Functions Section ------------
local BlobRightGroupBox = Tabs.Blob:AddRightGroupbox("More Functions", "boxes")


BlobRightGroupBox:AddToggle("KickNotifyToggle", {
    Text = "Kick Notify",
    Default = false,
    Tooltip = "show notify when someone kicked!",
    Callback = function(Value)
        if Value then
         
            local blackHoleConnection = nil
            
            blackHoleConnection = Workspace.ChildAdded:Connect(function(child)
                if child.Name == "BlackHoleKick" and child:IsA("Model") then
                 
                    local playersBefore = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        playersBefore[player.Name] = true
                    end
                    
                  
                    task.delay(0, function()
                        if not Toggles.KickNotifyToggle.Value then return end
                        
                        local playersAfter = {}
                        for _, player in ipairs(Players:GetPlayers()) do
                            playersAfter[player.Name] = true
                        end
                        
                        -- 사라진 플레이어 찾기
                        for playerName, _ in pairs(playersBefore) do
                            if not playersAfter[playerName] then
                                Library:Notify(playerName .. " skiddo got kicked!", 7)
                            end
                        end
                    end)
                end
            end)
            
            -- 토글이 꺼질 때 연결 해제
            Toggles.KickNotifyToggle:OnChanged(function()
                if not Toggles.KickNotifyToggle.Value and blackHoleConnection then
                    blackHoleConnection:Disconnect()
                    blackHoleConnection = nil
                end
            end)
        end
    end
})

-- 플레이어 입장/퇴장 감지로도 백업 시스템 구현
local function setupPlayerTracking()
    local playerList = {}
    
    for _, player in ipairs(Players:GetPlayers()) do
        playerList[player.Name] = true
    end
    
    Players.PlayerRemoving:Connect(function(player)
        if Toggles.KickNotifyToggle.Value then
            -- BlackHoleKick가 있는지 확인
            local blackHole = Workspace:FindFirstChild("BlackHoleKick")
            if blackHole then
                Library:Notify(player.Name .. " got kicked!", 7)
            end
        end
    end)
end

-- 플레이어 트래킹 설정
setupPlayerTracking()


------------ Show Studs ESP Tracers ------------
local StudsTracers = {}
local studsTracerEnabled = false
local studsColorTransitionTime = 1.5 -- 색상 전환 시간 (1.5초)

-- 부드러운 색상 전환 함수 (하늘색 → 흰색)
local function smoothStudsColorTransition(beam, progress)
    local fromColor = Color3.fromRGB(135, 206, 250) -- 밝은 하늘색
    local toColor = Color3.fromRGB(255, 255, 255)   -- 흰색
    
    -- 진행도에 따라 색상 보간
    local r = fromColor.R + (toColor.R - fromColor.R) * progress
    local g = fromColor.G + (toColor.G - fromColor.G) * progress
    local b = fromColor.B + (toColor.B - fromColor.B) * progress
    
    beam.Color = ColorSequence.new(Color3.new(r, g, b))
end

-- 스터드 ESP 트레이서 생성 함수
local function createStudsTracer(player)
    if not player or not player.Character then
        return nil
    end
    
    local targetChar = player.Character
    if not targetChar:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    
    local localChar = getCurrentCharacter()
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    
    local localHrp = localChar.HumanoidRootPart
    local targetHrp = targetChar.HumanoidRootPart
    
    -- 어태치먼트 생성
    local localAttachment = Instance.new("Attachment")
    localAttachment.Name = "StudsTracerAttachment_Local"
    localAttachment.Parent = localHrp
    
    local targetAttachment = Instance.new("Attachment")
    targetAttachment.Name = "StudsTracerAttachment_Target"
    targetAttachment.Parent = targetHrp
    
    -- 빔 생성
    local beam = Instance.new("Beam")
    beam.Name = "StudsESPBeam"
    beam.Attachment0 = localAttachment
    beam.Attachment1 = targetAttachment
    beam.Color = ColorSequence.new(Color3.fromRGB(135, 206, 250)) -- 밝은 하늘색 시작
    beam.FaceCamera = true
    beam.Width0 = 0.1
    beam.Width1 = 0.1
    beam.Transparency = NumberSequence.new(0.3) -- 약간 투명하게
    beam.Parent = targetChar
    
    return {
        beam = beam,
        localAttachment = localAttachment,
        targetAttachment = targetAttachment,
        targetChar = targetChar,
        player = player,
        transitionStartTime = tick(),
        transitionDirection = 1 -- 1: 하늘색 → 흰색, -1: 흰색 → 하늘색
    }
end

-- 스터드 ESP 트레이서 제거 함수
local function removeStudsTracers()
    for playerName, tracerData in pairs(StudsTracers) do
        if tracerData.beam and tracerData.beam.Parent then
            tracerData.beam:Destroy()
        end
        if tracerData.localAttachment and tracerData.localAttachment.Parent then
            tracerData.localAttachment:Destroy()
        end
        if tracerData.targetAttachment and tracerData.targetAttachment.Parent then
            tracerData.targetAttachment:Destroy()
        end
    end
    StudsTracers = {}
end

-- 스터드 트레이서 색상 업데이트
local function updateStudsTracersColor()
    for playerName, tracerData in pairs(StudsTracers) do
        if not tracerData.beam or not tracerData.beam.Parent then
            StudsTracers[playerName] = nil
            continue
        end
        
        local currentTime = tick()
        local elapsedTime = currentTime - tracerData.transitionStartTime
        
        if elapsedTime >= studsColorTransitionTime then
            -- 색상 전환 완료, 방향 전환
            tracerData.transitionDirection = -tracerData.transitionDirection
            tracerData.transitionStartTime = currentTime
            elapsedTime = 0
        end
        
        -- 부드러운 색상 전환
        local progress = elapsedTime / studsColorTransitionTime
        if tracerData.transitionDirection == 1 then
            smoothStudsColorTransition(tracerData.beam, progress)
        else
            smoothStudsColorTransition(tracerData.beam, 1 - progress)
        end
    end
end

-- 스터드 트레이서 업데이트 함수
local function updateStudsTracers()
    if not studsTracerEnabled or not showStudsToggle then
        removeStudsTracers()
        return
    end
    
    local playersInRadius = getPlayersInRadius(studsRadius)
    
    -- 현재 트레이서가 있는 플레이어 목록
    local currentPlayers = {}
    for playerName, _ in pairs(StudsTracers) do
        currentPlayers[playerName] = true
    end
    
    -- 새로 추가될 플레이어 목록
    local newPlayers = {}
    
    -- 각 플레이어에 대해 트레이서 생성 또는 업데이트
    for _, player in ipairs(playersInRadius) do
        if player ~= LocalPlayer then
            newPlayers[player.Name] = true
            
            if not StudsTracers[player.Name] then
                -- 새 플레이어 트레이서 생성
                local tracer = createStudsTracer(player)
                if tracer then
                    StudsTracers[player.Name] = tracer
                end
            else
                -- 기존 트레이서가 있지만 플레이어 캐릭터가 변경된 경우
                if StudsTracers[player.Name].targetChar ~= player.Character then
                    -- 기존 트레이서 제거
                    if StudsTracers[player.Name].beam then
                        StudsTracers[player.Name].beam:Destroy()
                    end
                    if StudsTracers[player.Name].localAttachment then
                        StudsTracers[player.Name].localAttachment:Destroy()
                    end
                    if StudsTracers[player.Name].targetAttachment then
                        StudsTracers[player.Name].targetAttachment:Destroy()
                    end
                    
                    -- 새 트레이서 생성
                    local tracer = createStudsTracer(player)
                    if tracer then
                        StudsTracers[player.Name] = tracer
                    else
                        StudsTracers[player.Name] = nil
                    end
                end
            end
        end
    end
    
    -- 범위를 벗어난 플레이어의 트레이서 제거
    for playerName, tracerData in pairs(StudsTracers) do
        if not newPlayers[playerName] then
            if tracerData.beam then
                tracerData.beam:Destroy()
            end
            if tracerData.localAttachment then
                tracerData.localAttachment:Destroy()
            end
            if tracerData.targetAttachment then
                tracerData.targetAttachment:Destroy()
            end
            StudsTracers[playerName] = nil
        end
    end
    
    -- 색상 업데이트
    updateStudsTracersColor()
end

-- Show Studs 토글에 ESP 트레이서 기능 추가
local originalShowStudsToggle = Toggles.ShowStudsToggle.Callback
Toggles.ShowStudsToggle.Callback = function(Value)
    showStudsToggle = Value
    
    if Value then
        updateStudsDisplay()
        
        studsConnections.update = RunService.Heartbeat:Connect(function()
            updateStudsDisplay()
            if studsTracerEnabled then
                updateStudsTracers()
            end
        end)
    else
        for _, part in ipairs(studsParts) do
            if part and part.Parent then
                part:Destroy()
            end
        end
        table.clear(studsParts)
        
        for _, connection in pairs(studsConnections) do
            connection:Disconnect()
        end
        table.clear(studsConnections)
        
        removeStudsTracers()
    end
    
    -- 원래 콜백도 실행 (있는 경우)
    if originalShowStudsToggle then
        originalShowStudsToggle(Value)
    end
end

-- More Functions 섹션에 Studs ESP 트레이서 토글 추가
BlobRightGroupBox:AddToggle("StudsTracerToggle", {
    Text = "Studs ESP Tracers",
    Default = false,
    Tooltip = "Show ESP tracers to all players in studs radius",
    Callback = function(Value)
        studsTracerEnabled = Value
        if not Value then
            removeStudsTracers()
            Library:Notify("Studs ESP Tracers disabled", 2)
        else
            if showStudsToggle then
                Library:Notify("Studs ESP Tracers enabled", 2)
                updateStudsTracers()
            else
                Library:Notify("Enable Show Studs first!", 2)
                Toggles.StudsTracerToggle:SetValue(false)
            end
        end
    end
})

-- 스터드 트레이서 루프
task.spawn(function()
    while task.wait(0.05) do
        pcall(function()
            if studsTracerEnabled and showStudsToggle then
                updateStudsTracers()
            else
                removeStudsTracers()
            end
        end)
    end
end)

-- 플레이어 재접속 감지
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if studsTracerEnabled and showStudsToggle then
            task.wait(1) -- 캐릭터 로딩 대기
            removeStudsTracers()
            updateStudsTracers()
        end
    end)
end)

-- 플레이어 나갈 때 트레이서 제거
Players.PlayerRemoving:Connect(function(player)
    if StudsTracers[player.Name] then
        local tracerData = StudsTracers[player.Name]
        if tracerData.beam then
            tracerData.beam:Destroy()
        end
        if tracerData.localAttachment then
            tracerData.localAttachment:Destroy()
        end
        if tracerData.targetAttachment then
            tracerData.targetAttachment:Destroy()
        end
        StudsTracers[player.Name] = nil
    end
end)

-- 캐릭터 변경 시 트레이서 업데이트
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1) -- 캐릭터 로딩 대기
    if studsTracerEnabled and showStudsToggle then
        removeStudsTracers()
        updateStudsTracers()
    end
end)

------------ Blob Tab ESP Tracers ------------
local ESPTracers = {}
local tracerTarget = nil
local lastColorChange = tick()
local espTracerEnabled = false
local colorTransitionTime = 1.0 -- 색상 전환 시간 (1초)

-- ESP 기준점 가져오기 함수 (Blob RightDetector 또는 로컬 HRP)
local function getESPAnchor()
    local blob = getBlobman()
    if blob and blob:FindFirstChild("RightDetector") then
        return blob.RightDetector
    end
    
    local localChar = getCurrentCharacter()
    if localChar and localChar:FindFirstChild("HumanoidRootPart") then
        return localChar.HumanoidRootPart
    end
    
    return nil
end

-- 부드러운 색상 전환 함수
local function smoothColorTransition(beam, fromColor, toColor, progress)
    local r = fromColor.R + (toColor.R - fromColor.R) * progress
    local g = fromColor.G + (toColor.G - fromColor.G) * progress
    local b = fromColor.B + (toColor.B - fromColor.B) * progress
    beam.Color = ColorSequence.new(Color3.new(r, g, b))
end

-- ESP 트레이서 생성 함수
local function createTracer(targetChar)
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    
    local anchorPart = getESPAnchor()
    if not anchorPart then
        return nil
    end
    
    local targetHrp = targetChar.HumanoidRootPart
    
    -- 어태치먼트 생성
    local anchorAttachment = Instance.new("Attachment")
    anchorAttachment.Name = "ESPTracerAttachment_Anchor"
    anchorAttachment.Parent = anchorPart
    
    local targetAttachment = Instance.new("Attachment")
    targetAttachment.Name = "ESPTracerAttachment_Target"
    targetAttachment.Parent = targetHrp
    
    -- 빔 생성
    local beam = Instance.new("Beam")
    beam.Name = "ESPBeam"
    beam.Attachment0 = anchorAttachment
    beam.Attachment1 = targetAttachment
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0)) -- 빨간색 시작
    beam.FaceCamera = true
    beam.Width0 = 0.15
    beam.Width1 = 0.15
    beam.ZOffset = 1 -- 약간 앞에 표시
    beam.Parent = targetChar
    
    return {
        beam = beam,
        anchorAttachment = anchorAttachment,
        targetAttachment = targetAttachment,
        targetChar = targetChar,
        anchorPart = anchorPart,
        currentColor = Color3.fromRGB(255, 0, 0),
        targetColor = Color3.fromRGB(0, 0, 0),
        transitionStartTime = tick()
    }
end

-- ESP 트레이서 제거 함수
local function removeTracer()
    if ESPTracers.beam and ESPTracers.beam.Parent then
        ESPTracers.beam:Destroy()
    end
    if ESPTracers.anchorAttachment and ESPTracers.anchorAttachment.Parent then
        ESPTracers.anchorAttachment:Destroy()
    end
    if ESPTracers.targetAttachment and ESPTracers.targetAttachment.Parent then
        ESPTracers.targetAttachment:Destroy()
    end
    ESPTracers = {}
    tracerTarget = nil
end

-- 부드러운 색상 업데이트 함수
local function updateTracerColor()
    if not ESPTracers.beam or not ESPTracers.beam.Parent then
        return
    end
    
    local currentTime = tick()
    local elapsedTime = currentTime - ESPTracers.transitionStartTime
    
    if elapsedTime >= colorTransitionTime then
        -- 색상 전환 완료, 다음 색상으로 변경
        if ESPTracers.currentColor == Color3.fromRGB(255, 0, 0) then
            ESPTracers.currentColor = Color3.fromRGB(0, 0, 0)
            ESPTracers.targetColor = Color3.fromRGB(255, 0, 0)
        else
            ESPTracers.currentColor = Color3.fromRGB(255, 0, 0)
            ESPTracers.targetColor = Color3.fromRGB(0, 0, 0)
        end
        ESPTracers.transitionStartTime = currentTime
        elapsedTime = 0
    end
    
    -- 부드러운 색상 전환
    local progress = elapsedTime / colorTransitionTime
    smoothColorTransition(ESPTracers.beam, ESPTracers.currentColor, ESPTracers.targetColor, progress)
end

-- 기준점 변경 시 트레이서 업데이트
local function updateTracerAnchor()
    if not ESPTracers.beam or not ESPTracers.beam.Parent then
        return
    end
    
    local newAnchor = getESPAnchor()
    if not newAnchor or newAnchor == ESPTracers.anchorPart then
        return
    end
    
    -- 기준점이 변경되었으면 트레이서 재생성
    removeTracer()
    local targetChar = findPlayerCharacter(selectedTargets)
    if targetChar then
        ESPTracers = createTracer(targetChar)
    end
end

-- ESP 트레이서 업데이트 함수
local function updateTracer()
    if not espTracerEnabled or not selectedTargets then
        if ESPTracers.beam then
            removeTracer()
        end
        return
    end
    
    local targetChar = findPlayerCharacter(selectedTargets)
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
        if ESPTracers.beam then
            removeTracer()
        end
        return
    end
    
    local anchorPart = getESPAnchor()
    if not anchorPart then
        if ESPTracers.beam then
            removeTracer()
        end
        return
    end
    
    -- 대상이 변경되었거나 트레이서가 없는 경우 새로 생성
    if tracerTarget ~= selectedTargets or not ESPTracers.beam or not ESPTracers.beam.Parent then
        removeTracer()
        ESPTracers = createTracer(targetChar)
        tracerTarget = selectedTargets
    end
    
    -- 트레이서가 있는 경우 색상 업데이트 및 기준점 확인
    if ESPTracers.beam and ESPTracers.beam.Parent then
        updateTracerColor()
        updateTracerAnchor()
    end
end

-- 플레이어 재접속 감지 함수
local function setupPlayerReconnectDetection()
    local playerCharacters = {}
    
    -- 모든 플레이어의 현재 캐릭터 추적
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            playerCharacters[player.Name] = player.Character
        end
    end
    
    -- 플레이어 캐릭터 변경 감지
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            if player.Name == selectedTargets and espTracerEnabled then
                -- 대상 플레이어가 재접속했을 때 트레이서 재생성
                task.wait(2) -- 캐릭터 로딩 대기
                removeTracer()
                updateTracer()
                Library:Notify("Target reconnected, updating ESP tracer", 2)
            end
            playerCharacters[player.Name] = character
        end)
    end)
    
    -- 플레이어 캐릭터 제거 감지
    Players.PlayerRemoving:Connect(function(player)
        playerCharacters[player.Name] = nil
    end)
end

-- More Functions 섹션에 ESP 트레이서 토글 추가
BlobRightGroupBox:AddToggle("ESPTracerToggle", {
    Text = "ESP Tracer",
    Default = false,
    Tooltip = "Show ESP tracer to selected target from Blob's RightDetector",
    Callback = function(Value)
        espTracerEnabled = Value
        if not Value then
            removeTracer()
            Library:Notify("ESP Tracer disabled", 2)
        else
            if selectedTargets then
                Library:Notify("ESP Tracer enabled for " .. selectedTargets, 2)
                updateTracer()
            else
                Library:Notify("Select a target first!", 2)
                Toggles.ESPTracerToggle:SetValue(false)
            end
        end
    end
})

-- 드롭다운 콜백 수정: ESP 트레이서 업데이트
BlobDropdown:OnChanged(function(Value)
    if Value and Players:FindFirstChild(Value) then
        selectedTargets = Value
        Library:Notify("Selected target: " .. Value, 2)
        
        -- ESP 트레이서가 활성화된 상태에서 대상 변경 시 트레이서 업데이트
        if espTracerEnabled then
            removeTracer()
            updateTracer()
        end
    else
        selectedTargets = nil
        Library:Notify("No target selected", 2)
        removeTracer()
    end
end)

-- ESP 트레이서 루프
task.spawn(function()
    while task.wait(0.05) do -- 더 빠른 업데이트를 위해 0.05초 간격
        pcall(function()
            if espTracerEnabled then
                updateTracer()
            else
                if ESPTracers.beam then
                    removeTracer()
                end
            end
        end)
    end
end)

-- 캐릭터 변경 시 트레이서 업데이트
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1) -- 캐릭터 로딩 대기
    if espTracerEnabled then
        removeTracer()
        updateTracer()
    end
end)

-- 플레이어 재접속 감지 설정
setupPlayerReconnectDetection()

-- Blob 생성/제거 시 트레이서 업데이트
Workspace.ChildAdded:Connect(function(child)
    if child.Name == LocalPlayer.Name .. "SpawnedInToys" and espTracerEnabled then
        task.wait(1) -- 폴더 내 내용물 로딩 대기
        removeTracer()
        updateTracer()
    end
end)

Workspace.ChildRemoved:Connect(function(child)
    if child.Name == LocalPlayer.Name .. "SpawnedInToys" and espTracerEnabled then
        removeTracer()
        updateTracer()
    end
end)

------------ Targets Tab (왼쪽으로 이동) ------------
local TargetsLeftGroupBox = Tabs.Targets:AddLeftGroupbox("Target Actions", "boxes")

-- 수정된 드롭다운
local TargetDropdown = TargetsLeftGroupBox:AddDropdown("TargetPlayerDropdown", {
    Values = getPlayerOptions(),
    Default = 1,
    Multi = false,
    Text = "Targets",
    Callback = function(Value)
        if Value then
            targetPlayer = Players:FindFirstChild(Value)
        else
            targetPlayer = nil
        end
    end
})

TargetsLeftGroupBox:AddButton({
    Text = "Spawn Pallet",
    Func = function()
        pallet = spawnPallet()
        if pallet then
            Library:Notify("Pallet spawned successfully!", 3)
        else
            Library:Notify("Failed to spawn pallet!", 3)
        end
    end,
    DoubleClick = false,
})

-- Toggle Target Loop Keybind
local ToggleTargetToggle = TargetsLeftGroupBox:AddToggle("ToggleTargetToggle", {
    Text = "Toggle Target Loop",
    Default = false,
    Callback = function(Value)
        if Value then
            toggleTargetByMouseTargetTab()
        end
    end
})

local ToggleKeybind = ToggleTargetToggle:AddKeyPicker("ToggleKeybind", {
    Default = "V",
    Text = "Toggle Target Loop Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            toggleTargetByMouseTargetTab()
        end
    end
})

-- Ragdoll Target Keybind
local TouchToggle = TargetsLeftGroupBox:AddToggle("TouchToggle", {
    Text = "Ragdoll Target",
    Default = false,
    Callback = function(Value)
        if Value then
            if not ensurePalletExists() then
                Library:Notify("No pallet found!", 3)
                return
            end

            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = targetPlayer.Character.HumanoidRootPart

                clearAlign(pallet)
                task.wait()
                
                firetouchinterest(pallet, hrp, 0)
                firetouchinterest(pallet, hrp, 1)

                local bvPallet = Instance.new("BodyVelocity")
                bvPallet.Velocity = Vector3.new(0, -1000, 0)
                bvPallet.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                bvPallet.P = 1e5
                bvPallet.Parent = pallet

                task.delay(0.1, function()
                    if bvPallet and bvPallet.Parent then bvPallet:Destroy() end
                    if pallet and pallet.Parent then
                        setupAlign(pallet)
                    end
                end)
            end
        end
    end
})

local TouchKeybind = TouchToggle:AddKeyPicker("TouchKeybind", {
    Default = "H",
    Text = "Ragdoll Target Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            if not ensurePalletExists() then
                Library:Notify("No pallet found!", 3)
                return
            end

            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = targetPlayer.Character.HumanoidRootPart

                clearAlign(pallet)
                task.wait()
                
                firetouchinterest(pallet, hrp, 0)
                firetouchinterest(pallet, hrp, 1)

                local bvPallet = Instance.new("BodyVelocity")
                bvPallet.Velocity = Vector3.new(0, -1000, 0)
                bvPallet.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                bvPallet.P = 1e5
                bvPallet.Parent = pallet

                task.delay(0.1, function()
                    if bvPallet and bvPallet.Parent then bvPallet:Destroy() end
                    if pallet and pallet.Parent then
                        setupAlign(pallet)
                    end
                end)
            end
        end
    end
})

-- Drop Limbs Keybind
local DropLimbsToggle = TargetsLeftGroupBox:AddToggle("DropLimbsToggle", {
    Text = "Drop Limbs",
    Default = false,
    Callback = function(Value)
        if Value then
            dropLimbsAndMoveTorso()
        end
    end
})

local DropLimbsKeybind = DropLimbsToggle:AddKeyPicker("DropLimbsKeybind", {
    Default = "N",
    Text = "Drop Limbs Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            dropLimbsAndMoveTorso()
        end
    end
})

------------ Utilities Tab ------------
local UtilitiesLeftGroupBox = Tabs.Utilities:AddLeftGroupbox("Utility Functions", "boxes")

UtilitiesLeftGroupBox:AddSlider("TriggerDuration", {
    Text = "Gucci Duration",
    Range = {0.05, 2},
    Increment = 0.05,
    Suffix = "s",
    Default = 0.1,
    Callback = function(Value)
        durationTime = Value
    end
})

-- Auto Gucci Keybind
local AutoGucciToggle = UtilitiesLeftGroupBox:AddToggle("AutoGucciToggle", {
    Text = "Auto Gucci",
    Default = false,
    Callback = function(Value)
        if Value then
            autoGucciTrigger()
        end
    end
})

local AutoGucciKey = AutoGucciToggle:AddKeyPicker("AutoGucciKey", {
    Default = "J",
    Text = "Auto Gucci Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            autoGucciTrigger()
        end
    end
})

-- Sit on Blob Keybind
local AutoGucciSitToggle = UtilitiesLeftGroupBox:AddToggle("AutoGucciSitToggle", {
    Text = "Sit on Blob",
    Default = false,
    Callback = function(Value)
        if Value then
            autoGucciTrigger()
        end
    end
})

local AutoGucciKeysit = AutoGucciSitToggle:AddKeyPicker("AutoGucciKeysit", {
    Default = "X",
    Text = "Sit on Blob Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            autoGucciTrigger()
        end
    end
})

-- Gucci Working Keybind
local AutoGucciWorkingToggle = UtilitiesLeftGroupBox:AddToggle("AutoGucciWorkingToggle", {
    Text = "Gucci Working",
    Default = false,
    Callback = function(Value)
        if Value then
            autoGucciWorking()
        end
    end
})

local AutoGucciWorkingKey = AutoGucciWorkingToggle:AddKeyPicker("AutoGucciWorkingKey", {
    Default = "M",
    Text = "Gucci Working Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            autoGucciWorking()
        end
    end
})

UtilitiesLeftGroupBox:AddButton({
    Text = "Disable Plot Barriers",
    Func = function()
        hamburgerTeleport()
        task.wait(0.5)
        disablePlotBarriers()
    end,
    DoubleClick = false,
})

------------ Toggle Tab ------------
local ToggleLeftGroupBox = Tabs.Toggle:AddLeftGroupbox("Toggles", "boxes")

ToggleLeftGroupBox:AddToggle("AntiGrabTP", {
    Text = "AntiGrabTP",
    Default = false,
    Callback = function(Value)
        AntiGrabTP_Active = Value
        task.spawn(function()
            while AntiGrabTP_Active and task.wait() do
                local char = LocalPlayer.Character
                if not char then continue end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end

                local randomX = math.random(-1000, 1000)
                local randomZ = math.random(-1000, 1000)
                local fixedY = 500

                hrp.CFrame = CFrame.new(randomX, fixedY, randomZ)
            end
        end)
    end
})

ToggleLeftGroupBox:AddToggle("AntiGrabEvent", {
    Text = "Anti Grab",
    Default = false,
    Callback = function(Value)
        AntiGrabT = Value
        if Value then
            task.spawn(AntiGrabF)
        end
    end
})
------------ Anti Tab ------------

-- Anti-Kick 상태
local antiKickActive = false
local antiKickKunai
local antiKickSelectionBox
local antiKickConnections = {}

local function setupAntiKick()
    if not antiKickActive then return end
    local character = LocalPlayer.Character
    if not character then return end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local firePart = rootPart and rootPart:FindFirstChild("FirePlayerPart")
    if not rootPart or not firePart then return end

    task.spawn(function()
        local SpawnToyRemoteFunction = ReplicatedStorage.MenuToys.SpawnToyRemoteFunction
        local StickyPartEvent = ReplicatedStorage.PlayerEvents.StickyPartEvent
        local GrabSetNetworkOwner = ReplicatedStorage.GrabEvents.SetNetworkOwner

        -- 쿠나이 스폰 (task.spawn 병렬)
        task.spawn(function()
            local success, result = pcall(function()
                return SpawnToyRemoteFunction:InvokeServer(
                    "NinjaKunai",
                    firePart.CFrame + Vector3.new(0, 0, 0),
                    firePart.Position
                )
            end)
            if not success then
                Library:Notify("Failed to spawn Kunai: " .. tostring(result), 5)
                return
            end
        end)

        task.wait(0.3)
        local kunaiFolder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        if not kunaiFolder then return end

        antiKickKunai = kunaiFolder:FindFirstChild("NinjaKunai")
        if not antiKickKunai then return end

        local sticky = antiKickKunai:FindFirstChild("StickyPart")
        if not sticky then return end

        local offset = CFrame.new(0, -0.5, 0, 1.9106854651647e-15, 1000.3711388286738e-08, 1, 1, -4.3711388286738e-08, 0, 4.3711388286738e-08, 1, -4.3711388286738e-08)

        -- 소유권 강제 적용
        task.spawn(function()
            pcall(function()
                GrabSetNetworkOwner:FireServer(sticky, sticky.CFrame)
            end)
        end)

        -- StickyPart 이벤트 붙이기
        task.spawn(function()
            pcall(function()
                StickyPartEvent:FireServer(sticky, firePart, offset)
            end)
        end)

        -- 파츠 속성 적용
        task.spawn(function()
            for _, part in ipairs(antiKickKunai:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanTouch = false
                    part.CanCollide = false
                    part.CanQuery = false
                    part.Transparency = 1
                end
            end
        end)

        -- SelectionBox 생성
        task.spawn(function()
            if antiKickSelectionBox and antiKickSelectionBox.Parent then
                antiKickSelectionBox:Destroy()
            end
            antiKickSelectionBox = Instance.new("SelectionBox")
            antiKickSelectionBox.Adornee = antiKickKunai
            antiKickSelectionBox.LineThickness = 0.001
            antiKickSelectionBox.Parent = antiKickKunai

            -- 색상 사이클
            local colors = {Color3.fromRGB(255,255,255), Color3.fromRGB(0,0,0)}
            task.spawn(function()
                local t = 0
                local speed = 0.5
                local currentColorIndex = 1
                while antiKickActive and antiKickSelectionBox and antiKickSelectionBox.Parent do
                    t += task.wait() * speed
                    local colorIndex1 = currentColorIndex
                    local colorIndex2 = currentColorIndex % #colors + 1
                    local progress = math.sin(t * math.pi) * 0.5 + 0.5
                    antiKickSelectionBox.Color3 = colors[colorIndex1]:Lerp(colors[colorIndex2], progress)
                    if progress >= 0.99 then
                        currentColorIndex = currentColorIndex % #colors + 1
                        t = 0
                    end
                end
            end)

            -- 깜빡임
            task.spawn(function()
                while antiKickActive and antiKickSelectionBox and antiKickSelectionBox.Parent do
                    for transparency = 1, 0, -0.05 do
                        if not antiKickActive or not antiKickSelectionBox or not antiKickSelectionBox.Parent then break end
                        antiKickSelectionBox.Transparency = transparency
                        task.wait(0.1)
                    end
                    task.wait(5)
                    for transparency = 0, 1, 0.05 do
                        if not antiKickActive or not antiKickSelectionBox or not antiKickSelectionBox.Parent then break end
                        antiKickSelectionBox.Transparency = transparency
                        task.wait(0.1)
                    end
                    antiKickSelectionBox.Transparency = 1
                    task.wait(5)
                end
            end)
        end)
    end)

    Library:Notify("Anti-Kick activated!", 3)
end

-- Anti-Kick 토글
ToggleLeftGroupBox:AddToggle("AntiKickToggle", {
    Text = "Anti Kick",
    Default = false,
    Tooltip = "Protects against kicks using NinjaKunai",
    Callback = function(Value)
        antiKickActive = Value

        if Value then
            if LocalPlayer.Character then
                setupAntiKick()
            end

            if not antiKickConnections.characterAdded then
                antiKickConnections.characterAdded = LocalPlayer.CharacterAdded:Connect(function()
                    if antiKickActive then
                        task.wait(1)
                        setupAntiKick()
                    end
                end)
            end
        else
            for _, connection in pairs(antiKickConnections) do
                connection:Disconnect()
            end
            antiKickConnections = {}

            if antiKickSelectionBox and antiKickSelectionBox.Parent then
                antiKickSelectionBox:Destroy()
            end

            Library:Notify("Anti-Kick deactivated!", 3)
        end
    end
})



-- Anti-Kick 키바인드

local antiMasslessConnection = nil

ToggleLeftGroupBox:AddToggle("AntiMassless", {
    Text = "Anti Massless",
    Default = false,
    Callback = function(Value)
        masslessT = Value
        
        if antiMasslessConnection then
            antiMasslessConnection:Disconnect()
            antiMasslessConnection = nil
        end
        
        if Value then
            local function monitorCharacter(character)
                if not masslessT then return end
                
                -- 파트 추가 감시
                local partAddedConnection = character.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("BasePart") and descendant.Massless then
                        descendant.Massless = false
                    end
                end)
                
                -- 주기적 감시
                antiMasslessConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if not masslessT then
                        antiMasslessConnection:Disconnect()
                        partAddedConnection:Disconnect()
                        return
                    end
                    
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") and part.Massless then
                            part.Massless = false
                        end
                    end
                end)
                
                -- 초기 실행
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Massless then
                        part.Massless = false
                    end
                end
            end
            
            -- 현재 캐릭터 적용
            local currentCharacter = game.Players.LocalPlayer.Character
            if currentCharacter then
                monitorCharacter(currentCharacter)
            end
            
            -- 리스폰 시 적용
            game.Players.LocalPlayer.CharacterAdded:Connect(monitorCharacter)
        end
    end
})

ToggleLeftGroupBox:AddToggle("AntiBlob", {
    Text = "Anti Blob",
    Default = false,
    Callback = function(Value)
        AntiBlobT = Value
        
        if Value then
            -- Anti-Blob 기능 활성화
            local function antiBlobF()
                while AntiBlobT do
                    task.wait(0.1) -- 너무 빠른 반복 방지
                    
                    pcall(function()
                        local character = LocalPlayer.Character
                        if not character then return end
                        
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if not hrp then return end
                        
                        -- RootAttachment 제거
                        local rootAttachment = hrp:FindFirstChild("RootAttachment")
                        if rootAttachment then
                            rootAttachment:Destroy()
                        end
                    end)
                end
            end
            
            -- Anti-Blob 기능 실행
            task.spawn(antiBlobF)
            Library:Notify("Anti-Blob activated!", 3)
            
            -- 재설정 후에도 적용
            LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.5) -- 캐릭터가 완전히 로드될 때까지 대기
                local hrp = char:WaitForChild("HumanoidRootPart", 5)
                if hrp then
                    local rootAttachment = hrp:FindFirstChild("RootAttachment")
                    if rootAttachment then
                        rootAttachment:Destroy()
                    end
                end
            end)
        else
            Library:Notify("Anti-Blob deactivated!", 3)
        end
    end
})




ToggleLeftGroupBox:AddToggle("AntiVoid", {
    Text = "Anti Void",
    Default = false,
    Callback = function(Value)
        if Value then
            Workspace.FallenPartsDestroyHeight = -50000
        else
            Workspace.FallenPartsDestroyHeight = -100
        end
    end
})
--[[
ToggleLeftGroupBox:AddToggle("AntiBurn", {
    Text = "Anti-Burn",
    Default = false,
    Callback = function(Value)
        AntiBurnT = Value
        antiBurnF()
    end
})--]]

ToggleLeftGroupBox:AddToggle("GodModeToggle", {
    Text = "Anti Paint",
    Default = false,
    Callback = function(Value)
        -- God Mode 기능 구현
        local player = game:GetService("Players").LocalPlayer
        local nega = Value
        
        local function applyToggleEffect()
            while task.wait(0.1) and Toggles.GodModeToggle.Value do
                local character = player.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        local parts = workspace:GetPartBoundsInRadius(humanoidRootPart.Position, 10)
                        for _, part in ipairs(parts) do
                            part.CanTouch = not nega
                        end
                    end
                end
            end
        end
        
        if Value then
            -- God Mode 켜짐
            Library:Notify("God Mode: ON", 3)
            applyToggleEffect()
            
            -- 캐릭터 변경 시에도 적용
            player.CharacterAdded:Connect(function()
                if Toggles.GodModeToggle.Value then
                    task.wait(1) -- 캐릭터 로딩 대기
                    applyToggleEffect()
                end
            end)
        else
            -- God Mode 꺼짐 - 모든 파트의 CanTouch 복원
            Library:Notify("God Mode: OFF", 3)
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanTouch = true
                end
            end
        end
    end
})


ToggleLeftGroupBox:AddToggle("AntiLag", {
    Text = "Anti Lag",
    Default = false,
    Callback = function(Value)
        antiLagT = Value
        if antiLagT then
            AntiLagF()
        else
            if _G.antiLagConnection then
                _G.antiLagConnection:Disconnect()
                _G.antiLagConnection = nil
            end
            LocalPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = true
        end
    end
})

ToggleLeftGroupBox:AddToggle("AutoGucci", {
    Text = "Anti Gucci",
    Default = false,
    Callback = function(Value)
        autoGucciT = Value
        if autoGucciT then
            spawnBlobmanF()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local OCF = hrp.CFrame
                if not sitJumpT then
                    sitJumpT = true
                    sitJumpF()
                end
                ragdollLoopF()
                task.wait(0.37)
                if hrp then
                    hrp.CFrame = OCF
                end
            end
        else
            sitJumpT = false
        end
    end
})

-- Anti-Gucci Toggle Keybind
local AutoGucciToggleKey = ToggleLeftGroupBox:AddToggle("AutoGucciToggleKey", {
    Text = "Anti-Gucci Toggle",
    Default = false,
    Callback = function(Value)
        autoGucciT = Value
        if autoGucciT then
            spawnBlobmanF()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local OCF = hrp.CFrame
                if not sitJumpT then
                    sitJumpT = true
                    sitJumpF()
                end
                ragdollLoopF()
                task.wait(0.37)
                if hrp then
                    hrp.CFrame = OCF
                end
            end
        else
            sitJumpT = false
        end
    end
})

local AutoGucciKeybind = AutoGucciToggleKey:AddKeyPicker("AutoGucciKeybind", {
    Default = "U",
    Text = "Anti-Gucci Toggle Keybind",
    Mode = "Toggle",
    SyncToggleState = true,
    Callback = function(Value)
        autoGucciT = Value
        if autoGucciT then
            spawnBlobmanF()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local OCF = hrp.CFrame
                if not sitJumpT then
                    sitJumpT = true
                    sitJumpF()
                end
                ragdollLoopF()
                task.wait(0.37)
                if hrp then
                    hrp.CFrame = OCF
                end
            end
        else
            sitJumpT = false
        end
    end
})

------------ UI Settings Tab ------------
local MenuGroup = Tabs.UISettings:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end
})

MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end
})

MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value) / 100
        Library:SetDPIScale(DPI)
    end
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { 
    Default = "T", 
    NoUI = true, 
    Text = "Menu keybind" 
})

MenuGroup:AddButton({
    Text = "Unload",
    Func = function()
        Library:Unload()
    end,
    DoubleClick = false,
})

------------ Event Handlers ------------
local function updatePlayerDropdowns()
    local players = getPlayerList()
    BlobDropdown:SetValues(players)
    TargetDropdown:SetValues(players)
    
    -- BlobDropdown: 단일 선택 검증
    if selectedTargets and not table.find(players, selectedTargets) then
        selectedTargets = nil
        BlobDropdown:SetValue(nil)
    end
    
    -- TargetDropdown: 단일 선택 검증
    if targetPlayer and not table.find(players, targetPlayer.Name) then
        targetPlayer = nil
        TargetDropdown:SetValue(nil)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        updatePlayerDropdowns()
        if showStudsToggle then
            updateStudsDisplay()
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player ~= LocalPlayer then
        updatePlayerDropdowns()
        if showStudsToggle then
            updateStudsDisplay()
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    CurrentCharacter = character
    if showStudsToggle then
        updateStudsDisplay()
    end
end)

task.spawn(function()
    while task.wait(10) do
        if not pallet or not pallet.Parent then
            local newPallet = setupPallet()
            if newPallet then
                pallet = newPallet
                if toggleActive then
                    toggleActive = false
                end
            end
            if Toggles.ToggleTargetToggle and Toggles.ToggleTargetToggle.Value then
                Toggles.ToggleTargetToggle:SetValue(false)
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if not pallet or not pallet.Parent then
        if toggleActive then
            toggleActive = false
        end
        return
    end
    
    if toggleActive and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = targetPlayer.Character.HumanoidRootPart
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(hrp, hrp.CFrame)
    else
        if pallet and pallet.Parent then
            setupAlign(pallet)
        end
        task.wait(0.2)
    end
end)

------------ Blob Tab - Silent Kick Section ------------
local BlobSilentKickGroupBox = Tabs.Blob:AddRightGroupbox("Silent Kick", "boxes")

-- 사일런트 킥 (선택된 대상)
BlobSilentKickGroupBox:AddButton({
    Text = "Silent Kick (Selected Target)",
    Func = function()
        if not selectedTargets then
            Library:Notify("No target selected!", 3)
            return
        end
        
        local blob = getBlobman()
        if not blob then
            Library:Notify("Blobman not found!", 3)
            return
        end
        
        local targetChar = findPlayerCharacter(selectedTargets)
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
            selectedTargets = nil
            BlobDropdown:SetValue(nil)
            Library:Notify("Target character not found!", 3)
            return
        end
        
        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
        local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = ReplicatedStorage.GrabEvents.DestroyGrabLine
        
        local localHrp = getCurrentCharacter().HumanoidRootPart
        if not localHrp then
            Library:Notify("Local player HRP not found!", 3)
            return
        end
        
        local originalPosition = localHrp.CFrame
        local target = targetChar.HumanoidRootPart
        
        -- 1. 로컬 플레이어가 상대에게 TP
        localHrp.CFrame = target.CFrame
        task.wait(0.15)
        
   
        set:FireServer(target, target.CFrame)
        -- 5. 상대를 로컬 플레이어 위 Y 3 위치로 이동
        target.CFrame = localHrp.CFrame * CFrame.new(0, 10, 0)
        task.wait(0.1) -- 기다리는 부분 추가
        
        -- 6. SetNetworkOwner와 DestroyGrabLine 호출
     
        del:FireServer(target)
        task.wait(0.1) -- 기다리는 부분 추가
        
        -- 7. 추가 Grab & Drop 실행 (사일런트 킥 효과)
        local detector = blob.LeftDetector
        local weld = blob.LeftDetector.LeftWeld
        
        -- 로컬 플레이어 HRP로 Grab
        grab:FireServer(detector, localHrp, weld)
        
        -- 대상으로 Grab
        grab:FireServer(detector, target, weld)
        
        -- Drop 실행 (올바른 형식으로)
        drop:FireServer(weld, target.RootAttachment)

        
        -- 4. 로컬 플레이어가 원래 자리로 이동
        localHrp.CFrame = originalPosition
        task.wait(0.1)
        
        Library:Notify("Silent kicked " .. selectedTargets, 3)
    end,
    DoubleClick = false,
})

-- 사일런트 킥 (모든 대상)
BlobSilentKickGroupBox:AddButton({
    Text = "Silent Kick All",
    Func = function()
        local blob = getBlobman()
        if not blob then
            Library:Notify("Blobman not found!", 3)
            return
        end

        local players = getPlayerList()
        if #players == 0 then
            Library:Notify("No players to kick!", 3)
            return
        end

        Library:Notify("Starting silent kick all...", 3)

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
        local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = ReplicatedStorage.GrabEvents.DestroyGrabLine

        local detector = blob.LeftDetector
        local weld = blob.LeftDetector.LeftWeld
        local localHrp = getCurrentCharacter().HumanoidRootPart

        -- Grab & Release (한 번씩 잡고 놓기)
        for _, playerName in ipairs(players) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                snapBlobTo(blob, targetHrp.CFrame)
                task.wait(0.15)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                release:FireServer(blob.RightDetector.RightWeld)
                task.wait(0)
            end
        end

        -- Blob 맵 중앙 이동
        snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
        task.wait(0.05)

        -- 대상들을 Blob 위로 올림
        for _, playerName in ipairs(players) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                local blobHrp = blob.HumanoidRootPart
                targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z)
            end
        end
        task.wait(0.1)

        -- SetNetworkOwner + DestroyGrabLine + GrabDrop
        for _, playerName in ipairs(players) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                set:FireServer(targetHrp, targetHrp.CFrame)
                del:FireServer(targetHrp)

                -- 🔹 추가 Grab & Drop 실행 (사일런트 킥 효과)
                grab:FireServer(detector, localHrp, weld)
                grab:FireServer(detector, targetHrp, weld)
                drop:FireServer(weld, targetHrp.RootAttachment)
            end
        end
        task.wait(3)
releaseBlobAlign(blob)
        Library:Notify("Silent kick all completed!", 3)
    end,
    DoubleClick = false,
})

-- 사일런트 킥 (모든 대상)
BlobSilentKickGroupBox:AddButton({
    Text = "test bomba",
    Func = function()
        local blob = getBlobman()
        if not blob then
            Library:Notify("Blobman not found!", 3)
            return
        end

        local players = getPlayerList()
        if #players == 0 then
            Library:Notify("No players to kick!", 3)
            return
        end

        Library:Notify("Starting silent kick all...", 3)

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
        local set = ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = ReplicatedStorage.GrabEvents.DestroyGrabLine

        local detector = blob.LeftDetector
        local weld = blob.LeftDetector.LeftWeld
        local localHrp = getCurrentCharacter().HumanoidRootPart

        -- 1단계: Grab & Release 모두에게 번갈아가면서 실행
        for _, playerName in ipairs(players) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                snapBlobTo(blob, targetHrp.CFrame)
                task.wait(0.15)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                release:FireServer(blob.RightDetector.RightWeld)
                task.wait(0.05)
            end
        end

        -- 2단계: Blob 맵 중앙 이동
        snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
        task.wait(0.1)

        -- 3단계: 원으로 돌아가면서 한명씩 처리 (플레이어 수에 따라 원 크기 조정)
        local center = Vector3.new(0, 100, 0)
        local baseRadius = 40
        local radius = baseRadius + (#players * 5) -- 플레이어 수에 따라 원 크기 증가 (5씩)
        local numPlayers = #players
        local angleIncrement = (2 * math.pi) / numPlayers
        
        for i, playerName in ipairs(players) do
            local angle = angleIncrement * (i - 1)
            local x = center.X + radius * math.cos(angle)
            local z = center.Z + radius * math.sin(angle)
            local blobPosition = Vector3.new(x, center.Y, z)
            
            -- Blob을 원형 위치로 이동
            snapBlobTo(blob, CFrame.new(blobPosition))
            task.wait(0.1)
            
            -- 해당 플레이어 처리
            local player = Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                local blobHrp = blob.HumanoidRootPart
                
                -- 한명씩 Blob 위로 올림
                targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z)
                task.wait(0.15)
                
                -- 소유권 변경
                set:FireServer(targetHrp, targetHrp.CFrame)
                del:FireServer(targetHrp)

                -- 🔹 추가 Grab & Drop 실행 (사일런트 킥 효과)
                grab:FireServer(detector, localHrp, weld)
                grab:FireServer(detector, targetHrp, weld)
                drop:FireServer(weld, targetHrp.RootAttachment)
            end
            
            task.wait(0)
        end
        
        task.wait(1)
        releaseBlobAlign(blob)
        Library:Notify("Silent kick all completed!", 3)
    end,
    DoubleClick = false,
})

------------ Blob Tab - Kick Aura Section ------------
local BlobKickAuraGroupBox = Tabs.Blob:AddRightGroupbox("Kick Aura", "boxes")

local kickAuraActive = false
local lastKickTimes = {} -- 플레이어별 마지막 처리 시간 기록

-- 로컬 플레이어 캐릭터 가져오기
local function getCurrentCharacter()
    local player = game.Players.LocalPlayer
    return player.Character or player.CharacterAdded:Wait()
end

-- 블롭 모델 가져오기
local function getBlobman()
    local localPlayer = game.Players.LocalPlayer
    local workspaceFolder = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
    if not workspaceFolder then return nil end

    local blob = workspaceFolder:FindFirstChild("CreatureBlobman")
    return blob
end

-- 반경 35 스터드 내 플레이어 감지 함수
local function getPlayersInRange(radius)
    local playersInRange = {}
    local localChar = getCurrentCharacter()
    
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then
        return playersInRange
    end
    
    local localPos = localChar.HumanoidRootPart.Position
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and (hrp.Position - localPos).Magnitude <= radius then
                table.insert(playersInRange, player)
            end
        end
    end
    
    return playersInRange
end

-- 사일런트 킥 함수 (Grab/Release → Y+20 → 소유권/라인 삭제 → Grab & Drop)
local function silentKickPlayer(player)
    if not player or not player.Character then return end
    
    local blob = getBlobman()
    if not blob then return end
    
    local targetChar = player.Character
    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end
    
    if not blob:FindFirstChild("BlobmanSeatAndOwnerScript") then return end
    local script = blob.BlobmanSeatAndOwnerScript

    -- Grab / Release / Drop 이벤트 정의
    local grab = script:FindFirstChild("CreatureGrab")
    local release = script:FindFirstChild("CreatureRelease")
    local drop = script:FindFirstChild("CreatureDrop")
    if not grab or not release or not drop then return end

    local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
    local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
    
    local detector = blob.LeftDetector
    local weld = blob.LeftDetector.LeftWeld
    local localHrp = getCurrentCharacter().HumanoidRootPart

    -- 1. Grab + Release

    set:FireServer(targetHrp, targetHrp.CFrame)
    set:FireServer(targetHrp, targetHrp.CFrame)
    task.wait(0.01)
    targetHrp.CFrame = targetHrp.CFrame + Vector3.new(0,25,0)
    
        task.wait(0.01)
    del:FireServer(targetHrp)

        task.wait()
    grab:FireServer(detector, localHrp, weld)
    grab:FireServer(detector, targetHrp, weld)
    drop:FireServer(weld, targetHrp.RootAttachment)
end


-- Kick Aura 토글
BlobKickAuraGroupBox:AddToggle("KickAuraToggle", {
    Text = "Kick Aura",
    Default = false,
    Tooltip = "Auto Y+10 + Grab & Drop + ownership for players within 35 studs",
    Callback = function(Value)
        kickAuraActive = Value
        lastKickTimes = {} -- 초기화
        
        if Value then
            Library:Notify("Kick Aura activated!", 3)
            
            task.spawn(function()
                while kickAuraActive do
                    local currentTime = tick()
                    local players = getPlayersInRange(25)
                    
                    -- 순차적으로 대상 처리
                    for _, player in ipairs(players) do
                        if not kickAuraActive then break end
                        local playerName = player.Name
                        
                        -- 이미 처리했더라도 3초 지나면 재처리
                        if not lastKickTimes[playerName] or (currentTime - lastKickTimes[playerName]) >= 5 then
                            lastKickTimes[playerName] = currentTime
                            
                            pcall(function()
                                silentKickPlayer(player)
                                Library:Notify("Kicked: " .. playerName, 2)
                            end)
                            
                            -- 다음 대상을 위해 짧게 대기
                            task.wait(0.25)
                        end
                    end
                    
                    task.wait(0.1)
                end
            end)
        else
            Library:Notify("Kick Aura deactivated!", 3)
        end
    end
})


local blobSpeed = 16 -- 기본 WalkSpeed

-- 슬라이더 추가 (0~100, 10 간격)
BlobKickAuraGroupBox:AddSlider("BlobSpeedSlider", {
    Text = "Blob Speed",
    Default = blobSpeed,
    Min = 0,
    Max = 100,
    Rounding = 10,
    Tooltip = "Adjust Blob humanoid speed",
    Callback = function(Value)
        blobSpeed = Value
        
        -- Blob 모델 가져오기
        local blob = getBlobman()
        if blob and blob:FindFirstChildOfClass("Humanoid") then
            local humanoid = blob:FindFirstChildOfClass("Humanoid")
            humanoid.WalkSpeed = blobSpeed
        end
    end
})

-- 토글: 자동 적용 (Blob이 생성될 때마다 속도 적용)
local autoApplySpeed = false
BlobKickAuraGroupBox:AddToggle("BlobSpeedToggle", {
    Text = "Auto Apply Speed",
    Default = false,
    Tooltip = "Automatically apply speed to Blob humanoid",
    Callback = function(Value)
        autoApplySpeed = Value
        
        if autoApplySpeed then
            task.spawn(function()
                while autoApplySpeed do
                    local blob = getBlobman()
                    if blob and blob:FindFirstChildOfClass("Humanoid") then
                        local humanoid = blob:FindFirstChildOfClass("Humanoid")
                        humanoid.WalkSpeed = blobSpeed
                    end
                    task.wait(0.5) -- 0.5초마다 적용
                end
            end)
        end
    end
})

------------ Targets Tab - Kill Section ------------
local TargetsKillGroupBox = Tabs.Targets:AddRightGroupbox("Kill Functions", "boxes")
local rs = ReplicatedStorage -- AutoAttackF에서 사용하던 rs 변수와 동일하게

-- Kill Target 드롭다운
local KillTargetDropdown = TargetsKillGroupBox:AddDropdown("KillTargetDropdown", {
    Values = getPlayerOptions(),
    Default = nil,
    Multi = false,
    Text = "Select Kill Target",
    Tooltip = "Select a player to kill",
    Callback = function(Value)
        if Value and Players:FindFirstChild(Value) then
            selectedKillTarget = Value
            Library:Notify("Selected kill target: " .. Value, 2)
        else
            selectedKillTarget = nil
            Library:Notify("No kill target selected", 2)
        end
    end
})

-- 내부 유틸: 대상의 "torso" 역할 파트 찾기
local function getTorsoPart(char)
    return char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
end

-- 실제 '죽이는' 시도 한 사이클 (AutoAttackF 스타일)
local function attemptKillCycleOn(torso)
    if not torso or not torso.Parent then return end

    -- 안전하게 pcall로 호출 (서버 이벤트가 없거나 에러나면 무시)
    pcall(function()
        if rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("SetNetworkOwner") then
            rs.GrabEvents.SetNetworkOwner:FireServer(torso, torso.CFrame)
        end
        if rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("DestroyGrabLine") then
            rs.GrabEvents.DestroyGrabLine:FireServer(torso, torso.CFrame)
        end
    end)

    task.wait(0.1)

    -- AutoAttackF 두번째 호출 패턴 그대로 반복
    pcall(function()
        if rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("SetNetworkOwner") then
            rs.GrabEvents.SetNetworkOwner:FireServer(torso, torso.CFrame)
        end
        if rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("DestroyGrabLine") then
            rs.GrabEvents.DestroyGrabLine:FireServer(torso, torso.CFrame)
        end
    end)

    task.wait(0.1)

    -- FallenPartsDestroyHeight 기반 Y 강제 하강 (AutoAttackF 로직과 동일)
    if torso and torso.Position then
        if torso.Position.Y > -80 then
            local FallenY = workspace.FallenPartsDestroyHeight
            if FallenY <= -50000 then
                torso.CFrame = CFrame.new(torso.Position.X, -49999, torso.Position.Z)
            elseif FallenY <= -100 then
                torso.CFrame = CFrame.new(torso.Position.X, -99, torso.Position.Z)
            end
        end
    end
end

-- Kill Target 버튼 (AutoAttackF 방식 준수)
TargetsKillGroupBox:AddButton({
    Text = "Kill Target",
    Func = function()
        if not selectedKillTarget then
            Library:Notify("No kill target selected!", 3)
            return
        end

        local targetChar = findPlayerCharacter(selectedKillTarget)
        if not targetChar then
            Library:Notify("Target not found!", 3)
            return
        end

        local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
        local targetTorso = getTorsoPart(targetChar)
        if not targetHumanoid or not targetTorso then
            Library:Notify("Target Humanoid or torso not found!", 3)
            return
        end

        local localChar = getCurrentCharacter()
        if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then
            Library:Notify("Your character not found!", 3)
            return
        end

        -- 원래 자리 저장
        local originalPosition = localChar.HumanoidRootPart.CFrame

        -- TP: 약간 띄워서 붙기
        pcall(function()
            localChar.HumanoidRootPart.CFrame = targetTorso.CFrame * CFrame.new(0, 3, 0)
        end)
        task.wait(0.08)

        -- 반복 시도: AutoAttackF 스타일의 한 사이클을 반복해서 체력이 0 될 때까지 시도
        local maxRetries = 200 -- 기본값: 200회 (0.1s * 200 = 20초)
        local tries = 0
        while targetHumanoid and targetHumanoid.Health > 0 and tries < maxRetries do
            attemptKillCycleOn(targetTorso)
            tries = tries + 1
            task.wait(0.1)
        end

        -- 원위치 복귀 (빠르게)
        task.wait(0.05)
        pcall(function()
            if localChar and localChar:FindFirstChild("HumanoidRootPart") then
                localChar.HumanoidRootPart.CFrame = originalPosition
            end
        end)

        if targetHumanoid and targetHumanoid.Health <= 0 then
            Library:Notify("Killed " .. selectedKillTarget, 3)
        else
            Library:Notify("Kill attempt finished (target may still be alive): " .. selectedKillTarget, 3)
        end
    end,
    DoubleClick = false,
})

-- Kill Loop: 같은 방식으로 반복 실행 (토글)
local killLoopActive = false
local killLoopConnection = nil

TargetsKillGroupBox:AddToggle("KillLoopToggle", {
    Text = "Kill Loop",
    Default = false,
    Tooltip = "Continuously attempt to kill the selected target",
    Callback = function(Value)
        killLoopActive = Value

        if Value then
            if not selectedKillTarget then
                Library:Notify("No kill target selected!", 3)
                Toggles.KillLoopToggle:SetValue(false)
                return
            end

            Library:Notify("Kill Loop started for " .. selectedKillTarget, 3)

            killLoopConnection = RunService.Heartbeat:Connect(function()
                if not killLoopActive or not selectedKillTarget then
                    if killLoopConnection then
                        killLoopConnection:Disconnect()
                        killLoopConnection = nil
                    end
                    return
                end

                local targetChar = findPlayerCharacter(selectedKillTarget)
                if not targetChar then
                    Library:Notify("Target character not found, stopping loop", 3)
                    Toggles.KillLoopToggle:SetValue(false)
                    return
                end

                local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
                local targetTorso = getTorsoPart(targetChar)
                if not targetHumanoid or not targetTorso then
                    task.wait(1)
                    return
                end

                if targetHumanoid.Health <= 0 then
                    task.wait(1)
                    return
                end

                local localChar = getCurrentCharacter()
                if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then
                    return
                end

                -- 저장해둔 위치로 돌아왔다가 다시 TP 해서 시도하는 방식
                local originalPosition = localChar.HumanoidRootPart.CFrame
                pcall(function()
                    localChar.HumanoidRootPart.CFrame = targetTorso.CFrame * CFrame.new(0, 3, 0)
                end)
                task.wait(0.08)

                -- 한 사이클 실행 (AutoAttackF 스타일)
                attemptKillCycleOn(targetTorso)

                -- 체력이 아직 남아있으면 계속 시도 (여기선 한 번만 실행하고 다음 Heartbeat에 다시 들어옴)
                -- 원하면 여기서 while loop로 체력 0 될 때까지 블로킹 반복하게 바꿔줄 수 있음.

                task.wait(0.05)
                pcall(function()
                    if localChar and localChar:FindFirstChild("HumanoidRootPart") then
                        localChar.HumanoidRootPart.CFrame = originalPosition
                    end
                end)

                task.wait(0.5) -- 다음 사이클까지 대기
            end)
        else
            if killLoopConnection then
                killLoopConnection:Disconnect()
                killLoopConnection = nil
            end
            Library:Notify("Kill Loop stopped", 3)
        end
    end
})

-- 플레이어 목록 업데이트 함수 (KillTargetDropdown도 포함)
local function updateAllDropdowns()
    local players = getPlayerList()
    BlobDropdown:SetValues(players)
    TargetDropdown:SetValues(players)
    KillTargetDropdown:SetValues(players)

    if selectedKillTarget and not table.find(players, selectedKillTarget) then
        selectedKillTarget = nil
        KillTargetDropdown:SetValue(nil)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        updateAllDropdowns()
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player ~= LocalPlayer then
        updateAllDropdowns()
    end
end)

------------ Targets Tab - Grab Target Keybind (매 Heartbeat 반복 호출) ------------
local targetTorso = nil
local torsoOwnershipEnabled = false
local heartbeatConnection = nil

local GrabTargetToggle = TargetsLeftGroupBox:AddToggle("GrabTargetToggle", {
    Text = "Grab Target (G)",
    Default = false,
    Tooltip = "Press G to maintain network ownership and fix position of player's torso",
    Callback = function(Value)
        torsoOwnershipEnabled = Value
        if not Value and targetTorso then
            targetTorso = nil
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
            Library:Notify("Torso ownership stopped", 3)
        end
    end
})

local GrabTargetKeybind = GrabTargetToggle:AddKeyPicker("GrabTargetKeybind", {
    Default = "G",
    Text = "Grab Target Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        if Value then
            local mouse = LocalPlayer:GetMouse()
            local target = mouse.Target
            if not target then
                Library:Notify("No target under mouse!", 3)
                return
            end

            local char = target:FindFirstAncestorOfClass("Model")
            if not char or not Players:FindFirstChild(char.Name) then
                Library:Notify("No valid player character found!", 3)
                return
            end

            local player = Players[char.Name]
            if player == LocalPlayer then
                Library:Notify("Cannot target yourself!", 3)
                return
            end

            targetTorso = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not targetTorso then
                Library:Notify("Target torso not found!", 3)
                return
            end

            torsoOwnershipEnabled = true
            TargetDropdown:SetValue(player.Name)
            Library:Notify("Controlling torso of " .. player.Name, 3)

            local bodyConstraints = {}
            local fixedPositions = {}
            for _, part in ipairs(targetTorso.Parent:GetDescendants()) do
                if part:IsA("BasePart") then
                    fixedPositions[part] = part.Position
                end
            end

            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            heartbeatConnection = RunService.Heartbeat:Connect(function()
                if not torsoOwnershipEnabled or not targetTorso or not targetTorso.Parent then
                    if heartbeatConnection then
                        heartbeatConnection:Disconnect()
                        heartbeatConnection = nil
                    end
                    for part, constraints in pairs(bodyConstraints) do
                        if constraints.BodyPosition then constraints.BodyPosition:Destroy() end
                        if constraints.BodyGyro then constraints.BodyGyro:Destroy() end
                    end
                    bodyConstraints = {}
                    return
                end

                local hasOwnership = isnetworkowner(targetTorso)
                local character = targetTorso.Parent

                -- BodyPosition / BodyGyro 적용 (isnetworkowner true일 때만)
                if hasOwnership then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            if not bodyConstraints[part] then bodyConstraints[part] = {} end

                            if not bodyConstraints[part].BodyPosition then
                                local bp = Instance.new("BodyPosition")
                                bp.MaxForce = Vector3.new(1e6,1e6,1e6)
                                bp.Position = fixedPositions[part] or part.Position
                                bp.P = 1e5
                                bp.D = 1e3
                                bp.Parent = part
                                bodyConstraints[part].BodyPosition = bp
                            else
                                bodyConstraints[part].BodyPosition.Position = fixedPositions[part] or part.Position
                            end

                            if not bodyConstraints[part].BodyGyro then
                                local bg = Instance.new("BodyGyro")
                                bg.MaxTorque = Vector3.new(1e6,1e6,1e6)
                                bg.CFrame = part.CFrame
                                bg.P = 1e5
                                bg.D = 1e3
                                bg.Parent = part
                                bodyConstraints[part].BodyGyro = bg
                            else
                                bodyConstraints[part].BodyGyro.CFrame = part.CFrame
                            end
                        end
                    end
                else
                    for part, constraints in pairs(bodyConstraints) do
                        if constraints.BodyPosition then constraints.BodyPosition:Destroy() end
                        if constraints.BodyGyro then constraints.BodyGyro:Destroy() end
                    end
                    bodyConstraints = {}
                end

                -- RemoteEvent 호출: 매 Heartbeat 반복, 상태 변화 체크 없음
                ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(targetTorso, targetTorso.CFrame)
                ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(targetTorso)
            end)
        end
    end
})

-- G 키 다시 눌러서 중지
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G and torsoOwnershipEnabled then
        torsoOwnershipEnabled = false
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end

        if targetTorso and targetTorso.Parent then
            local character = targetTorso.Parent
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    for _, obj in ipairs(part:GetChildren()) do
                        if obj:IsA("BodyPosition") or obj:IsA("BodyGyro") then
                            obj:Destroy()
                        end
                    end
                end
            end
        end

        targetTorso = nil
        Toggles.GrabTargetToggle:SetValue(false)
        Library:Notify("Torso control stopped", 3)
    end
end)




------------ Global Variables ------------
local AntiStruggleGrabT = false
local MassLessGrab = false
local heartbeatConnection = nil
local Cons = {}
local bodyPositionInstances = {} -- BodyPosition 추적용 테이블
local clonedEndGrabEarly = nil   -- EndGrabEarly 클론 저장용

------------ Services ------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")

------------ Utility Functions ------------
function Disc(key)
    if Cons[key] then
        Cons[key]:Disconnect()
        Cons[key] = nil
    end
end

function CleanupBodyPositions()
    for part, bodyPos in pairs(bodyPositionInstances) do
        if bodyPos and bodyPos.Parent then
            bodyPos:Destroy()
        end
    end
    bodyPositionInstances = {}
end

function ApplyBodyPosition(part, targetPosition)
    if not part or not part:IsA("BasePart") then return end

    local bodyPos = bodyPositionInstances[part]
    if not bodyPos or not bodyPos.Parent then
        bodyPos = Instance.new("BodyPosition")
        bodyPos.Name = "AntiStruggleBodyPos"
        bodyPos.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bodyPos.P = 1e5
        bodyPos.D = 1e4
        bodyPos.Parent = part
        bodyPositionInstances[part] = bodyPos
    end

    bodyPos.Position = targetPosition
    part.AssemblyLinearVelocity = Vector3.zero
    part.AssemblyAngularVelocity = Vector3.zero

    local bv = part:FindFirstChild("BodyVelocity")
    if bv then bv:Destroy() end
end

------------ EndGrabEarly Clone 방식 ------------
function HandleEndGrabEarly(block)
    local grabEvents = ReplicatedStorage:FindFirstChild("GrabEvents")
    if not grabEvents then return end

    local endGrabEarlyEvent = grabEvents:FindFirstChild("EndGrabEarly")

    if block then
        if endGrabEarlyEvent and not clonedEndGrabEarly then
            clonedEndGrabEarly = endGrabEarlyEvent:Clone()
            clonedEndGrabEarly.Parent = grabEvents
            endGrabEarlyEvent:Destroy()
        end
    else
        if clonedEndGrabEarly and not grabEvents:FindFirstChild("EndGrabEarly") then
            local restored = clonedEndGrabEarly:Clone()
            restored.Parent = grabEvents
        end
    end
end

------------ Anti-Struggle Grab Heartbeat Loop (GrabPart.Part1 기준) ------------
function AntiStruggleGrabHeartbeat()
    if heartbeatConnection then return end

    heartbeatConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if not AntiStruggleGrabT then
            CleanupBodyPositions()
            HandleEndGrabEarly(false)
            return
        end

        local grabParts = workspace:FindFirstChild("GrabParts")
        if not grabParts then 
            CleanupBodyPositions()
            HandleEndGrabEarly(false)
            return 
        end
        
        local gp = grabParts:FindFirstChild("GrabPart")
        if not gp then 
            CleanupBodyPositions()
            HandleEndGrabEarly(false)
            return 
        end
        
        local weld = gp:FindFirstChildWhichIsA("WeldConstraint")
        if not weld then 
            CleanupBodyPositions()
            HandleEndGrabEarly(false)
            return 
        end
        
        local part1 = weld.Part1
        if not part1 then 
            CleanupBodyPositions()
            HandleEndGrabEarly(false)
            return 
        end

        -- BodyPosition/Humanoid 제어는 네트워크 오너일 때만
        if isnetworkowner(part1) then
            HandleEndGrabEarly(true) -- 이벤트 차단

            local ownerPlayer
            for _, pl in ipairs(Players:GetPlayers()) do
                if pl.Character and part1:IsDescendantOf(pl.Character) then
                    ownerPlayer = pl
                    break
                end
            end

            if ownerPlayer then
                local char = ownerPlayer.Character
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        ApplyBodyPosition(part, part.Position)
                    end
                end

                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.PlatformStand = true
                    hum:ChangeState(Enum.HumanoidStateType.Physics)
                end
            else
                if part1.Parent then
                    for _, part in ipairs(part1.Parent:GetDescendants()) do
                        if part:IsA("BasePart") then
                            ApplyBodyPosition(part, part.Position)
                        end
                    end
                end
            end
        else
            -- 네트워크 오너가 아니면 cleanup만
            CleanupBodyPositions()
            HandleEndGrabEarly(false)
        end

        -- RemoteEvent는 매 프레임 호출 (isnetworkowner와 무관)
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(part1, part1.CFrame)
        ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(part1)
    end)
end

------------ MassLess Grab ChildAdded ------------
function MassLessGrabSetup()
    Disc("MLChild")
    if not MassLessGrab then return end
    
    Cons["MLChild"] = workspace.ChildAdded:Connect(function(part)
        if part.Name ~= "GrabParts" then return end
        if not part:FindFirstChild("GrabPart") then return end
        
        local GP = part.GrabPart
        local weld = GP and GP:FindFirstChildWhichIsA("WeldConstraint")
        if not weld then return end
        
        local DP = part:FindFirstChild("DragPart")
        if not DP then return end
        
        local alignOrientation = DP:FindFirstChild("AlignOrientation")
        if alignOrientation then
            alignOrientation.MaxTorque = math.huge
            alignOrientation.Responsiveness = 200
        end
        
        local alignPosition = DP:FindFirstChild("AlignPosition")
        if alignPosition then
            alignPosition.MaxForce = math.huge
            alignPosition.Responsiveness = 200
        end
    end)
end

------------ Toggle Tabs ------------
ToggleLeftGroupBox:AddToggle("AntiStruggleGrab", {
    Text = "bypass A kick grab",
    Default = false,
    Callback = function(Value)
        AntiStruggleGrabT = Value
        if Value then
            AntiStruggleGrabHeartbeat()
        else
            HandleEndGrabEarly(false)
            CleanupBodyPositions()
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
        end
    end
})

ToggleLeftGroupBox:AddToggle("MassLessGrab", {
    Text = "MassLess Grab",
    Default = false,
    Callback = function(Value)
        MassLessGrab = Value
        MassLessGrabSetup()
    end
})


------------ Black Hole ESP Variables ------------
local blackHoleESPEnabled = false
local blackHoleSelectionBoxes = {}
local blackHoleBeams = {}

------------ Black Hole ESP Functions ------------
local function createBlackHoleESP(blackHole)
    if not blackHole or blackHoleSelectionBoxes[blackHole] then return end
    
    -- SelectionBox로 블랙홀 전체 윤곽선 표시
    local selectionBox = Instance.new("SelectionBox")
    selectionBox.Adornee = blackHole
    selectionBox.LineThickness = 0.05
    selectionBox.Color3 = Color3.fromRGB(255, 0, 0)
    selectionBox.Parent = blackHole
    blackHoleSelectionBoxes[blackHole] = selectionBox
    
    -- Hole 파트 찾기
    local holePart = blackHole:FindFirstChild("Hole")
    if holePart and holePart:IsA("BasePart") then
        -- BillboardGui 설정 변경
        local billboardGui = holePart:FindFirstChildOfClass("BillboardGui")
        if billboardGui then
            billboardGui.AlwaysOnTop = true
        end
        
        -- 로컬 플레이어와 연결하는 Beam 생성
        local localChar = LocalPlayer.Character
        if localChar and localChar:FindFirstChild("HumanoidRootPart") then
            local localHrp = localChar.HumanoidRootPart
            
            local holeAttachment = Instance.new("Attachment")
            holeAttachment.Parent = holePart
            
            local localAttachment = Instance.new("Attachment")
            localAttachment.Parent = localHrp
            
            local beam = Instance.new("Beam")
            beam.Attachment0 = localAttachment
            beam.Attachment1 = holeAttachment
            beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
            beam.Width0 = 0.1
            beam.Width1 = 0.1
            beam.Parent = holePart
            
            blackHoleBeams[blackHole] = {
                beam = beam,
                holeAttachment = holeAttachment,
                localAttachment = localAttachment
            }
        end
    end
end

local function removeBlackHoleESP(blackHole)
    if blackHoleSelectionBoxes[blackHole] then
        blackHoleSelectionBoxes[blackHole]:Destroy()
        blackHoleSelectionBoxes[blackHole] = nil
    end
    
    if blackHoleBeams[blackHole] then
        if blackHoleBeams[blackHole].beam then blackHoleBeams[blackHole].beam:Destroy() end
        if blackHoleBeams[blackHole].holeAttachment then blackHoleBeams[blackHole].holeAttachment:Destroy() end
        if blackHoleBeams[blackHole].localAttachment then blackHoleBeams[blackHole].localAttachment:Destroy() end
        blackHoleBeams[blackHole] = nil
    end
end

local function enableBlackHoleESP()
    blackHoleESPEnabled = true
    
    -- 기존 블랙홀에 ESP 생성
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj.Name == "BlackHoleKick" then
            createBlackHoleESP(obj)
        end
    end
    
    -- 새로운 블랙홀 감지
    Workspace.ChildAdded:Connect(function(child)
        if blackHoleESPEnabled and child.Name == "BlackHoleKick" then
            createBlackHoleESP(child)
        end
    end)
end

local function disableBlackHoleESP()
    blackHoleESPEnabled = false
    
    -- 모든 ESP 제거
    for blackHole in pairs(blackHoleSelectionBoxes) do
        removeBlackHoleESP(blackHole)
    end
end

------------ Visuals Tab에 Black Hole ESP 토글 추가 ------------
local VisualsRightGroupBox = Tabs.Visuals:AddRightGroupbox("Black Hole ESP", "boxes")

VisualsRightGroupBox:AddToggle("BlackHoleESP", {
    Text = "Black Hole ESP",
    Default = false,
    Callback = function(Value)
        if Value then
            enableBlackHoleESP()
            Library:Notify("Black Hole ESP Enabled", 3)
        else
            disableBlackHoleESP()
            Library:Notify("Black Hole ESP Disabled", 3)
        end
    end
})

------------ Initialize ------------
Library.ToggleKeybind = Options.MenuKeybind

-- 메뉴 키바인드 리스너 추가
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode[Options.MenuKeybind.Value] then
        Library:ToggleUI()
    end
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place")
SaveManager:BuildConfigSection(Tabs.UISettings)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:LoadAutoloadConfig()

Library:OnUnload(function()
    print("Unloaded!")
end)

Library:Notify("Dungi? Loaded! Script by nether", 5)

