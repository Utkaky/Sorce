-- ts file was generated at discord.gg/25ms


local vu1 = game:GetService("Players")
local vu2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
local vu4 = game:GetService("RunService")
local vu5 = vu1.LocalPlayer
local v6 = vu5
local vu7 = vu5.GetMouse(v6)
local vu8 = false
local vu9 = 4
local vu10 = 1.5
local function vu15(pu11)
    local vu12 = pu11.RootPart
    if vu12 then
        vu2.GrabEvents.SetNetworkOwner:FireServer(vu12, vu12.CFrame)
        pu11.Sit = true
        pu11.WalkSpeed = 0
        local vu13 = vu5.Character
        if vu13 then
            vu13 = vu5.Character:FindFirstChild("HumanoidRootPart")
        end
        if vu13 then
            vu12.CFrame = vu13.CFrame * CFrame.new(0, vu9, - vu10)
        end
        local vu14 = nil
        vu14 = vu4.Heartbeat:Connect(function()
            if pu11.Parent and vu8 then
                vu12.Velocity = Vector3.zero
                if vu13 then
                    vu12.CFrame = vu13.CFrame * CFrame.new(0, vu9, - vu10)
                end
            else
                vu14:Disconnect()
            end
        end)
    end
end
local function vu21(p16)
    if p16 and p16.Character then
        local v17 = p16.Character:FindFirstChildOfClass("Humanoid")
        local vu18 = p16.Character:FindFirstChild("HumanoidRootPart")
        local v19 = vu5.Character
        if v19 then
            v19 = vu5.Character:FindFirstChild("HumanoidRootPart")
        end
        if v17 and (vu18 and v19) then
            local v20 = v19.CFrame
            v19.CFrame = vu18.CFrame * CFrame.new(0, 3, 0)
            task.wait(0.125)
            vu15(v17)
            task.wait(0.24)
            v19.CFrame = v20
            vu18.CFrame = v20 * CFrame.new(0, vu9, - vu10)
            task.delay(2, function()
                vu2.GrabEvents.DestroyGrabLine:FireServer(vu18)
            end)
            vu8 = false
        else
            vu8 = false
        end
    else
        vu8 = false
    end
