local vu1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/Orion%20X"))()
local vu2 = "SoonElysiumV2"
local function vu721()
    owners = {
        "Mr_Voidz13",
        "range_0xE4",
        "ex0lir",
        "Blizz_T",
        "bouzz52",
        "pato_soud1"
    }
    frozenPlayers = {}
    loopKillPlayers = {}
    function sayString(p3)
        if game:GetService("TextChatService").ChatVersion ~= Enum.ChatVersion.TextChatService then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(p3, "All")
        else
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(p3)
        end
    end
    function FindPlayerByName(p4)
        local v5 = string.lower(p4)
        local v6, v7, v8 = game.Players:GetPlayers()
        while true do
            local v9
            v8, v9 = v6(v7, v8)
            if v8 == nil then
                break
            end
            if string.find(string.lower(v9.DisplayName), v5) or string.find(string.lower(v9.Name), v5) then
                return v9
            end
        end
        return nil
    end
    function killPlayer(p10)
        local v11 = FindPlayerByName(p10)
        if v11 and v11.Character and v11.Character:FindFirstChild("Humanoid") then
            v11.Character.Humanoid.Health = 0
        end
    end
    function loopKillPlayer(p12)
        local v13 = FindPlayerByName(p12)
        if v13 and not loopKillPlayers[v13.Name] then
            loopKillPlayers[v13.Name] = true
            while loopKillPlayers[v13.Name] do
                killPlayer(v13.Name)
                wait(1)
            end
        end
    end
    function unloopKillPlayer(p14)
        local v15 = FindPlayerByName(p14)
        if v15 then
            loopKillPlayers[v15.Name] = nil
        end
    end
    function bringPlayer(p16, p17)
        local v18 = FindPlayerByName(p16)
        local v19 = FindPlayerByName(p17)
        if v18 and (v19 and (v18.Character and v19.Character)) then
            v18.Character:SetPrimaryPartCFrame(v19.Character:GetPrimaryPartCFrame())
        end
    end
    function freezePlayer(p20)
        local v21 = FindPlayerByName(p20)
        if v21 and v21.Character and v21.Character:FindFirstChild("HumanoidRootPart") then
            frozenPlayers[v21.Name] = true
            v21.Character.HumanoidRootPart.Anchored = true
        end
    end
    function unfreezePlayer(p22)
        local v23 = FindPlayerByName(p22)
        if v23 and v23.Character and v23.Character:FindFirstChild("HumanoidRootPart") then
            frozenPlayers[v23.Name] = nil
            v23.Character.HumanoidRootPart.Anchored = false
        end
    end
    function processCommand(p24, p25)
        local v26 = p25:split(" ")
        local v27 = v26[1]
        local v28 = v26[2]
        if v27 == ";kill" and v28 then
            killPlayer(v28)
        elseif v27 == ";reveal" and v28 then
            sayString("/w " .. p24.Name .. " I\'m ")
        elseif v27 == ";reveal" and v28 == "all" then
            local v29, v30, v31 = pairs(game.Players:GetPlayers())
            while true do
                local v32
                v31, v32 = v29(v30, v31)
                if v31 == nil then
                    break
                end
                sayString("/w " .. p24.Name .. " I\'m")
            end
        elseif v27 == ";bring" and v28 then
            bringPlayer(v28, p24.Name)
        elseif v27 == ";freeze" and v28 then
            freezePlayer(v28)
        elseif v27 == ";unfreeze" and v28 then
            unfreezePlayer(v28)
        elseif v27 == ";loopkill" and v28 then
            loopKillPlayer(v28)
        elseif v27 == ";unloopkill" and v28 then
            unloopKillPlayer(v28)
        end
    end
    function setupChatListener(pu33)
        if table.find(owners, pu33.Name) then
            pu33.Chatted:Connect(function(p34)
                processCommand(pu33, p34)
            end)
        end
    end
    local v35, v36, v37 = pairs(game.Players:GetPlayers())
    while true do
        local v38
        v37, v38 = v35(v36, v37)
        if v37 == nil then
            break
        end
        setupChatListener(v38)
    end
    game.Players.PlayerAdded:Connect(setupChatListener)
    if game.PlaceId == 6961824067 then
        local vu39 = game:GetService("RunService")
        local vu40 = game:GetService("ReplicatedStorage")
        local v41 = vu40:WaitForChild("GrabEvents")
        local vu42 = game:GetService("Debris")
        local vu43 = v41:WaitForChild("CreateGrabLine")
        local vu44 = v41:WaitForChild("DestroyGrabLine")
        local vu45 = game:GetService("Players")
        local vu46 = vu45.LocalPlayer
        local vu47 = workspace:FindFirstChild(vu46.Name .. "SpawnedInToys")
        local v48 = vu40:WaitForChild("CharacterEvents")
        local vu49 = v48:WaitForChild("RagdollRemote")
        local vu50 = vu40:WaitForChild("MenuToys")
        local vu51 = v41:WaitForChild("SetNetworkOwner")
        local vu52 = v48:WaitForChild("Struggle")
        local vu53 = game:GetService("UserInputService")
        local v54 = game:GetService("Workspace")
        vu46:GetMouse()
        local vu55 = vu50:WaitForChild("DestroyToy")
        game:GetService("ContextActionService")
        local vu56 = vu46.Character or vu46.CharacterAdded:Wait()
        vu46.CharacterAdded:Connect(function(p57)
            vu56 = p57
        end)
        local vu58 = workspace.FallenPartsDestroyHeight
        local function vu60(p59)
            return p59:FindFirstChild("HumanoidRootPart") or (p59:FindFirstChild("Torso") or p59:FindFirstChild("UpperTorso"))
        end
        local v61 = vu1:MakeWindow({
            Name = "Elysium Hub [FTAP]",
            HidePremium = false,
            SaveConfig = true,
            ConfigFolder = "ElysiumHub",
            IntroText = "Loading..."
        })
        local v62 = v61:MakeTab({
            Name = "Character",
            Icon = "rbxassetid://7743876054",
            PremiumOnly = false
        })
        local v63 = v61:MakeTab({
            Name = "Grab",
            Icon = "rbxassetid://7733954884",
            PremiumOnly = false
        })
        local v64 = v61:MakeTab({
            Name = "Aura Grab",
            Icon = "rbxassetid://7734056608",
            PremiumOnly = false
        })
        local v65 = v61:MakeTab({
            Name = "Blobman",
            Icon = "rbxassetid://7743872758",
            PremiumOnly = false
        })
        local v66 = v61:MakeTab({
            Name = "Target",
            Icon = "rbxassetid://7734058599",
            PremiumOnly = false
        })
        local v67 = v61:MakeTab({
            Name = "KeyBinds",
            Icon = "rbxassetid://11710306232",
            PremiumOnly = false
        })
        local v68 = v61:MakeTab({
            Name = "Auto",
            Icon = "rbxassetid://7743866529",
            PremiumOnly = false
        })
        local v69 = v61:MakeTab({
            Name = "Explosions",
            Icon = "rbxassetid://17837704089",
            PremiumOnly = false
        })
        local v70 = v61:MakeTab({
            Name = "Custom Track",
            Icon = "rbxassetid://72262733623074",
            PremiumOnly = false
        })
        local v71 = v61:MakeTab({
            Name = "Teleport - TP",
            Icon = "rbxassetid://7733992829",
            PremiumOnly = false
        })
        local v72 = v61:MakeTab({
            Name = "Mics",
            Icon = "rbxassetid://7733917120",
            PremiumOnly = false
        })
        local vu73 = {}
        local vu74 = nil
        local vu75 = nil
        local function vu77(p76)
            if string.match(p76, "%b()") then
                local _ = string.sub
            end
            return p76
        end
        local function v84()
            vu73 = {}
            local v78 = vu45
            local v79, v80, v81 = ipairs(v78:GetPlayers())
            while true do
                local v82
                v81, v82 = v79(v80, v81)
                if v81 == nil then
                    break
                end
                local v83 = v82.DisplayName
                if v82.Name == v83 then
                    table.insert(vu73, v82.Name)
                else
                    table.insert(vu73, "(" .. v82.Name .. ") " .. v83)
                end
            end
            if dropdownLeft then
                dropdownLeft:Refresh(vu73, true)
            end
            if vu74 then
                vu74:Refresh(vu73, true)
            end
            if vu75 then
                vu75:Refresh(vu73, true)
            end
        end
        vu45.PlayerAdded:Connect(v84)
        vu45.PlayerRemoving:Connect(v84)
        v84()
        local vu85 = nil
        v62:AddToggle({
            Name = "Anti Grab",
            Default = false,
            Save = true,
            Flag = "Anti Grab",
            Callback = function(p86)
                if p86 then
                    vu85 = vu39.Heartbeat:Connect(function()
                        local v87 = vu46.Character
                        if v87 and v87:FindFirstChild("Head") and v87.Head:FindFirstChild("PartOwner") then
                            vu52:FireServer()
                            vu49:FireServer(v87.HumanoidRootPart, 0)
                            vu40.GameCorrectionEvents.StopAllVelocity:FireServer()
                            local v88, v89, v90 = pairs(v87:GetChildren())
                            while true do
                                local v91
                                v90, v91 = v88(v89, v90)
                                if v90 == nil then
                                    break
                                end
                                if v91:IsA("BasePart") then
                                    v91.Anchored = true
                                end
                            end
                            while vu46.IsHeld.Value do
                                wait()
                            end
                            local v92, v93, v94 = pairs(v87:GetChildren())
                            while true do
                                local v95
                                v94, v95 = v92(v93, v94)
                                if v94 == nil then
                                    break
                                end
                                if v95:IsA("BasePart") then
                                    v95.Anchored = false
                                end
                            end
                        end
                    end)
                elseif vu85 then
                    vu85:Disconnect()
                    vu85 = nil
                end
            end
        })
        local vu96 = nil
        local vu97 = nil
        local function vu110(pu98)
            local vu99 = pu98:WaitForChild("Humanoid"):FindFirstChild("Ragdolled")
            if vu99 then
                vu96 = vu99:GetPropertyChangedSignal("Value"):Connect(function()
                    if vu99.Value then
                        local v100 = pu98
                        local v101, v102, v103 = ipairs(v100:GetChildren())
                        while true do
                            local v104
                            v103, v104 = v101(v102, v103)
                            if v103 == nil then
                                break
                            end
                            if v104:IsA("BasePart") then
                                v104.Anchored = true
                            end
                        end
                    else
                        local v105 = pu98
                        local v106, v107, v108 = ipairs(v105:GetChildren())
                        while true do
                            local v109
                            v108, v109 = v106(v107, v108)
                            if v108 == nil then
                                break
                            end
                            if v109:IsA("BasePart") then
                                v109.Anchored = false
                            end
                        end
                    end
                end)
            end
        end
        v62:AddToggle({
            Name = "Anti Explosion",
            Default = false,
            Save = true,
            Callback = function(p111)
                local v112 = game.Players.LocalPlayer
                if p111 then
                    if v112.Character then
                        vu110(v112.Character)
                    end
                    vu97 = v112.CharacterAdded:Connect(function(p113)
                        if vu96 then
                            vu96:Disconnect()
                        end
                        vu110(p113)
                    end)
                else
                    if vu96 then
                        vu96:Disconnect()
                        vu96 = nil
                    end
                    if vu97 then
                        vu97:Disconnect()
                        vu97 = nil
                    end
                end
            end
        })
        v62:AddToggle({
            Name = "Anti Bring/Blob",
            Default = false,
            Save = true,
            Callback = function(p114)
                local vu115 = game.Players.LocalPlayer.Name .. "SpawnedInToys"
                if p114 == true then
                    local v116, v117, v118 = pairs(workspace:GetDescendants())
                    while true do
                        local v119
                        v118, v119 = v116(v117, v118)
                        if v118 == nil then
                            break
                        end
                        if v119.Name ~= "LeftWeld" then
                            if v119.Name ~= "LeftAlignOrientation" then
                                if v119.Name ~= "RightWeld" then
                                    if v119.Name == "RightAlignOrientation" and v119.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                        v119.Enabled = false
                                    end
                                elseif v119.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                    v119.Enabled = false
                                end
                            elseif v119.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                v119.Enabled = false
                            end
                        elseif v119.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                            v119.Enabled = false
                        end
                    end
                    workspace.DescendantAdded:Connect(function(p120)
                        if p120.Name ~= "LeftWeld" then
                            if p120.Name ~= "LeftAlignOrientation" then
                                if p120.Name ~= "RightWeld" then
                                    if p120.Name == "RightAlignOrientation" and p120.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                        p120.Enabled = false
                                    end
                                elseif p120.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                    p120.Enabled = false
                                end
                            elseif p120.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                p120.Enabled = false
                            end
                        elseif p120.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                            p120.Enabled = false
                        end
                    end)
                end
                if p114 == false then
                    local v121, v122, v123 = pairs(workspace:GetDescendants())
                    while true do
                        local v124
                        v123, v124 = v121(v122, v123)
                        if v123 == nil then
                            break
                        end
                        if v124.Name ~= "LeftWeld" then
                            if v124.Name ~= "LeftAlignOrientation" then
                                if v124.Name ~= "RightWeld" then
                                    if v124.Name == "RightAlignOrientation" and v124.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                        v124.Enabled = true
                                    end
                                elseif v124.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                    v124.Enabled = true
                                end
                            elseif v124.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                                v124.Enabled = true
                            end
                        elseif v124.Parent.Parent.Parent ~= workspace:FindFirstChild(vu115) then
                            v124.Enabled = true
                        end
                    end
                end
            end
        })
        v62:AddToggle({
            Name = "Anti Lag",
            Default = false,
            Save = true,
            Callback = function(p125)
                local _ = game.Players.LocalPlayer.Name
                if p125 == true then
                    game.Players.LocalPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = false
                elseif p125 == false then
                    game.Players.LocalPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = true
                end
            end
        })
        local function vu127(p126)
            if vu46.Character and vu46.Character:FindFirstChild("HumanoidRootPart") then
                vu50.SpawnToyRemoteFunction:InvokeServer(p126, vu46.Character.HumanoidRootPart.CFrame, Vector3.new(0, 0, 0))
            end
        end
        local function vu135()
            vu127("FireExtinguisher")
            local v128 = vu47:WaitForChild("FireExtinguisher")
            local v129, v130, v131 = pairs(v128:GetChildren())
            local v132 = nil
            while true do
                local v133
                v131, v133 = v129(v130, v131)
                if v131 == nil then
                    v133 = v132
                    break
                end
                if v133.Name == "ExtinguishPart" then
                    v133.Size = Vector3.new(10, 10, 10)
                    break
                end
            end
            if v128:FindFirstChild("Main") then
                local v134 = Instance.new("BodyPosition")
                v134.P = 20000
                v134.Parent = v128.Main
            end
            return v133
        end
        local function vu137()
            while AntiBurn do
                if vu47 and vu47:FindFirstChild("FireExtinguisher") then
                    task.wait(0.5)
                elseif vu47 and not vu47:FindFirstChild("FireExtinguisher") then
                    local v136 = vu135()
                    while AntiBurn and (vu47:FindFirstChild("FireExtinguisher") and vu46.Character and vu46.Character:FindFirstChild("Head")) do
                        if v136 then
                            v136.Position = vu46.Character.Head.Position
                        end
                        task.wait(0.1)
                    end
                end
                task.wait(0.1)
            end
        end
        getgenv().AntiBurn = false
        v62:AddToggle({
            Name = "Anti Burn",
            Default = false,
            Save = true,
            Callback = function(p138)
                AntiBurn = p138
                if AntiBurn then
                    task.spawn(vu137)
                end
            end
        })
        local vu139 = nil
        v62:AddToggle({
            Name = "Anti Void",
            Default = false,
            Save = true,
            Callback = function(p140)
                if p140 then
                    vu139 = vu39.Stepped:Connect(function()
                        local v141 = vu60(vu46.Character)
                        if v141 and v141.Position.Y <= vu58 + 25 then
                            v141.Velocity = Vector3.new(v141.Velocity.X, 250, v141.Velocity.Z)
                        end
                    end)
                elseif vu139 then
                    vu139:Disconnect()
                    vu139 = nil
                end
            end
        })
        getgenv().AntiKick = false
        v62:AddToggle({
            Name = "Anti Kick",
            Default = false,
            Callback = function(p142)
                AntiKick = p142
                while AntiKick do
                    if vu47 and (vu47:FindFirstChild("NinjaKunai") and vu46.Character) then
                        local v143 = vu47:FindFirstChild("NinjaKunai")
                        if v143.StickyPart:FindFirstChild("StickyWeld") and v143.StickyPart.StickyWeld.Part1 ~= vu46.Character["Right Leg"] then
                            vu55:FireServer(v143)
                        end
                    elseif vu47 and (not vu47:FindFirstChild("NinjaKunai") and (vu46.Character and vu46.Character.Humanoid.Health > 0) and vu46.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead) then
                        task.spawn(vu127, "NinjaKunai")
                        while vu47 and not vu47:FindFirstChild("NinjaKunai") do
                            task.wait(0.01)
                        end
                        local v144 = vu47:FindFirstChild("NinjaKunai")
                        if v144 and v144:FindFirstChild("StickyPart") then
                            local v145 = vu46.Character.HumanoidRootPart
                            local v146 = v145.CFrame
                            while not v144.StickyPart:FindFirstChild("PartOwner") do
                                v145.CFrame = v144.StickyPart.CFrame + Vector3.new(0, 10, 0)
                                vu51:FireServer(v144.StickyPart)
                                task.wait(0.01)
                            end
                            while v144.StickyPart:FindFirstChild("StickyWeld") and v144.StickyPart.StickyWeld.Part1 ~= vu46.Character["Right Leg"] do
                                vu40.PlayerEvents.StickyPartEvent:FireServer(v144.StickyPart, vu46.Character["Right Leg"], CFrame.new(0.049, 0, 0) * CFrame.Angles(0, math.rad(180), 0))
                                task.wait(0.01)
                            end
                            v145.CFrame = v146
                        end
                    end
                    task.wait(0.1)
                end
            end
        })
        local v147 = v62:AddSection({
            Name = "Rinnegan Settings"
        })
        local vu154 = (function(p148)
            local v149, v150, v151 = ipairs(workspace:GetDescendants())
            local v152 = {}
            while true do
                local v153
                v151, v153 = v149(v150, v151)
                if v151 == nil then
                    break
                end
                if v153:IsA("Part") and v153.Name == p148 then
                    table.insert(v152, v153)
                end
            end
            return v152
        end)("PoisonHurtPart")
        local vu155 = nil
        local vu156 = nil
        local vu157 = nil
        local vu158 = nil
        v147:AddToggle({
            Name = "Rinnegan",
            Default = false,
            Save = true,
            Callback = function(p159)
                vu158 = p159
                if vu158 then
                    vu156 = coroutine.create(function()
                        while vu155 ~= "Fling away" do
                            if vu155 ~= "Kill" then
                                if vu155 == "Send to the heaven" then
                                    local v160 = vu46.Character
                                    local v161 = v160 and v160:FindFirstChild("Head") and v160.Head:FindFirstChild("PartOwner")
                                    if v161 then
                                        local v162 = vu45:FindFirstChild(v161.Value)
                                        if v162 and v162.Character then
                                            vu51:FireServer(v162.Character.Head or v162.Character.Torso, v162.Character.HumanoidRootPart.CFrame)
                                            task.wait(0.1)
                                            local v163 = v162.Character:FindFirstChild("Torso")
                                            if v163 then
                                                local v164 = v163:FindFirstChild("heavenD") or Instance.new("BodyVelocity")
                                                v164.Name = "heavenD"
                                                v164.Parent = v163
                                                v164.Velocity = Vector3.new(0, 9999999, 0)
                                                v164.MaxForce = Vector3.new(0, math.huge, 0)
                                                vu42:AddItem(v164, 100)
                                            end
                                        end
                                    end
                                end
                            else
                                local v165 = vu46.Character
                                local v166 = v165 and v165:FindFirstChild("Head") and v165.Head:FindFirstChild("PartOwner")
                                if v166 then
                                    local v167 = vu45:FindFirstChild(v166.Value)
                                    if v167 and v167.Character then
                                        vu51:FireServer(v167.Character.Head or v167.Character.Torso, v167.Character.HumanoidRootPart.CFrame)
                                        task.wait(0.05)
                                        local v168 = v167.Character
                                        local v169 = v168.Head
                                        if v168 and v169 then
                                            while v168.Humanoid.Health ~= 0 do
                                                local v170, v171, v172 = pairs(vu154)
                                                while true do
                                                    local v173
                                                    v172, v173 = v170(v171, v172)
                                                    if v172 == nil then
                                                        break
                                                    end
                                                    v173.Size = Vector3.new(1, 3, 1)
                                                    v173.Transparency = 1
                                                    v173.Position = v169.Position
                                                end
                                                wait()
                                                local v174, v175, v176 = pairs(vu154)
                                                while true do
                                                    local v177
                                                    v176, v177 = v174(v175, v176)
                                                    if v176 == nil then
                                                        break
                                                    end
                                                    v177.Position = Vector3.new(0, - 200, 0)
                                                end
                                            end
                                            local v178, v179, v180 = pairs(vu154)
                                            while true do
                                                local v181
                                                v180, v181 = v178(v179, v180)
                                                if v180 == nil then
                                                    break
                                                end
                                                v181.Position = Vector3.new(0, - 200, 0)
                                            end
                                        end
                                    end
                                end
                            end
                            wait(0.02)
                        end
                        local v182 = vu46.Character
                        local v183 = v182 and v182:FindFirstChild("Head") and v182.Head:FindFirstChild("PartOwner")
                        if v183 then
                            local v184 = vu45:FindFirstChild(v183.Value)
                            if v184 and v184.Character then
                                vu51:FireServer(v184.Character.Torso, v184.Character.HumanoidRootPart.CFrame)
                                task.wait(0.1)
                                local v185 = v184.Character:FindFirstChild("Torso")
                                if v185 then
                                    local v186 = v185:FindFirstChild("Fling") or Instance.new("BodyVelocity")
                                    local v187 = v184.Character.HumanoidRootPart.CFrame.LookVector
                                    local v188 = Vector3.new(- v187.X, 0, - v187.Z) * vu157
                                    v186.Name = "Fling"
                                    v186.Parent = v185
                                    v186.Velocity = v188 + Vector3.new(0, 20, 0)
                                    v186.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                    vu42:AddItem(v186, 100)
                                    wait(0.2)
                                    v184.Character.Torso:FindFirstChild("Fling"):Destroy()
                                    vu44:FireServer(v184.Character.Torso)
                                end
                            end
                        end
                    end)
                    coroutine.resume(vu156)
                elseif vu156 then
                    coroutine.close(vu156)
                    local v189 = vu45
                    local v190, v191, v192 = pairs(v189:GetPlayers())
                    while true do
                        local v193
                        v192, v193 = v190(v191, v192)
                        if v192 == nil then
                            break
                        end
                        local v194 = v193.Torso
                        if v194 then
                            local v195, v196, v197 = pairs(v194:GetChildren())
                            while true do
                                local v198
                                v197, v198 = v195(v196, v197)
                                if v197 == nil then
                                    break
                                end
                                if true then
                                    v198:Destroy()
                                end
                            end
                        end
                    end
                    vu156 = nil
                end
            end
        })
        v147:AddDropdown({
            Name = "Setting",
            Default = "Fling away",
            Options = {
                "Fling away",
                "Kill",
                "Send to the heaven"
            },
            Callback = function(p199)
                vu155 = p199
            end
        })
        v147:AddSlider({
            Name = "Fling away strength",
            Min = 50,
            Max = 800,
            Default = vu157,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(p200)
                vu157 = p200
            end
        })
        local v201 = v62:AddSection({
            Name = "Character Settings"
        })
        local vu202 = false
        game:GetService("UserInputService").JumpRequest:Connect(function()
            local v203 = vu202 and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if v203 then
                v203:ChangeState("Jumping")
            end
        end)
        v201:AddToggle({
            Name = "Infinite Jump",
            Default = false,
            Callback = function(p204)
                vu202 = p204
            end
        })
        local v205 = v62:AddSection({
            Name = "Walk Speed"
        })
        getgenv().TpWalking = false
        getgenv().Speed = 16
        local function vu207(p206)
            getgenv().Speed = p206
        end
        local function vu209(p208)
            getgenv().TpWalking = p208
        end
        vu46.CharacterAdded:Connect(function(p210)
            chr = p210
            hum = chr:WaitForChild("Humanoid")
        end)
        vu39.Heartbeat:Connect(function(p211)
            if getgenv().TpWalking and (chr and (hum and (hum.Parent and hum.MoveDirection.Magnitude > 0))) then
                chr:TranslateBy(hum.MoveDirection * getgenv().Speed * p211)
            end
        end)
        v205:AddToggle({
            Name = "Walk Speed",
            Default = false,
            Callback = function(p212)
                vu209(p212)
            end
        })
        v205:AddSlider({
            Name = "Value Speed",
            Min = 16,
            Max = 400,
            Default = getgenv().Speed,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(p213)
                vu207(p213)
            end
        })
        local vu214 = false
        local vu215 = 400
        v63:AddToggle({
            Name = "Line Grab",
            Default = false,
            Callback = function(p216)
                vu214 = p216
            end
        })
        v63:AddSlider({
            Name = "Strength Speed",
            Min = 50,
            Max = 800,
            Default = vu215,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(p217)
                vu215 = p217
            end
        })
        v54.ChildAdded:Connect(function(pu218)
            if pu218.Name == "GrabParts" then
                local v219 = pu218.GrabPart.WeldConstraint.Part1
                local vu220
                if vu214 then
                    vu220 = Instance.new("BodyVelocity", v219)
                    vu220.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    vu220.Velocity = workspace.CurrentCamera.CFrame.lookVector * vu215
                    vu42:AddItem(vu220, 1)
                else
                    vu220 = nil
                end
                pu218:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not pu218.Parent and vu220 then
                        vu220:Destroy()
                    end
                end)
            end
        end)
        local v221 = v63:AddSection({
            Name = "Super Strength"
        })
        local vu222 = false
        v221:AddToggle({
            Name = "Super Strength",
            Default = false,
            Callback = function(p223)
                vu222 = p223
            end
        })
        v221:AddSlider({
            Name = "Value Strength",
            Min = 50,
            Max = 800,
            Default = vu215,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(p224)
                vu215 = p224
            end
        })
        v54.ChildAdded:Connect(function(pu225)
            if pu225.Name == "GrabParts" then
                local v226 = pu225.GrabPart.WeldConstraint.Part1
                if v226 and vu222 then
                    local vu227 = Instance.new("BodyVelocity", v226)
                    pu225:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not pu225.Parent then
                            if vu53:GetLastInputType() ~= Enum.UserInputType.MouseButton2 then
                                if vu53:GetLastInputType() ~= Enum.UserInputType.MouseButton1 then
                                    vu227:Destroy()
                                else
                                    vu227:Destroy()
                                end
                            else
                                vu227.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                vu227.Velocity = workspace.CurrentCamera.CFrame.lookVector * vu215
                                vu42:AddItem(vu227, 1)
                            end
                        end
                    end)
                end
            end
        end)
        local v228 = v63:AddSection({
            Name = "Grab Mode"
        })
        local function vu233(pu229, pu230, _)
            task.spawn(function()
                local v231 = CFrame.new(pu230)
                local v232 = Vector3.new(0, 90, 0)
                vu50.SpawnToyRemoteFunction:InvokeServer(pu229, v231, v232)
            end)
        end
        local vu234 = nil
        local function vu237(p235)
            if not vu47:FindFirstChild("Campfire") then
                vu233("Campfire", Vector3.new(- 72.9304581, - 5.96906614, - 265.543732))
            end
            local v236 = vu47:FindFirstChild("Campfire")
            vu234 = v236:FindFirstChild("FirePlayerPart") or v236.FirePlayerPart
            vu234.Size = Vector3.new(7, 7, 7)
            vu234.Position = p235.Position
            task.wait(0.3)
            vu234.Position = Vector3.new(0, - 50, 0)
        end
        local function vu240()
            while true do
                pcall(function()
                    local v238 = workspace:FindFirstChild("GrabParts")
                    local v239 = v238 and v238.Name == "GrabParts" and v238:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")
                    if v239 then
                        vu237(v239)
                    end
                end)
                wait()
            end
        end
        local vu241 = nil
        v228:AddToggle({
            Name = "Burn Grab",
            Default = false,
            Save = true,
            Callback = function(p242)
                if p242 then
                    vu241 = coroutine.create(vu240)
                    coroutine.resume(vu241)
                elseif vu241 then
                    coroutine.close(vu241)
                    vu241 = nil
                end
            end
        })
        local function vu246(p243)
            local v244 = workspace.Map.AlwaysHereTweenedObjects.OuterUFO.Object.ObjectModel
            local v245 = v244:FindFirstChild("PaintPlayerPart") or v244.PaintPlayerPart
            v245.Size = Vector3.new(7, 7, 7)
            v245.Position = p243.Position
            task.wait(0.3)
            v245.Position = Vector3.new(0, - 50, 0)
        end
        local function vu249()
            while true do
                pcall(function()
                    local v247 = workspace:FindFirstChild("GrabParts")
                    local v248 = v247 and v247.Name == "GrabParts" and v247:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")
                    if v248 then
                        vu246(v248)
                    end
                end)
                task.wait()
            end
        end
        local vu250 = nil
        v228:AddToggle({
            Name = "Radiation Grab",
            Default = false,
            Save = true,
            Callback = function(p251)
                if p251 then
                    vu250 = coroutine.create(vu249)
                    coroutine.resume(vu250)
                elseif vu250 then
                    coroutine.close(vu250)
                    vu250 = nil
                end
            end
        })
        local function vu255(p252)
            local v253 = workspace.Map.FactoryIsland.PoisonContainer
            local v254 = v253:FindFirstChild("PoisonHurtPart") or v253.PoisonHurtPart
            v254.Size = Vector3.new(7, 7, 7)
            v254.Position = p252.Position
            task.wait(0.3)
            v254.Position = Vector3.new(0, - 50, 0)
        end
        local function vu258()
            while true do
                pcall(function()
                    local v256 = workspace:FindFirstChild("GrabParts")
                    local v257 = v256 and v256.Name == "GrabParts" and v256:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")
                    if v257 then
                        vu255(v257)
                    end
                end)
                task.wait()
            end
        end
        local vu259 = nil
        v228:AddToggle({
            Name = "Poison Grab",
            Default = false,
            Save = true,
            Callback = function(p260)
                if p260 then
                    vu259 = coroutine.create(vu258)
                    coroutine.resume(vu259)
                elseif vu259 then
                    coroutine.close(vu259)
                    vu259 = nil
                end
            end
        })
        local function vu265(pu261, pu262, _)
            task.spawn(function()
                local v263 = CFrame.new(pu262)
                local v264 = Vector3.new(0, 90, 0)
                vu50.SpawnToyRemoteFunction:InvokeServer(pu261, v263, v264)
            end)
        end
        local vu266 = nil
        local function vu269(p267)
            if not vu47:FindFirstChild("SprayCanWD") then
                vu265("SprayCanWD", Vector3.new(- 72.9304581, - 5.96906614, - 265.543732))
            end
            local v268 = vu47:FindFirstChild("SprayCanWD")
            vu266 = v268:FindFirstChild("StickyRemoverPart") or v268.StickyRemoverPart
            vu266.Size = Vector3.new(7, 7, 7)
            vu266.Position = p267.Position
            task.wait(0.3)
            vu266.Position = Vector3.new(0, - 50, 0)
        end
        local function vu272()
            while true do
                pcall(function()
                    local v270 = workspace:FindFirstChild("GrabParts")
                    local v271 = v270 and v270.Name == "GrabParts" and v270:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")
                    if v271 then
                        vu269(v271)
                    end
                end)
                wait()
            end
        end
        local vu273 = nil
        v228:AddToggle({
            Name = "Spray Grab",
            Default = false,
            Save = true,
            Callback = function(p274)
                if p274 then
                    vu273 = coroutine.create(vu272)
                    coroutine.resume(vu273)
                elseif vu273 then
                    coroutine.close(vu273)
                    vu273 = nil
                end
            end
        })
        local function vu285()
            while true do
                local _, _ = pcall(function()
                    local v275 = workspace:FindFirstChild("GrabParts")
                    if v275 and v275.Name == "GrabParts" then
                        local v276 = v275:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent
                        if v276:FindFirstChild("HumanoidRootPart") or (v276:IsA("Model") or v276:IsA("Player")) then
                            while workspace:FindFirstChild("GrabParts") do
                                local v277, v278, v279 = pairs(v276:GetChildren())
                                while true do
                                    local v280
                                    v279, v280 = v277(v278, v279)
                                    if v279 == nil then
                                        break
                                    end
                                    if v280:IsA("BasePart") then
                                        v280.CanCollide = false
                                    end
                                end
                                wait()
                            end
                            local v281, v282, v283 = pairs(v276:GetChildren())
                            while true do
                                local v284
                                v283, v284 = v281(v282, v283)
                                if v283 == nil then
                                    break
                                end
                                if v284:IsA("BasePart") then
                                    v284.CanCollide = true
                                end
                            end
                        end
                    end
                end)
                wait()
            end
        end
        local vu286 = nil
        v228:AddToggle({
            Name = "Noclip Grab",
            Default = false,
            Save = true,
            Callback = function(p287)
                if p287 then
                    vu286 = coroutine.create(vu285)
                    coroutine.resume(vu286)
                elseif vu286 then
                    coroutine.close(vu286)
                    vu286 = nil
                end
            end
        })
        local function vu294()
            while true do
                local v288 = workspace:FindFirstChild("GrabParts")
                local v289 = v288 and (v288.Name == "GrabParts" and v288:FindFirstChild("GrabPart"))
                if v289 then
                    local v290 = v289:FindFirstChild("WeldConstraint")
                    if v290 and v290.Part1 then
                        local v291 = v290.Part1.Parent
                        local v292 = v291:FindFirstChild("Humanoid")
                        if v292 then
                            wait(0.3)
                            v292.Health = 0
                            wait(0.2)
                            local v293 = v291.Character.HumanoidRootPart
                            game.ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(v293)
                        end
                    end
                end
                wait()
            end
        end
        local vu295 = nil
        v228:AddToggle({
            Name = "Kill Grab",
            Default = false,
            Save = true,
            Callback = function(p296)
                if p296 then
                    vu295 = coroutine.create(vu294)
                    coroutine.resume(vu295)
                elseif vu295 then
                    coroutine.close(vu295)
                    vu295 = nil
                end
            end
        })
        getgenv().KickGrab = false
        v54.ChildAdded:Connect(function(pu297)
            if pu297.Name == "GrabParts" then
                local v298 = pu297.GrabPart.WeldConstraint.Part1
                local vu299 = nil
                local v300 = v298.Parent
                if KickGrab then
                    if v300:FindFirstChild("Humanoid") then
                        vu299 = Instance.new("BodyVelocity", v298)
                        vu299.MaxForce = Vector3.new(0, 9999999, 0)
                        vu299.Velocity = Vector3.new(0, math.huge, 0)
                        vu42:AddItem(vu299, 100)
                    end
                    pu297:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not pu297.Parent and vu299 then
                            vu299:Destroy()
                        end
                    end)
                end
            end
        end)
        v228:AddToggle({
            Name = "Kick Grab",
            Default = false,
            Save = true,
            Callback = function(p301)
                KickGrab = p301
            end
        })
        local vu302 = 18
        getgenv().kickAuraEnabled = false
        getgenv().flingAuraEnabled = false
        getgenv().defenseStrength = 50
        getgenv().whiteListEnabled = false
        getgenv().hellAuraEnabled = false
        local vu303 = {}
        getgenv().flingTarget = "Player"
        getgenv().magneticaura = false
        local function vu307(p304)
            local v305 = p304 and p304.Character and p304.Character:FindFirstChild("HumanoidRootPart")
            if v305 then
                vu51:FireServer(p304.Character.Head or p304.Character.Torso, p304.Character.HumanoidRootPart.CFrame)
                task.wait(0.1)
                local v306 = v305:FindFirstChild("heavenD") or Instance.new("BodyVelocity")
                v306.Name = "heavenD"
                v306.Parent = v305
                v306.Velocity = Vector3.new(0, 9999999, 0)
                v306.MaxForce = Vector3.new(0, math.huge, 0)
                vu42:AddItem(v306, 100)
            end
        end
        local function vu315()
            while true do
                repeat
                    wait(0.02)
                until kickAuraEnabled
                local v308 = vu46.Character
                if v308 and v308:FindFirstChild("HumanoidRootPart") then
                    local v309 = v308.HumanoidRootPart.Position
                    local v310 = vu45
                    local v311, v312, v313 = pairs(v310:GetPlayers())
                    while true do
                        local v314
                        v313, v314 = v311(v312, v313)
                        if v313 == nil then
                            break
                        end
                        if v314 ~= vu46 and v314.Character and (v314.Character:FindFirstChild("HumanoidRootPart") and not (whiteListEnabled and vu46:IsFriendsWith(v314.UserId))) and (v309 - v314.Character.HumanoidRootPart.Position).Magnitude <= vu302 then
                            vu307(v314)
                        end
                    end
                end
            end
        end
        local function vu319(p316)
            if p316 and p316.PrimaryPart then
                local v317 = p316.PrimaryPart
                local v318 = v317:FindFirstChild("Fling") or Instance.new("BodyVelocity")
                v318.Name = "Fling"
                v318.Parent = v317
                v318.Velocity = Vector3.new(0, vu157, 0)
                v318.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                wait(0.1)
            end
        end
        local function vu326(p320)
            local v321 = p320 and p320.Character and p320.Character:FindFirstChild("Torso")
            if v321 then
                vu51:FireServer(v321, p320.Character.HumanoidRootPart.CFrame)
                task.wait(0.1)
                local v322 = v321:FindFirstChild("Fling") or Instance.new("BodyVelocity")
                local v323 = p320.Character.HumanoidRootPart.CFrame.LookVector
                local v324 = Vector3.new(- v323.X, 0, - v323.Z) * vu157
                v322.Name = "Fling"
                v322.Parent = v321
                v322.Velocity = v324 + Vector3.new(0, 20, 0)
                v322.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                vu42:AddItem(v322, 100)
                wait(0.2)
                local v325 = p320.Character.Torso:FindFirstChild("Fling")
                if v325 then
                    v325:Destroy()
                end
            end
        end
        local function vu330(p327, p328)
            local v329 = p327.Parent
            while v329 do
                if v329 == p328 then
                    return true
                end
                v329 = v329.Parent
            end
            return false
        end
        local function vu342()
            while flingAuraEnabled do
                wait(0.02)
                local v331 = vu46.Character
                if v331 and v331:FindFirstChild("HumanoidRootPart") then
                    local v332 = v331.HumanoidRootPart.Position
                    if flingTarget == "Player" or flingTarget == "Player and Part" then
                        local v333 = vu45
                        local v334, v335, v336 = pairs(v333:GetPlayers())
                        while true do
                            local v337
                            v336, v337 = v334(v335, v336)
                            if v336 == nil then
                                break
                            end
                            if v337 ~= vu46 and v337.Character and (v337.Character:FindFirstChild("HumanoidRootPart") and not (whiteListEnabled and vu46:IsFriendsWith(v337.UserId))) and (v332 - v337.Character.HumanoidRootPart.Position).Magnitude <= vu302 then
                                vu326(v337)
                            end
                        end
                    end
                    if flingTarget == "Part" or flingTarget == "Player and Part" then
                        vu303 = workspace:GetPartBoundsInRadius(v332, vu302)
                        local v338, v339, v340 = pairs(vu303)
                        while true do
                            local v341
                            v340, v341 = v338(v339, v340)
                            if v340 == nil then
                                break
                            end
                            if not vu330(v341, vu46.Character) and v341.Parent:IsA("Model") then
                                vu319(v341.Parent)
                            end
                        end
                    end
                end
            end
        end
        v64:AddToggle({
            Name = "Kick Aura",
            Default = false,
            Save = true,
            Callback = function(p343)
                kickAuraEnabled = p343
            end
        })
        local v344 = v64:AddSection({
            Name = "Fling"
        })
        v344:AddToggle({
            Name = "Fling Aura",
            Default = false,
            Save = true,
            Callback = function(p345)
                flingAuraEnabled = p345
                if flingAuraEnabled then
                    task.spawn(vu342)
                end
            end
        })
        v344:AddDropdown({
            Name = "Fling Object",
            Default = "Player",
            Options = {
                "Player",
                "Part",
                "Player and Part"
            },
            Callback = function(p346)
                flingTarget = p346
            end
        })
        v344:AddSlider({
            Name = "Fling Value",
            Min = 50,
            Max = 800,
            Default = vu157,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            Callback = function(p347)
                vu157 = p347
            end
        })
        local function vu351(p348)
            local v349 = p348 and p348.Character and p348.Character:FindFirstChild("HumanoidRootPart")
            if v349 then
                vu51:FireServer(v349, p348.Character.HumanoidRootPart.CFrame)
                task.wait(0.1)
                local v350 = v349:FindFirstChild("Magnet") or Instance.new("BodyPosition")
                v350.Name = "Magnet"
                v350.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                v350.Parent = v349
                v350.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                game:GetService("Debris"):AddItem(v350, 0.1)
            end
        end
        local function vu358()
            while true do
                repeat
                    wait(0.01)
                until magneticaura
                local v352 = game.Players.LocalPlayer.Character
                if v352 and v352:FindFirstChild("HumanoidRootPart") then
                    local v353 = v352.HumanoidRootPart.Position
                    local v354, v355, v356 = pairs(game.Players:GetPlayers())
                    while true do
                        local v357
                        v356, v357 = v354(v355, v356)
                        if v356 == nil then
                            break
                        end
                        if v357 ~= game.Players.LocalPlayer and v357.Character and (v357.Character:FindFirstChild("HumanoidRootPart") and not (whiteListEnabled and game.Players.LocalPlayer:IsFriendsWith(v357.UserId))) and (v353 - v357.Character.HumanoidRootPart.Position).Magnitude <= vu302 then
                            vu351(v357)
                        end
                    end
                end
            end
        end
        local function v359(_)
            task.spawn(vu315)
            task.spawn(vu342)
            task.spawn(vu358)
        end
        vu46.CharacterAdded:Connect(v359)
        if vu46.Character then
            v359(vu46.Character)
        end
        v64:AddToggle({
            Name = "Magnetic Aura",
            Default = false,
            Callback = function(p360)
                magneticaura = p360
            end
        })
        local vu361 = nil
        v64:AddToggle({
            Name = "Hell Aura",
            Default = false,
            Save = true,
            Callback = function(p362)
                hellAuraEnabled = p362
                if p362 then
                    vu361 = coroutine.create(function()
                        while hellAuraEnabled do
                            local v363 = vu46.Character
                            if v363 and v363:FindFirstChild("HumanoidRootPart") then
                                local v364 = v363.HumanoidRootPart
                                local v365 = vu45
                                local v366, v367, v368 = pairs(v365:GetPlayers())
                                while true do
                                    local v369
                                    v368, v369 = v366(v367, v368)
                                    if v368 == nil then
                                        break
                                    end
                                    if v369 ~= vu46 and v369.Character and not (whiteListEnabled and vu46:IsFriendsWith(v369.UserId)) then
                                        local v370 = v369.Character
                                        local v371 = v370:FindFirstChild("Torso") or v370:FindFirstChild("HumanoidRootPart")
                                        if v371 and (v371.Position - v364.Position).Magnitude <= vu302 then
                                            vu51:FireServer(v371, v364.CFrame)
                                            local v372 = v371:FindFirstChild("GravityForce") or Instance.new("BodyForce")
                                            v372.Parent = v371
                                            v372.Name = "GravityForce"
                                            v372.Force = Vector3.new(0, - 5000, 0)
                                            local v373, v374, v375 = ipairs(v370:GetDescendants())
                                            while true do
                                                local v376
                                                v375, v376 = v373(v374, v375)
                                                if v375 == nil then
                                                    break
                                                end
                                                if v376:IsA("BasePart") then
                                                    v376.CanCollide = false
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            task.wait(0.02)
                        end
                    end)
                    coroutine.resume(vu361)
                elseif vu361 then
                    hellAuraEnabled = false
                    vu361 = nil
                end
            end
        })
        local vu377 = nil
        local vu378 = nil
        local function v385(p379)
            local v380, v381, v382 = ipairs(workspace:GetDescendants())
            local v383 = {}
            while true do
                local v384
                v382, v384 = v380(v381, v382)
                if v382 == nil then
                    break
                end
                if v384:IsA("Part") and v384.Name == p379 then
                    table.insert(v383, v384)
                end
            end
            return v383
        end
        local vu386 = v385("PaintPlayerPart")
        local vu387 = v385("PoisonHurtPart")
        v64:AddToggle({
            Name = "Radiactive Aura",
            Default = false,
            Save = true,
            Callback = function(pu388)
                if pu388 then
                    vu377 = coroutine.create(function()
                        local vu389 = {}
                        while pu388 do
                            pcall(function()
                                local v390 = vu46.Character
                                if v390 and v390:FindFirstChild("HumanoidRootPart") then
                                    local v391 = v390.HumanoidRootPart
                                    local v392 = vu45
                                    local v393, v394, v395 = pairs(v392:GetPlayers())
                                    while true do
                                        local v396
                                        v395, v396 = v393(v394, v395)
                                        if v395 == nil then
                                            break
                                        end
                                        if v396 ~= vu46 and v396.Character and not (whiteListEnabled and vu46:IsFriendsWith(v396.UserId)) then
                                            local v397 = v396.Character
                                            local v398 = v397:FindFirstChild("HumanoidRootPart")
                                            if v398 then
                                                if (v391.Position - v398.Position).Magnitude > vu302 or v397.Humanoid.Health <= 0 then
                                                    vu389[v396] = nil
                                                else
                                                    local v399 = v397:FindFirstChild("Head")
                                                    if not vu389[v396] then
                                                        vu51:FireServer(v398, v398.CFrame)
                                                        vu389[v396] = true
                                                    end
                                                    local v400, v401, v402 = pairs(vu386)
                                                    while true do
                                                        local v403
                                                        v402, v403 = v400(v401, v402)
                                                        if v402 == nil then
                                                            break
                                                        end
                                                        v403.Size = Vector3.new(1, 3, 1)
                                                        v403.Transparency = 1
                                                        v403.Position = v399.Position
                                                    end
                                                    wait()
                                                    local v404, v405, v406 = pairs(vu386)
                                                    while true do
                                                        local v407
                                                        v406, v407 = v404(v405, v406)
                                                        if v406 == nil then
                                                            break
                                                        end
                                                        v407.Position = Vector3.new(0, - 200, 0)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                            wait(0.02)
                        end
                    end)
                    coroutine.resume(vu377)
                elseif vu377 then
                    coroutine.close(vu377)
                    local v408, v409, v410 = pairs(vu386)
                    while true do
                        local v411
                        v410, v411 = v408(v409, v410)
                        if v410 == nil then
                            break
                        end
                        v411.Position = Vector3.new(0, - 200, 0)
                    end
                    vu377 = nil
                end
            end
        })
        v64:AddToggle({
            Name = "Poison Aura",
            Default = false,
            Save = true,
            Callback = function(pu412)
                if pu412 then
                    vu378 = coroutine.create(function()
                        local vu413 = {}
                        while pu412 do
                            pcall(function()
                                local v414 = vu46.Character
                                if v414 and v414:FindFirstChild("HumanoidRootPart") then
                                    local v415 = v414.HumanoidRootPart
                                    local v416 = vu45
                                    local v417, v418, v419 = pairs(v416:GetPlayers())
                                    while true do
                                        local v420
                                        v419, v420 = v417(v418, v419)
                                        if v419 == nil then
                                            break
                                        end
                                        if v420 ~= vu46 and v420.Character and not (whiteListEnabled and vu46:IsFriendsWith(v420.UserId)) then
                                            local v421 = v420.Character
                                            local v422 = v421:FindFirstChild("HumanoidRootPart")
                                            if v422 then
                                                if (v415.Position - v422.Position).Magnitude > vu302 or v421.Humanoid.Health <= 0 then
                                                    vu413[v420] = nil
                                                else
                                                    local v423 = v421:FindFirstChild("Head")
                                                    if not vu413[v420] then
                                                        vu51:FireServer(v422, v422.CFrame)
                                                        vu413[v420] = true
                                                    end
                                                    local v424, v425, v426 = pairs(vu387)
                                                    while true do
                                                        local v427
                                                        v426, v427 = v424(v425, v426)
                                                        if v426 == nil then
                                                            break
                                                        end
                                                        v427.Size = Vector3.new(1, 3, 1)
                                                        v427.Transparency = 1
                                                        v427.Position = v423.Position
                                                    end
                                                    wait()
                                                    local v428, v429, v430 = pairs(vu387)
                                                    while true do
                                                        local v431
                                                        v430, v431 = v428(v429, v430)
                                                        if v430 == nil then
                                                            break
                                                        end
                                                        v431.Position = Vector3.new(0, - 200, 0)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                            wait(0.02)
                        end
                    end)
                    coroutine.resume(vu378)
                elseif vu378 then
                    coroutine.close(vu378)
                    local v432, v433, v434 = pairs(vu387)
                    while true do
                        local v435
                        v434, v435 = v432(v433, v434)
                        if v434 == nil then
                            break
                        end
                        v435.Position = Vector3.new(0, - 200, 0)
                    end
                    vu378 = nil
                end
            end
        })
        v64:AddSection({
            Name = "White List"
        }):AddToggle({
            Name = "WhiteList Aura",
            Default = false,
            Save = true,
            Callback = function(p436)
                whiteListEnabled = p436
            end
        })
        local v437 = v65:AddSection({
            Name = "Destory Server"
        })
        blobWhiteListEnabled = false
        local vu438 = {
            "Mr_Voidz13",
            "ex0lir"
        }
        local vu439 = nil
        local vu440 = 1
        local vu441 = "Two Handle"
        local function vu447(p442)
            local v443, v444, v445 = pairs(vu438)
            while true do
                local v446
                v445, v446 = v443(v444, v445)
                if v445 == nil then
                    break
                end
                if p442.Name == v446 then
                    return true
                end
            end
            return false
        end
        local function vu449(p448)
            return vu46:IsFriendsWith(p448.UserId)
        end
        local function vu453(p450, p451)
            local v452 = p450.Parent
            while v452 do
                if v452 == p451 then
                    return true
                end
                v452 = v452.Parent
            end
            return false
        end
        local function vu457(p454, p455)
            if p454.Character and p454.Character:FindFirstChild("HumanoidRootPart") then
                local v456 = {
                    p455:FindFirstChild("RightDetector"),
                    p454.Character:FindFirstChild("HumanoidRootPart"),
                    p455:FindFirstChild("RightDetector"):FindFirstChild("RightWeld")
                }
                p455:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(v456))
            end
        end
        local function vu461(p458, p459)
            if p458.Character and p458.Character:FindFirstChild("HumanoidRootPart") then
                local v460 = {
                    p459:FindFirstChild("LeftDetector"),
                    p458.Character:FindFirstChild("HumanoidRootPart"),
                    p459:FindFirstChild("LeftDetector"):FindFirstChild("LeftWeld")
                }
                p459:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(v460))
            end
        end
        local function vu468(p462)
            while true do
                local v463 = vu45
                local v464, v465, v466 = ipairs(v463:GetPlayers())
                while true do
                    local v467
                    v466, v467 = v464(v465, v466)
                    if v466 == nil then
                        break
                    end
                    if v467 ~= vu46 and (not vu447(v467) and (not blobWhiteListEnabled or blobWhiteListEnabled and not vu449(v467))) then
                        if vu441 ~= "Left Handle" then
                            if vu441 ~= "Right Handle" then
                                if vu441 == "Two Handle" then
                                    if vu440 ~= 1 then
                                        vu457(v467, p462)
                                        vu440 = 1
                                    else
                                        vu461(v467, p462)
                                        vu440 = 2
                                    end
                                end
                            else
                                vu457(v467, p462)
                            end
                        else
                            vu461(v467, p462)
                        end
                        task.wait()
                    end
                end
            end
        end
        local function vu475(p469)
            if p469 then
                local vu470 = nil
                vu439 = coroutine.create(function()
                    local v471, v472, v473 = pairs(game.Workspace:GetDescendants())
                    while true do
                        local v474
                        v473, v474 = v471(v472, v473)
                        if v473 == nil then
                            break
                        end
                        if v474.Name == "CreatureBlobman" and v474:FindFirstChild("VehicleSeat") and (v474.VehicleSeat:FindFirstChild("SeatWeld") and vu453(v474.VehicleSeat.SeatWeld.Part1, vu46.Character)) then
                            vu470 = v474
                            break
                        end
                    end
                    if vu470 then
                        vu468(vu470)
                    end
                end)
                coroutine.resume(vu439)
            elseif vu439 then
                coroutine.close(vu439)
                vu439 = nil
            end
        end
        v437:AddDropdown({
            Name = "Select Mode",
            Default = "Two Handle",
            Options = {
                "Left Handle",
                "Right Handle",
                "Two Handle"
            },
            Callback = function(p476)
                vu441 = p476
            end
        })
        v437:AddToggle({
            Name = "Destroy Server",
            Default = false,
            Callback = function(p477)
                vu475(p477)
            end
        })
        v437:AddToggle({
            Name = "WhiteList Friend",
            Default = false,
            Save = true,
            Callback = function(p478)
                blobWhiteListEnabled = p478
            end
        })
        local v479 = v65:AddSection({
            Name = "Blobman"
        })
        local vu480 = false
        local vu481 = false
        local vu482 = false
        local function vu487()
            vu481 = false
            while vu480 and not vu481 do
                local v483, v484, v485 = pairs(game.Workspace:GetDescendants())
                while true do
                    local v486
                    v485, v486 = v483(v484, v485)
                    if v485 == nil then
                        break
                    end
                    if v486.Name == "CreatureBlobman" and v486:FindFirstChild("VehicleSeat") and (v486.VehicleSeat:FindFirstChild("SeatWeld") and v486.VehicleSeat.SeatWeld.Part1:IsDescendantOf(vu46.Character)) then
                        v486.VehicleSeat.Anchored = true
                    end
                end
                wait(1)
            end
        end
        local function vu492()
            vu482 = false
            while vu480 and not vu482 do
                local v488, v489, v490 = pairs(game.Workspace:GetDescendants())
                while true do
                    local v491
                    v490, v491 = v488(v489, v490)
                    if v490 == nil then
                        break
                    end
                    if v491.Name == "CreatureBlobman" and v491:FindFirstChild("VehicleSeat") and (v491.VehicleSeat:FindFirstChild("SeatWeld") and v491.VehicleSeat.SeatWeld.Part1:IsDescendantOf(vu46.Character)) then
                        v491.VehicleSeat.Anchored = false
                    end
                end
                wait(1)
            end
        end
        v479:AddToggle({
            Name = "Freeze Blobman",
            Default = false,
            Callback = function(p493)
                vu480 = p493
                if vu480 ~= true then
                    if vu480 == false then
                        vu481 = true
                        vu492()
                    end
                else
                    vu482 = true
                    vu487()
                end
            end
        })
        local vu494 = false
        local vu495 = nil
        v479:AddToggle({
            Name = "Loop Seat Blobman",
            Default = false,
            Save = true,
            Callback = function(p496)
                vu494 = p496
                if vu494 then
                    if vu495 == nil then
                        vu495 = workspace.DescendantAdded:Connect(function(p497)
                            if p497.Name == "SeatWeld" then
                                local v498 = p497.Parent
                                if v498:IsA("VehicleSeat") and v498.Parent.Name == "CreatureBlobman" then
                                    local v499 = v498:FindFirstChildOfClass("ProximityPrompt")
                                    local v500, v501, v502 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
                                    while true do
                                        local v503
                                        v502, v503 = v500(v501, v502)
                                        if v502 == nil then
                                            break
                                        end
                                        if v503 == p497.Part1 then
                                            v499.Enabled = false
                                            while vu494 do
                                                v498:Sit(game.Players.LocalPlayer.Character.Humanoid)
                                                wait(0.1)
                                            end
                                            v499.Enabled = true
                                        end
                                    end
                                end
                            end
                        end)
                    end
                elseif vu495 then
                    vu495:Disconnect()
                    vu495 = nil
                end
            end
        })
        local v504 = v66:AddSection({
            Name = "Add"
        })
        local v505 = v66:AddSection({
            Name = "Remove"
        })
        local v506 = v66:AddSection({
            Name = "Loop Players"
        })
        local vu507 = {}
        local vu508 = false
        local _ = vu45.LocalPlayer.Name
        local function vu510(p509)
            if not table.find(vu507, p509) then
                table.insert(vu507, p509)
            end
        end
        local function vu516(p511)
            local v512, v513, v514 = ipairs(vu507)
            while true do
                local v515
                v514, v515 = v512(v513, v514)
                if v514 == nil then
                    break
                end
                if v515 == p511 then
                    table.remove(vu507, v514)
                    break
                end
            end
        end
        local function vu523()
            local v517 = vu45:GetPlayers()
            local v518, v519, v520 = ipairs(v517)
            local v521 = {}
            while true do
                local v522
                v520, v522 = v518(v519, v520)
                if v520 == nil then
                    break
                end
                table.insert(v521, v522.DisplayName .. " (" .. v522.Name .. ")")
            end
            return v521
        end
        local function vu529()
            local v524, v525, v526 = ipairs(vu507)
            local v527 = {}
            while true do
                local v528
                v526, v528 = v524(v525, v526)
                if v526 == nil then
                    break
                end
                table.insert(v527, v528)
            end
            return v527
        end
        local vu530 = nil
        local vu531 = nil
        local vu533 = v504:AddDropdown({
            Name = "Select Player",
            Default = "",
            Options = vu523(),
            Callback = function(p532)
                vu530 = string.match(p532, "%((.-)%)")
            end
        })
        local vu535 = v505:AddDropdown({
            Name = "Loop In Players",
            Default = "",
            Options = vu529(),
            Callback = function(p534)
                vu531 = p534
            end
        })
        local function vu536()
            if vu533 then
                vu533:Refresh(vu523(), true)
            end
            if vu535 then
                vu535:Refresh(vu529(), true)
            end
        end
        vu45.PlayerAdded:Connect(vu536)
        vu45.PlayerRemoving:Connect(vu536)
        v504:AddButton({
            Name = "Add Player",
            Callback = function()
                if vu530 then
                    vu510(vu530)
                    vu536()
                end
            end
        })
        v505:AddButton({
            Name = "Remove Player",
            Callback = function()
                if vu531 then
                    vu516(vu531)
                    vu536()
                end
            end
        })
        local function vu551(p537, p538)
            while p537 do
                local v539 = vu45.LocalPlayer
                if not (v539 and v539.Character and v539.Character:FindFirstChild("HumanoidRootPart")) then
                    v539.CharacterAdded:Wait()
                end
                local v540, v541, v542 = pairs(workspace:GetDescendants())
                while true do
                    local v543
                    v542, v543 = v540(v541, v542)
                    if v542 == nil then
                        break
                    end
                    if v543.Name == "CreatureBlobman" then
                        local v544 = v543:FindFirstChild(p538 .. "Detector")
                        local v545
                        if v544 then
                            v545 = v544:FindFirstChild(p538 .. "Weld")
                        else
                            v545 = v544
                        end
                        local v546, v547, v548 = ipairs(vu507)
                        while true do
                            local v549
                            v548, v549 = v546(v547, v548)
                            if v548 == nil then
                                break
                            end
                            local v550 = vu45:FindFirstChild(v549)
                            if v550 and v550.Character and v550.Character:FindFirstChild("HumanoidRootPart") then
                                v543.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(v544, v550.Character.HumanoidRootPart, v545)
                                wait(0.1)
                            end
                        end
                    end
                end
                wait(1)
                p537 = vu508
            end
        end
        v506:AddToggle({
            Name = "Blobman Target",
            Default = false,
            Callback = function(p552)
                vu508 = p552
                if vu508 then
                    spawn(function()
                        vu551(vu508, "Left")
                    end)
                end
            end
        })
        local v553 = v68:AddSection({
            Name = "Farm Coins"
        })
        local vu554 = workspace:FindFirstChild("Slots"):FindFirstChild("Slots").Screen.SlotGui.TimeLeftFrame.TimeText
        local vu555 = "0:00"
        local vu556 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local vu557 = false
        local vu558 = v553:AddLabel("Time: " .. vu554.Text)
        local function v559()
            while true do
                vu558:Set("Time: " .. vu554.Text)
                wait(1)
            end
        end
        local function vu561()
            while vu557 do
                vu556 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                if vu554.Text == vu555 then
                    local v560 = game.Players.LocalPlayer.Character.HumanoidRootPart
                    v560.CFrame = CFrame.new(Vector3.new(- 224.941177, 91.364975, 425.75116))
                    wait(1)
                    game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(workspace.Slots.Slots.SlotHandle.Handle, CFrame.new(- 224.941177, 91.364975, 425.75116))
                    wait(1)
                    v560.CFrame = vu556
                end
                wait(1)
            end
        end
        spawn(v559)
        v553:AddToggle({
            Name = "Auto Farm Coin",
            Default = false,
            Save = true,
            Callback = function(p562)
                vu557 = p562
                if vu557 then
                    vu561()
                end
            end
        })
        local v563 = v67:AddSection({
            Name = "Teleport"
        })
        local vu564 = nil
        local vu565 = nil
        local vu566 = nil
        local function vu567()
            if vu46.Character and vu46.Character:FindFirstChild("HumanoidRootPart") then
                vu564 = vu46.Character.HumanoidRootPart
                vu565 = vu46:GetMouse()
            end
        end
        local function vu569(p568)
            if p568.KeyCode == Enum.KeyCode.X and (vu565 and vu565.Target) and not vu53:GetFocusedTextBox() then
                vu564.CFrame = CFrame.new(vu565.Hit.x, vu565.Hit.y + 5, vu565.Hit.z)
            end
        end
        local function vu571(p570)
            if p570 then
                vu567()
                vu566 = vu53.InputBegan:Connect(vu569)
                vu46.CharacterAdded:Connect(function()
                    repeat
                        wait()
                    until vu46.Character:FindFirstChild("HumanoidRootPart")
                    vu567()
                end)
            elseif vu566 then
                vu566:Disconnect()
                vu566 = nil
            end
        end
        v563:AddToggle({
            Name = "TP - X",
            Default = false,
            Save = true,
            Callback = function(p572)
                vu571(p572)
            end
        })
        local v573, v574, v575 = pairs(vu46:WaitForChild("PlayerGui"):WaitForChild("MenuGui"):WaitForChild("Menu"):WaitForChild("TabContents"):WaitForChild("Toys"):WaitForChild("Contents"):GetChildren())
        local v576 = vu73
        local vu577 = vu56
        local vu578 = {}
        while true do
            local v579, v580 = v573(v574, v575)
            if v579 == nil then
                break
            end
            v575 = v579
            if v580.Name ~= "UIGridLayout" then
                vu578[v580.Name] = true
            end
        end
        local function vu584(pu581, pu582)
            task.spawn(function()
                local v583 = Vector3.new(0, 0, 0)
                vu40.MenuToys.SpawnToyRemoteFunction:InvokeServer(pu581, pu582, v583)
            end)
        end
        local function vu587(p585)
            local v586 = p585 or vu47:FindFirstChildWhichIsA("Model")
            if v586 then
                vu55:FireServer(v586)
            end
        end
        _G.ToyToLoad = "BombMissile"
        _G.MaxMissiles = 9
        local vu588 = nil
        local vu589 = {}
        local vu590 = nil
        local function vu610(p591)
            if p591 then
                if not vu578[_G.ToyToLoad] then
                    return
                end
                if not vu588 then
                    vu588 = coroutine.create(function()
                        vu590 = vu47.ChildAdded:Connect(function(pu592)
                            if pu592.Name == _G.ToyToLoad and (pu592:WaitForChild("ThisToysNumber", 1) and pu592.ThisToysNumber.Value == vu47.ToyNumber.Value - 1) then
                                local vu593 = nil
                                vu593 = vu47.ChildRemoved:Connect(function(p594)
                                    if p594 == pu592 then
                                        vu593:Disconnect()
                                    end
                                end)
                                vu51:FireServer(pu592.Body, pu592.Body.CFrame)
                                local v595 = pu592.Body:WaitForChild("PartOwner", 0.5)
                                pu592.DescendantAdded:Connect(function(p596)
                                    if p596.Name == "PartOwner" and p596.Value ~= vu46.Name then
                                        vu587(pu592)
                                        connection:Disconnect()
                                    end
                                end)
                                vu42:AddItem(connectio, 60)
                                if v595 and v595.Value == vu46.Name then
                                    local v597, v598, v599 = pairs(pu592:GetChildren())
                                    local v600 = vu593
                                    while true do
                                        local v601
                                        v599, v601 = v597(v598, v599)
                                        if v599 == nil then
                                            break
                                        end
                                        if v601:IsA("BasePart") then
                                            v601.CanCollide = false
                                        end
                                    end
                                    pu592:SetPrimaryPartCFrame(CFrame.new(- 72.9304581, - 3.96906614, - 265.543732))
                                    wait(0.2)
                                    local v602, v603, v604 = pairs(pu592:GetChildren())
                                    while true do
                                        local v605
                                        v604, v605 = v602(v603, v604)
                                        if v604 == nil then
                                            break
                                        end
                                        if v605:IsA("BasePart") then
                                            v605.Anchored = true
                                        end
                                    end
                                    table.insert(vu589, pu592)
                                    pu592.AncestryChanged:Connect(function()
                                        if not pu592.Parent then
                                            local v606, v607, v608 = ipairs(vu589)
                                            while true do
                                                local v609
                                                v608, v609 = v606(v607, v608)
                                                if v608 == nil then
                                                    break
                                                end
                                                if v609 == pu592 then
                                                    table.remove(vu589, v608)
                                                    break
                                                end
                                            end
                                        end
                                    end)
                                    v600:Disconnect()
                                else
                                    vu587(pu592)
                                end
                            end
                        end)
                        while true do
                            if vu46.CanSpawnToy and (vu46.CanSpawnToy.Value and # vu589 < _G.MaxMissiles) and vu577:FindFirstChild("Head") then
                                vu584(_G.ToyToLoad, vu577.Head.CFrame or vu577.HumanoidRootPart.CFrame)
                            end
                            vu39.Heartbeat:Wait()
                        end
                    end)
                    coroutine.resume(vu588)
                end
            else
                if vu588 then
                    coroutine.close(vu588)
                    vu588 = nil
                end
                if vu590 then
                    vu590:Disconnect()
                end
            end
        end
        local v611 = v69:AddSection({
            Name = "Explosions"
        })
        v611:AddToggle({
            Name = "Explosive Reload",
            Default = false,
            Callback = function(p612)
                vu610(p612)
            end
        })
        v611:AddSlider({
            Name = "Max Missile Count",
            Min = 1,
            Max = vu46.ToysLimitCap.Value / 10,
            ValueName = "Missiles",
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            Default = _G.MaxMissiles,
            Callback = function(p613)
                _G.MaxMissiles = p613
            end
        })
        v611:AddDropdown({
            Name = "Explosion Type",
            Default = "BombMissile",
            Options = {
                "BombMissile",
                "FireworkMissile"
            },
            Callback = function(p614)
                _G.ToyToLoad = p614
            end
        })
        local v615 = v69:AddSection({
            Name = "Settings"
        })
        local vu616 = false
        local function vu623(p617)
            if # vu589 ~= 0 then
                if not p617:IsA("Player") or p617.Character and p617.Character:FindFirstChild("HumanoidRootPart") then
                    for v618 = # vu589, 1, - 1 do
                        local v619 = table.remove(vu589, v618)
                        local v620 = {}
                        local v621 = {
                            Radius = 17.5,
                            TimeLength = 2,
                            Hitbox = v619.PartHitDetector,
                            ExplodesByFire = false,
                            MaxForcePerStudSquared = 225,
                            Model = v619,
                            ImpactSpeed = 100,
                            ExplodesByPointy = false,
                            DestroysModel = false
                        }
                        local v622
                        if p617:IsA("Player") then
                            v622 = p617.Character.HumanoidRootPart or p617
                        else
                            v622 = p617
                        end
                        v621.PositionPart = v622
                        v620[1] = v621
                        v620[2] = p617:IsA("Player") and p617.Character.HumanoidRootPart.Position or p617.Position
                        vu40:WaitForChild("BombEvents"):WaitForChild("BombExplode"):FireServer(unpack(v620))
                    end
                end
            else
                return
            end
        end
        local function vu625(p624)
            vu616 = true
            while vu616 do
                vu623(p624)
                wait(1)
            end
        end
        local function vu626()
            vu616 = false
        end
        local function vu629(pu627)
            if pu627:IsA("Player") then
                pu627.CharacterAdded:Connect(function(p628)
                    p628:WaitForChild("HumanoidRootPart")
                    if vu616 then
                        vu625(pu627)
                    end
                end)
            end
        end
        local vu630 = nil
        local vu631 = nil
        local vu632 = Workspace:WaitForChild("SpawnLocation")
        v615:AddDropdown({
            Name = "Target Type",
            Default = "Spawn",
            Options = {
                "Player",
                "Spawn"
            },
            Callback = function(p633)
                vu630 = p633
            end
        })
        dropdownLeft = v615:AddDropdown({
            Name = "Select Player",
            Default = "No players",
            Options = v576,
            Callback = function(p634)
                vu631 = vu45:FindFirstChild((vu77(p634)))
                if vu631 then
                    vu629(vu631)
                end
            end
        })
        v615:AddToggle({
            Name = "Explosion Target",
            Default = false,
            Callback = function(p635)
                if p635 then
                    if vu630 ~= "Player" or not vu631 then
                        if vu630 ~= "Spawn" then
                            local _ = vu630 ~= "Mouse"
                        else
                            vu625(vu632)
                        end
                    else
                        vu625(vu631)
                    end
                else
                    vu626()
                end
            end
        })
        local v636 = v71:AddSection({
            Name = "Set Home"
        })
        local v637 = v71:AddSection({
            Name = "Teleport Player"
        })
        local v638 = v71:AddSection({
            Name = "Change SpawnPoint"
        })
        local vu639 = {
            [vu44] = {
                position = Vector3.new(- 489.9737854003906, - 5.796535968780518, - 164.63966369628906),
                [vu43] = {
                    workspace.Plots.Plot2.PlotSign.Sign.Plus.PlusGrabPart,
                    CFrame.new(- 489.9737854003906, - 5.796535968780518, - 164.63966369628906) * CFrame.Angles(- 0.6975863575935364, 1.4022804498672485, 0.6905717253684998)
                }
            },
            ["Green Home"] = {
                position = Vector3.new(- 530.6627807617188, - 5.778287410736084, 90.25123596191406),
                [vu43] = {
                    workspace.Plots.Plot1.PlotSign.Sign.Plus.PlusGrabPart,
                    CFrame.new(- 530.6627807617188, - 5.778287410736084, 90.25123596191406) * CFrame.Angles(- 2.9858791828155518, 0.37637850642204285, 3.083956241607666)
                }
            },
            ["Dark Home"] = {
                position = Vector3.new(251.47413635253906, - 5.519055366516113, 461.3999938964844),
                [vu43] = {
                    workspace.Plots.Plot3.PlotSign.Sign.Plus.PlusGrabPart,
                    CFrame.new(251.47413635253906, - 5.519055366516113, 461.3999938964844) * CFrame.Angles(- 2.871713161468506, - 0.6465275287628174, - 2.976464033126831)
                }
            },
            ["China Home"] = {
                position = Vector3.new(554.2927856445312, 124.89682006835938, - 76.02223205566406),
                [vu43] = {
                    workspace.Plots.Plot5.PlotSign.Sign.Plus.PlusGrabPart,
                    CFrame.new(554.2927856445312, 124.89682006835938, - 76.02223205566406) * CFrame.Angles(- 0.6905589699745178, - 1.3879250288009644, - 0.6823156476020813)
                }
            },
            ["Blue Home"] = {
                position = Vector3.new(510.08648681640625, 84.84998321533203, - 343.2745056152344),
                [vu43] = {
                    workspace.Plots.Plot4.PlotSign.Sign.Plus.PlusGrabPart,
                    CFrame.new(510.08648681640625, 84.84998321533203, - 343.2745056152344) * CFrame.Angles(- 0.05313098803162575, - 1.0499050617218018, - 0.04609527811408043)
                }
            }
        }
        local vu640 = "Red Home"
        v636:AddDropdown({
            Name = "Select Home",
            Default = vu640,
            Options = {
                "Red Home",
                "Green Home",
                "Dark Home",
                "China Home",
                "Blue Home"
            },
            Callback = function(p641)
                vu640 = p641
            end
        })
        v636:AddButton({
            Name = "Set Home",
            Callback = function()
                local _ = vu46.Character.HumanoidRootPart.CFrame
                local v642 = vu639[vu640];
                (function(p643, p644)
                    if p643 and p643.Character and p643.Character:FindFirstChild("HumanoidRootPart") then
                        p643.Character.HumanoidRootPart.CFrame = p644
                    end
                end)(vu46, CFrame.new(v642.position))
                wait(1)
                game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(unpack(v642.args))
            end
        })
        local vu645 = nil
        vu74 = v637:AddDropdown({
            Name = "Select Player",
            Default = v576[1] or "No players",
            Options = v576,
            Callback = function(p646)
                vu645 = p646
            end
        })
        v637:AddButton({
            Name = "Tp Player",
            Callback = function()
                if vu645 then
                    local v647 = vu45:FindFirstChild((vu77(vu645)))
                    if v647 and v647.Character and v647.Character:FindFirstChild("HumanoidRootPart") then
                        vu46.Character.HumanoidRootPart.CFrame = v647.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, - 1)
                    end
                end
            end
        })
        local vu648 = {
            [vu44] = Vector3.new(- 489.973, - 5.796, - 164.639),
            ["Green Home"] = Vector3.new(- 530.662, - 5.778, 90.251),
            ["Dark Home"] = Vector3.new(251.474, - 5.519, 461.4),
            ["China Home"] = Vector3.new(554.293, 124.897, - 76.022),
            ["Blue Home"] = Vector3.new(510.086, 84.85, - 343.275)
        }
        v638:AddDropdown({
            Name = "Select",
            Default = vu640,
            Options = {
                "Red Home",
                "Green Home",
                "Dark Home",
                "China Home",
                "Blue Home"
            },
            Callback = function(p649)
                vu640 = p649
            end
        })
        local function vu653(p650)
            if vu648[vu640] then
                local vu651 = vu648[vu640]
                p650.CharacterAdded:Connect(function(p652)
                    p652:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(vu651)
                end)
            end
        end
        game.Players.PlayerAdded:Connect(function(p654)
            vu653(p654)
        end)
        game.Players.PlayerRemoving:Connect(function(p655)
            p655.RespawnLocation = nil
        end)
        v638:AddButton({
            Name = "Change SpawnPoint",
            Callback = function()
                local v656, v657, v658 = pairs(game.Players:GetPlayers())
                while true do
                    local v659
                    v658, v659 = v656(v657, v658)
                    if v658 == nil then
                        break
                    end
                    vu653(v659)
                end
            end
        })
        local v660 = v72:AddSection({
            Name = "Target All"
        })
        local v661 = v72:AddSection({
            Name = "WhiteList"
        })
        getgenv().whitelistFireAll = false
        local vu662 = nil
        local function vu664(p663)
            return p663:IsFriendsWith(vu45.LocalPlayer.UserId)
        end
        local function vu680()
            while true do
                local v678, v679 = pcall(function()
                    if vu47:FindFirstChild("Campfire") then
                        vu587(vu47:FindFirstChild("Campfire"))
                        wait(0.5)
                    end
                    vu584("Campfire", vu577.Head.CFrame)
                    local v665 = vu47:WaitForChild("Campfire")
                    local v666, v667, v668 = pairs(v665:GetChildren())
                    local v669 = nil
                    while true do
                        v668, vu670 = v666(v667, v668)
                        if v668 == nil then
                            break
                        end
                        if vu670.Name == "FirePlayerPart" then
                            vu670.Size = Vector3.new(10, 10, 10)
                        end
                    end
                    local vu670 = v669
                    local v671 = vu577.Torso.Position
                    vu51:FireServer(vu670, vu670.CFrame)
                    vu577:MoveTo(vu670.Position)
                    wait(0.3)
                    vu577:MoveTo(v671)
                    local v672 = Instance.new("BodyPosition")
                    v672.P = 20000
                    v672.Position = vu577.Head.Position + Vector3.new(0, 600, 0)
                    v672.Parent = v665.Main
                    local v673 = vu45
                    local v674, v675, v676 = pairs(v673:GetChildren())
                    pcall(function()
                        if not (whitelistFireAll and vu664(vu677)) then
                            if vu677.Character and (vu677.Character.HumanoidRootPart and vu677.Character ~= vu577) then
                                vu670.Position = vu677.Character.HumanoidRootPart.Position or vu677.Character.Head.Position
                                wait()
                            end
                        end
                    end)
                    local vu677
                    v676, vu677 = v674(v675, v676)
                    if v676 ~= nil then
                    else
                    end
                    wait()
                end)
                if not v678 then
                    warn("Error in fireAll: " .. tostring(v679))
                end
                wait()
            end
        end
        v660:AddToggle({
            Name = "Fire All",
            Default = false,
            Save = true,
            Callback = function(p681)
                if p681 then
                    vu662 = coroutine.create(vu680)
                    coroutine.resume(vu662)
                elseif vu662 then
                    coroutine.close(vu662)
                    vu662 = nil
                end
            end
        })
        v661:AddToggle({
            Name = "WhiteList Friends",
            Default = false,
            Save = true,
            Callback = function(p682)
                whitelistFireAll = p682
            end
        })
        getgenv().infLineStudsValue = 2
        v70:AddToggle({
            Name = "Infinite Line Extend",
            Default = false,
            Callback = function(p683)
                local vu684 = nil
                local vu685 = nil
                if p683 then
                    infLineConnection = workspace.ChildAdded:Connect(function(p686)
                        if p686.Name == "GrabParts" then
                            local vu687 = p686:FindFirstChild("DragPart"):FindFirstChild("DragAttach")
                            local vu688 = infLineStudsValue
                            local vu689 = 0
                            if vu687 then
                                infLineWheelConnection = game:GetService("UserInputService").InputChanged:Connect(function(p690)
                                    if p690.UserInputType == Enum.UserInputType.MouseWheel then
                                        if p690.Position.Z <= 0 then
                                            if p690.Position.Z < 0 then
                                                vu689 = vu689 - vu688
                                                vu685 = false
                                                vu684 = true
                                                while vu684 do
                                                    vu687.Position = workspace.CurrentCamera.CFrame.LookVector * vu689
                                                    wait()
                                                end
                                            end
                                        else
                                            vu689 = vu689 + vu688
                                            vu685 = true
                                            vu684 = false
                                            while vu685 do
                                                vu687.Position = workspace.CurrentCamera.CFrame.LookVector * vu689
                                                wait()
                                            end
                                        end
                                    end
                                end)
                            end
                        end
                    end)
                elseif infLineConnection then
                    infLineConnection:Disconnect()
                    infLineConnection = nil
                elseif infLineWheelConnection then
                    infLineWheelConnection:Disconnect()
                    infLineWheelConnection = nil
                end
            end
        })
        v70:AddSlider({
            Name = "Set Strength",
            Min = 1,
            Max = 15,
            ValueName = "",
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            Default = infLineStudsValue,
            Callback = function(p691)
                infLineStudsValue = p691
            end
        })
        local v692 = v70:AddSection({
            Name = "Line"
        })
        getgenv().CrazyLine = false
        v692:AddToggle({
            Name = "Crazy Line",
            Default = false,
            Callback = function(p693)
                CrazyLine = p693
                local function vu696(p694)
                    local v695 = {
                        p694.Character.HumanoidRootPart,
                        CFrame.new(- 1.00003052, 0.0255584717, - 0.467208862, 0.908731401, 0, 0.417381465, 0, 1, 0, - 0.417381465, 0, 0.908731401)
                    }
                    vu40.GrabEvents.CreateGrabLine:FireServer(unpack(v695))
                end
                local function vu699()
                    local v697 = vu45:GetPlayers()
                    if # v697 > 0 then
                        local v698 = v697[math.random(1, # v697)]
                        if v698 ~= vu45.LocalPlayer then
                            vu696(v698)
                        end
                    end
                end
                local function v700()
                    while CrazyLine do
                        vu699()
                        wait(0.01)
                    end
                end
                spawn(v700)
            end
        })
        getgenv().LineRBG = false
        v692:AddToggle({
            Name = "RBG LINE",
            Default = false,
            Callback = function(p701)
                LineRBG = p701
                while LineRBG do
                    local v702 = {
                        ColorSequence.new(Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)), Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
                    }
                    game:GetService("ReplicatedStorage").DataEvents.UpdateLineColorsEvent:FireServer(unpack(v702))
                    wait(0.01)
                end
            end
        })
        getgenv().invisline = false
        v692:AddToggle({
            Name = "Invisible Grab",
            Default = false,
            Callback = function(p703)
                invisline = p703
                while invisline do
                    wait(0.2)
                    game:GetService("ReplicatedStorage").GrabEvents.CreateGrabLine:FireServer()
                end
            end
        })
        local v704 = v70:AddSection({
            Name = "Client Lag"
        })
        local function vu708(p705)
            local v706 = p705.Character
            if v706 then
                v706 = p705.Character:FindFirstChild("Torso")
            end
            if v706 then
                local v707 = {
                    v706,
                    CFrame.new(- 0.170715332, 0.714402676, - 0.5, - 0.898518324, 0, 0.438936025, 5.23252517e-8, 1, 1.07111731e-7, - 0.438936025, 5.96046448e-8, - 0.898518324)
                }
                vu43:FireServer(unpack(v707))
            end
        end
        local function vu717(p709)
            local v710 = true
            local v711 = true
            while true do
                if v710 and v711 then
                    local v712 = vu45
                    local v713, v714, v715 = ipairs(v712:GetPlayers())
                    while true do
                        local v716
                        v715, v716 = v713(v714, v715)
                        if v715 == nil then
                            break
                        end
                        for _ = 1, p709 do
                            vu708(v716)
                        end
                    end
                end
                wait(0.001)
                wait(10)
                v711 = false
            end
        end
        local vu718 = nil
        v704:AddSlider({
            Name = "Lag",
            Min = 0,
            Max = 5000,
            Default = 0,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 10,
            ValueName = "Grabs",
            Callback = function(p719)
                vu718 = p719
            end
        })
        v704:AddToggle({
            Name = "Lag server",
            Default = false,
            Callback = function(p720)
                if p720 == true then
                    vu717(vu718)
                end
            end
        })
    end
end

vu721()