end
v3.InputBegan:Connect(function(p22, p23)
    if not p23 and (p22.KeyCode == Enum.KeyCode.Y and not vu8) then
        vu8 = true
        local v24 = nil
        local v25 = Ray.new(vu7.Origin.Position, vu7.UnitRay.Direction * 9999)
        local v26 = workspace:FindPartOnRay(v25, vu5.Character)
        local v27
        if v26 and v26.Parent then
            v27 = vu1:GetPlayerFromCharacter(v26.Parent)
            if v27 then
                if v27 == vu5 then
                    v27 = v24
                end
            else
                v27 = v24
            end
        else
            v27 = v24
        end
        if v27 then
            vu21(v27)
        else
            vu8 = false
        end
    end
end)
local vu28 = game:GetService("Players")
local vu29 = game:GetService("ReplicatedStorage")
local vu30 = game:GetService("RunService")
game:GetService("UserInputService")
local vu31 = vu28.LocalPlayer
local vu32 = false
local vu33 = false
local vu34 = false
local vu35 = false
local vu36 = false
local vu37 = nil
local vu38 = 4
local vu39 = 4
local vu40 = 70
local vu41 = nil
local vu42 = {}
local vu43 = 1
_G.WhitelistedPlayers = _G.WhitelistedPlayers or {}
local vu44 = nil
local vu45 = loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/verbal%20hub%20v2%20orion", true))()
local v46 = vu45
local v47 = vu45.MakeWindow(v46, {
    Name = "Verbal Hub v3 Ftap",
    HidePremium = false,
    SaveConfig = true,
    IntroEnabled = true,
    IntroText = "Welcome To Verbal Hub V3 Ftap",
    IntroIcon = "rbxassetid://112374567322808",
    ConfigFolder = "Verbal Config"
})
local v48 = v47:MakeTab({
    Name = "Player Controls",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local v49 = v47:MakeTab({
    Name = "Whitelist",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local function vu69(p50)
    if vu32 then
        return
    else
        vu32 = true
        local v51 = vu31.Character
        if v51 then
            v51 = vu31.Character:FindFirstChild("HumanoidRootPart")
        end
        if v51 then
            vu41 = v51.CFrame
            local v52, v53, v54 = ipairs(vu42)
            while true do
                local v55
                v54, v55 = v52(v53, v54)
                if v54 == nil then
                    break
                end
                if v55.connection then
                    v55.connection:Disconnect()
                end
            end
            vu42 = {}
            local v56, v57, v58 = ipairs(p50)
            while true do
                local v59
                v58, v59 = v56(v57, v58)
                if v58 == nil then
                    break
                end
                if v59 and v59.Character then
                    local vu60 = v59.Character:FindFirstChild("HumanoidRootPart")
                    local vu61 = v59.Character:FindFirstChildOfClass("Humanoid")
                    if vu60 and (vu61 and v59 ~= vu31) then
                        local v62 = vu60.CFrame
                        v51.CFrame = vu60.CFrame * CFrame.new(0, 3, 0)
                        task.wait(0.2)
                        vu29.GrabEvents.SetNetworkOwner:FireServer(vu60, v62)
                        vu61.Sit = true
                        vu61.WalkSpeed = 0
                        task.wait(0.1)
                        local vu63
                        if vu33 then
                            local v64 = Vector3.new(0, 0, 0)
                            for v65 = 1, v58 - 1 do
                                local v66 = vu42[v65]
                                if v66 then
                                    if v66.root then
                                        v64 = v64 + Vector3.new(0, vu39, 0)
                                    end
                                end
                            end
                            vu63 = vu41 * CFrame.new(0, vu39, 0) * CFrame.new(v64)
                        else
                            vu63 = vu41 * CFrame.new(math.random(- 5, 5), vu38, math.random(- 5, 5))
                        end
                        vu60.CFrame = vu63
                        local vu67 = nil
                        vu67 = vu30.Heartbeat:Connect(function()
                            if vu32 and vu61.Parent then
                                vu60.Velocity = Vector3.zero
                                vu60.CFrame = vu63
                            elseif vu67 then
                                vu67:Disconnect()
                            end
                        end)
                        local v68 = {
                            root = vu60,
                            connection = vu67,
                            humanoid = vu61
                        }
                        table.insert(vu42, v68)
                    end
                end
            end
            task.wait(0.1)
            v51.CFrame = vu41
            vu32 = false
        else
            vu32 = false
        end
    end
end
local function vu83()
    while vu35 do
        if vu37 ~= "whitelist" then
            if vu37 ~= "nearby" then
                if vu37 == "all" and vu34 then
                    vu69(vu28:GetPlayers())
                end
            else
                local v70 = {}
                local v71 = vu31.Character
                if v71 then
                    v71 = vu31.Character:FindFirstChild("HumanoidRootPart")
                end
                if v71 then
                    local v72 = vu28
                    local v73, v74, v75 = ipairs(v72:GetPlayers())
                    while true do
                        local v76
                        v75, v76 = v73(v74, v75)
                        if v75 == nil then
                            break
                        end
                        if v76 ~= vu31 and v76.Character then
                            local v77 = v76.Character:FindFirstChild("HumanoidRootPart")
                            if v77 and (v71.Position - v77.Position).Magnitude <= vu40 then
                                table.insert(v70, v76)
                            end
                        end
                    end
                end
                vu69(v70)
            end
        else
            local v78, v79, v80 = pairs(_G.WhitelistedPlayers)
            local v81 = {}
            while true do
                v80 = v78(v79, v80)
                if v80 == nil then
                    break
                end
                local v82 = vu28:FindFirstChild(v80)
                if v82 then
                    table.insert(v81, v82)
                end
            end
            vu69(v81)
        end
        task.wait(vu43)
    end
end
local function vu88()
    local v84, v85, v86 = ipairs(vu42)
    while true do
        local v87
        v86, v87 = v84(v85, v86)
        if v86 == nil then
            break
        end
        if v87.root and v87.humanoid then
            if v87.connection then
                v87.connection:Disconnect()
            end
            vu29.GrabEvents.SetNetworkOwner:FireServer(v87.root, v87.root.CFrame)
            v87.humanoid.Sit = false
            v87.humanoid.WalkSpeed = 16
            v87.root.Velocity = Vector3.new(0, 50, 0)
        end
    end
    vu42 = {}
end
v48:AddToggle({
    Name = "Stack Up Mode",
    Default = false,
    Callback = function(p89)
        vu33 = p89
        if not vu33 then
            vu88()
        end
    end
})
v48:AddToggle({
    Name = "Loop Bring Mode",
    Default = false,
    Callback = function(p90)
        vu35 = p90
        if vu35 then
            vu83()
        else
            vu37 = nil
            vu88()
        end
    end
})
v48:AddSlider({
    Name = "Loop Bring Delay",
    Min = 0.5,
    Max = 10,
    Default = 1,
    Color = Color3.fromRGB(255, 165, 0),
    Increment = 0.1,
    ValueName = "Seconds",
    Callback = function(p91)
        vu43 = p91
    end
})
v48:AddToggle({
    Name = "Bring All Mode(use bring all button or loop toggle to use this)",
    Default = false,
    Callback = function(p92)
        vu34 = p92
        if vu34 then
            vu37 = "all"
        else
            vu37 = nil
            if not vu35 then
                vu88()
            end
        end
    end
})
v48:AddToggle({
    Name = "Nearby Bring Mode",
    Default = false,
    Callback = function(p93)
        vu36 = p93
        if vu36 then
            vu37 = "nearby"
        else
            vu37 = nil
            if not vu35 then
                vu88()
            end
        end
    end
})
v48:AddButton({
    Name = "Grab & Stack Whitelisted",
    Callback = function()
        vu37 = "whitelist"
        local v94, v95, v96 = pairs(_G.WhitelistedPlayers)
        local v97 = {}
        while true do
            v96 = v94(v95, v96)
            if v96 == nil then
                break
            end
            local v98 = vu28:FindFirstChild(v96)
            if v98 then
                table.insert(v97, v98)
            end
        end
        vu69(v97)
    end
})
v48:AddButton({
    Name = "Bring All Players",
    Callback = function()
        if vu34 then
            vu37 = "all"
            vu69(vu28:GetPlayers())
        else
            vu45:MakeNotification({
                Name = "Bring All Disabled",
                Content = "Enable \'Bring All Mode\' toggle to use this.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})
local vu100 = v49:AddDropdown({
    Name = "Select a Player to Whitelist",
    Options = {},
    Callback = function(p99)
        vu44 = p99:match("^(.-) %(") or p99
    end
})
local vu102 = v49:AddDropdown({
    Name = "Whitelisted Players",
    Options = {},
    Callback = function(p101)
        vu44 = p101:match("^(.-) %(") or p101
    end
})
local function vu107()
    local v103, v104, v105 = pairs(_G.WhitelistedPlayers)
    local v106 = {}
    while true do
        v105 = v103(v104, v105)
        if v105 == nil then
            break
        end
        table.insert(v106, v105)
    end
    vu102:Refresh(v106, true)
end
local function vu115()
    local v108 = vu28
    local v109, v110, v111 = ipairs(v108:GetPlayers())
    local v112 = {}
    while true do
        local v113
        v111, v113 = v109(v110, v111)
        if v111 == nil then
            break
        end
        if v113 ~= vu31 and not _G.WhitelistedPlayers[v113.Name] then
            local v114 = v113.Name .. " (" .. v113.DisplayName .. ")"
            table.insert(v112, v114)
        end
    end
    vu100:Refresh(v112, true)
end
local function vu116()
    vu44 = nil
end
vu28.PlayerAdded:Connect(function(_)
    vu115()
end)
vu28.PlayerRemoving:Connect(function(p117)
    if _G.WhitelistedPlayers[p117.Name] then
        _G.WhitelistedPlayers[p117.Name] = nil
    end
    vu115()
    vu107()
    vu116()
end)
vu115()
vu107()
v49:AddButton({
    Name = "Add to Whitelist",
    Callback = function()
        if vu44 and not _G.WhitelistedPlayers[vu44] then
            _G.WhitelistedPlayers[vu44] = true
            vu107()
            vu115()
        end
    end
})
v49:AddButton({
    Name = "Remove from Whitelist",
    Callback = function()
        if vu44 and _G.WhitelistedPlayers[vu44] then
            _G.WhitelistedPlayers[vu44] = nil
            vu107()
            vu115()
        end
    end
})
v48:AddBind({
    Name = "Teleport and Grab",
    Default = Enum.KeyCode.Y,
    Hold = false,
    Callback = function()
        local v118 = vu31
        if v118 and v118.Character then
            local v119 = v118:GetMouse().Target
            local v120 = v119 and v119.Parent and vu28:GetPlayerFromCharacter(v119.Parent)
            if v120 then
                vu69({
                    v120
                })
            end
        end
    end
})
local v121 = vu45
vu45.Init(v121)
