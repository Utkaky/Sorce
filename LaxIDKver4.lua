local genv = getgenv()
local fenv = getfenv()

_G.IsUnloading = false

local _call7 = game:HttpGet('https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua'):gsub('Toggle:SetValue%(not Toggle%.Value%)', 'if Toggles.ToggleSound and Toggles.ToggleSound.Value then do local s=Instance.new("Sound")s.SoundId="rbxassetid://15675059323"s.Volume=0.5 s.Parent=game:GetService("SoundService")s:Play()s.Ended:Once(function()s:Destroy()end)end end Toggle:SetValue(not Toggle.Value)'):gsub('Library%.CornerRadius / 2', '10')

writefile('ObsidianModded1.lua', _call7)

local _10 = loadstring(_call7)()
local _14 = loadstring(game:HttpGet('https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua'))()
local _18 = loadstring(game:HttpGet('https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua'))()
local _call22 = game:GetService('ReplicatedStorage')

game:GetService('RunService')
game:GetService('Workspace')

local _call28 = game:GetService('UserInputService')

game:GetService('TweenService')

local _LocalPlayer31 = game:GetService('Players').LocalPlayer
local _Options32 = _10.Options
local _Toggles33 = _10.Toggles

_LocalPlayer31:GetMouse()

local _LocalPlayer37 = game.Players.LocalPlayer

fenv.plr = _LocalPlayer37

local _call39 = game:GetService('ReplicatedStorage')

fenv.rs = _call39
fenv.inv = workspace:WaitForChild(_LocalPlayer37.Name .. 'SpawnedInToys')
fenv.rs2 = game:GetService('RunService')
fenv.SetNetworkOwner = _call39.GrabEvents.SetNetworkOwner
fenv.DestroyGrabLine = _call39.GrabEvents.DestroyGrabLine
fenv.Whitelist = {}
fenv.WhiteListMode = false
fenv.AntiGrabTP_Active = false
fenv.AntiBananaT = false
fenv.AntiBlobUseT = false
fenv.AntiKickT = false
fenv.PcldOwner = function(_50, _50_2, _50_3, _50_4)
    task.spawn(function(_53, _53_2, _53_3, _53_4)
        task.wait(0.1)

        fenv.usedNames = {}

        for _56, _56_2 in pairs(workspace:GetChildren())do
            local _ = _56_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _60, _60_2 in pairs(workspace:GetChildren())do
            local _ = _60_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _64, _64_2 in pairs(workspace:GetChildren())do
            local _ = _64_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _68, _68_2 in pairs(workspace:GetChildren())do
            local _ = _68_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _72, _72_2 in pairs(workspace:GetChildren())do
            local _ = _72_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _76, _76_2 in pairs(workspace:GetChildren())do
            local _ = _76_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _80, _80_2 in pairs(workspace:GetChildren())do
            local _ = _80_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _84, _84_2 in pairs(workspace:GetChildren())do
            local _ = _84_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _88, _88_2 in pairs(workspace:GetChildren())do
            local _ = _88_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _92, _92_2 in pairs(workspace:GetChildren())do
            local _ = _92_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _96, _96_2 in pairs(workspace:GetChildren())do
            local _ = _96_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _100, _100_2 in pairs(workspace:GetChildren())do
            local _ = _100_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _104, _104_2 in pairs(workspace:GetChildren())do
            local _ = _104_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _108, _108_2 in pairs(workspace:GetChildren())do
            local _ = _108_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _112, _112_2 in pairs(workspace:GetChildren())do
            local _ = _112_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _116, _116_2 in pairs(workspace:GetChildren())do
            local _ = _116_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _120, _120_2 in pairs(workspace:GetChildren())do
            local _ = _120_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _124, _124_2 in pairs(workspace:GetChildren())do
            local _ = _124_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _128, _128_2 in pairs(workspace:GetChildren())do
            local _ = _128_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _132, _132_2 in pairs(workspace:GetChildren())do
            local _ = _132_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _136, _136_2 in pairs(workspace:GetChildren())do
            local _ = _136_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _140, _140_2 in pairs(workspace:GetChildren())do
            local _ = _140_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _144, _144_2 in pairs(workspace:GetChildren())do
            local _ = _144_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _148, _148_2 in pairs(workspace:GetChildren())do
            local _ = _148_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _152, _152_2 in pairs(workspace:GetChildren())do
            local _ = _152_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _156, _156_2 in pairs(workspace:GetChildren())do
            local _ = _156_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _160, _160_2 in pairs(workspace:GetChildren())do
            local _ = _160_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _164, _164_2 in pairs(workspace:GetChildren())do
            local _ = _164_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _168, _168_2 in pairs(workspace:GetChildren())do
            local _ = _168_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _172, _172_2 in pairs(workspace:GetChildren())do
            local _ = _172_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _176, _176_2 in pairs(workspace:GetChildren())do
            local _ = _176_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _180, _180_2 in pairs(workspace:GetChildren())do
            local _ = _180_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _184, _184_2 in pairs(workspace:GetChildren())do
            local _ = _184_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _188, _188_2 in pairs(workspace:GetChildren())do
            local _ = _188_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _192, _192_2 in pairs(workspace:GetChildren())do
            local _ = _192_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _196, _196_2 in pairs(workspace:GetChildren())do
            local _ = _196_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _200, _200_2 in pairs(workspace:GetChildren())do
            local _ = _200_2.Name
        end

        task.wait(0.1)

        fenv.usedNames = {}

        for _204, _204_2 in pairs(workspace:GetChildren())do
            error('internal 579: <25ms: infinitelooperror>')
        end
    end)
end

task.spawn(function(_208, _208_2, _208_3, _208_4)
    task.wait(0.1)

    fenv.usedNames = {}

    for _211, _211_2 in pairs(workspace:GetChildren())do
        local _ = _211_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _215, _215_2 in pairs(workspace:GetChildren())do
        local _ = _215_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _219, _219_2 in pairs(workspace:GetChildren())do
        local _ = _219_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _223, _223_2 in pairs(workspace:GetChildren())do
        local _ = _223_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _227, _227_2 in pairs(workspace:GetChildren())do
        local _ = _227_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _231, _231_2 in pairs(workspace:GetChildren())do
        local _ = _231_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _235, _235_2 in pairs(workspace:GetChildren())do
        local _ = _235_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _239, _239_2 in pairs(workspace:GetChildren())do
        local _ = _239_2.Name
    end

    task.wait(0.1)

    fenv.usedNames = {}

    for _243, _243_2 in pairs(workspace:GetChildren())do
        error('internal 579: <25ms: infinitelooperror>')
    end
end)

fenv.SpawnCFrame = function()
    local _DisplayName246 = _LocalPlayer37.DisplayName

    fenv.myDisplayName = _DisplayName246

    local _Name247 = _LocalPlayer37.Name

    fenv.myUserName = _Name247

    local _248 = string.format('[ %s ] ( @%s )', _DisplayName246, _Name247)

    fenv.myPOIdentifier = _248
    fenv.findMyPO = function(_249, _249_2, _249_3, _249_4, _249_5)
        error('internal 579: <25ms: infinitelooperror>')
    end

    workspace:FindFirstChild('CamPart')
    workspace:FindFirstChild('CamPart'):FindFirstChild('CamPart')

    local _Character257 = _LocalPlayer37.Character

    fenv.char = _Character257

    local _call261 = _Character257:FindFirstChild('CamPart'):Clone()

    _call261.Name = 'CamPart'
    _call261.Parent = workspace
    _call261.Transparency = 0.9
    fenv.lastHRPVelocity = Vector3.new(0, 0, 0)

    task.spawn(function(_266, _266_2) end)

    return _call261
end

local _DisplayName267 = _LocalPlayer37.DisplayName

fenv.myDisplayName = _DisplayName267

local _Name268 = _LocalPlayer37.Name

fenv.myUserName = _Name268

local _269 = string.format('[ %s ] ( @%s )', _DisplayName267, _Name268)

fenv.myPOIdentifier = _269
fenv.findMyPO = function(_270, _270_2, _270_3, _270_4, _270_5) end

workspace:FindFirstChild('CamPart')
workspace:FindFirstChild('CamPart'):FindFirstChild('CamPart')

local _Character277 = _LocalPlayer37.Character

fenv.char = _Character277

local _call281 = _Character277:FindFirstChild('CamPart'):Clone()

_call281.Name = 'CamPart'
_call281.Parent = workspace
_call281.Transparency = 0.9
fenv.lastHRPVelocity = Vector3.new(0, 0, 0)

task.spawn(function(_286, _286_2) end)

fenv.SCF = workspace.SpawnCF

local _call289 = _call22:WaitForChild('GrabEvents')

_call289:FindFirstChild('EndGrabEarly'):Destroy()

local _call295 = Instance.new('RemoteEvent')

_call295.Name = 'EndGrabEarly'
_call295.Parent = _call289

local _LocalPlayer298 = game:GetService('Players').LocalPlayer
local _ = _LocalPlayer298.Character
local _Character300 = _LocalPlayer298.Character

for _303, _303_2 in pairs(_Character300:GetChildren())do
    _303_2:IsA('BasePart')
    _303_2:IsA('BasePart')

    local _ = _303_2.Name

    _303_2:GetPropertyChangedSignal('Transparency'):Connect(function(_313, _313_2, _313_3, _313_4) end)

    local _ = _303_2.Transparency
end

_Character300.ChildAdded:Connect(function(_318, _318_2, _318_3) end)
_LocalPlayer298.CharacterAdded:Connect(function(_322, _322_2, _322_3, _322_4) end)
task.spawn(function(_325, _325_2, _325_3) end)

_G.AntiExplosionT = false

game:GetService('Workspace')

local _call329 = game:GetService('Players')
local _LocalPlayer330 = _call329.LocalPlayer

game:GetService('CoreGui')

local _call334 = game:GetService('CoreGui')

_call334:FindFirstChild('PCLD_ESP_Cache')
_call334.PCLD_ESP_Cache:Destroy()

local _call341 = Instance.new('Folder', _call334)

_call341.Name = 'PCLD_ESP_Cache'
fenv.Start_PLCD_ESP = function(_342, _342_2) end
fenv.Stop_PLCD_ESP = function(_343, _343_2, _343_3) end

_LocalPlayer330.CharacterAdded:Connect(function(_347, _347_2, _347_3, _347_4, _347_5, _347_6) end)
_LocalPlayer330.CharacterAdded:Connect(function(_351) end)

genv.AntiDeathT = false
fenv.AntiDeathF = function(_352, _352_2, _352_3, _352_4, _352_5) end

local _ = game.Players.LocalPlayer

game:GetService('ReplicatedStorage')
task.spawn(function() end)
workspace:WaitForChild('PlotItems'):WaitForChild('PlayersInPlots')

fenv.blobLoopT4 = false
fenv.BlobRelease = function(_364, _364_2, _364_3, _364_4, _364_5, _364_6, _364_7, _364_8) end
fenv.BlobGrab = function(_365, _365_2, _365_3, _365_4, _365_5, _365_6, _365_7, _365_8) end

local _call367 = game:GetService('RunService')

fenv.OwnerKickMODED = false
fenv.SitMODED = false
fenv.OnlyOwner = false
fenv.SkipOL = false
fenv.OLTPValue = Vector3.new(0, 20, 0)
fenv.loopPlayerBlobF4 = function(_370, _370_2, _370_3, _370_4, _370_5) end
fenv.masslessT = false
fenv.AntiBlobT = false
fenv.masslessF = function(_371, _371_2, _371_3, _371_4) end
fenv.AntiBlobF = function(_372, _372_2, _372_3) end
fenv.CheckBlob = function(_373, _373_2, _373_3, _373_4, _373_5, _373_6, _373_7, _373_8, _373_9) end
fenv.startRagdollWalk = function(_374) end

_call28.JumpRequest:Connect(function(_378) end)
_call367.Stepped:Connect(function() end)

local _ = Enum.KeyCode.X

_LocalPlayer31.CharacterAdded:Connect(function(_388, _388_2, _388_3, _388_4) end)
_call329.PlayerAdded:Connect(function(_392, _392_2, _392_3, _392_4, _392_5, _392_6) end)
_call329.PlayerRemoving:Connect(function(_396) end)

_10.ForceCheckbox = false

local _call400 = game:GetService('ReplicatedStorage')

game:GetService('RunService')
game:GetService('Workspace')

local _LocalPlayer405 = game:GetService('Players').LocalPlayer

CFrame.new(158, 261, 331)
_call400:WaitForChild('MenuToys'):WaitForChild('SpawnToyRemoteFunction')
_call400:WaitForChild('CharacterEvents'):WaitForChild('RagdollRemote')
_call400:WaitForChild('MenuToys'):FindFirstChild('DestroyToy')
_call400:WaitForChild('CharacterEvents'):WaitForChild('Struggle')
Color3.new()

local _ = _LocalPlayer405.Character

_LocalPlayer405.Character:WaitForChild('Humanoid', 5).Died:Connect(function(_433, _433_2, _433_3, _433_4) end)
_LocalPlayer405.CharacterAdded:Connect(function(_437, _437_2, _437_3, _437_4, _437_5) end)
task.spawn(function(_440, _440_2) end)

_G.ToggleGucciV12 = function(_441) end
_G.UnloadGucciV12 = function(_442, _442_2, _442_3, _442_4) end

local _call450 = _10:CreateWindow({
    SidebarCompacted = true,
    BackgroundImage = 'rbxassetid://113045155501434',
    CornerRadius = 20,
    SearchbarSize = UDim2.fromScale(0.5, 1),
    Title = '',
    Footer = 'Fling Things and people',
    IconSize = UDim2.fromOffset(30, 30),
    SidebarCompactWidth = 65,
    Icon = '123471792428526',
    Size = UDim2.fromOffset(960, 750),
})

for _456, _456_2 in ipairs(_10.ScreenGui:WaitForChild('Main'):GetChildren())do
    _456_2:IsA('ImageLabel')

    local _ = _456_2.ScaleType == Enum.ScaleType.Stretch
end

local _call464 = Instance.new('Sound')

_call464.SoundId = 'rbxassetid://137402801272072'
_call464.Volume = 3
_call464.Parent = game:GetService('SoundService')

_call464:Play()
_call464.Ended:Once(function(_472, _472_2, _472_3, _472_4) end)

local _call474 = _call450:AddTab({
    Description = 'player settings',
    Name = 'Main',
    Icon = 'user',
})
local _call476 = _call450:AddTab({
    Description = 'Target options',
    Name = 'Target',
    Icon = 'target',
})
local _call478 = _call450:AddTab({
    Description = 'keybinds',
    Name = 'Keybind',
    Icon = 'keyboard',
})
local _call480 = _call450:AddTab({
    Description = 'visual enhancements',
    Name = 'Visual',
    Icon = 'eye',
})
local _call482 = _call450:AddTab({
    Description = 'customize ui',
    Name = 'UI Settings',
    Icon = 'settings',
})
local _call484 = _call474:AddLeftGroupbox('Invisibility', 'shield')

_call484:AddDivider('Invisibility')
_call484:AddToggle('AntiGrab', {
    Text = 'Anti Grab',
    Default = false,
    Tooltip = 'Anti Grab',
})
_Toggles33.AntiGrab:OnChanged(function() end)

local _call494 = _call484:AddToggle('AntiGucci', {
    Text = 'Anti Auto Gucci',
    Default = false,
    Tooltip = 'Anti Gucci',
})

_call494:AddKeyPicker('AntiGucciKey', {
    Default = 'V',
    NoUI = false,
    SyncToggleState = true,
    Text = 'Anti Gucci Keybind',
    Mode = 'Toggle',
})
_Toggles33.AntiGucci:OnChanged(function(_500) end)

local _call502 = _call484:AddToggle('AntiLag', {
    Text = 'Anti Input Lag',
    Default = false,
    Tooltip = 'Anti Lag',
})

_call502:AddKeyPicker('AntiLagKey', {
    Default = 'C',
    NoUI = false,
    SyncToggleState = true,
    Text = 'Anti Lag Key',
    Mode = 'Toggle',
})
_Toggles33.AntiLag:OnChanged(function(_508, _508_2) end)

local _call510 = _call484:AddToggle('AntiBanana', {
    Text = 'Anti Banana',
    Default = false,
    Tooltip = 'AntiBanana',
})

_call510:AddKeyPicker('AntiBananaKey', {
    Default = 'B',
    NoUI = false,
    SyncToggleState = true,
    Text = 'Anti Banana Key',
    Mode = 'Toggle',
})
_Toggles33.AntiBanana:OnChanged(function(_516, _516_2, _516_3) end)
_call484:AddToggle('AntiBlob', {
    Text = 'Anti Blob',
    Default = false,
    Tooltip = 'Anti Blob',
})
_Toggles33.AntiBlob:OnChanged(function() end)
_call484:AddToggle('AntiExplode', {
    Text = 'Anti Explosion',
    Default = false,
    Tooltip = 'Anti Explosion',
})
_Toggles33.AntiExplode:OnChanged(function(_528, _528_2, _528_3, _528_4) end)
_call484:AddToggle('AntiFire', {
    Text = 'Anti Burn',
    Default = false,
    Tooltip = 'Anti Burn',
})
_Toggles33.AntiFire:OnChanged(function(_534) end)
_call484:AddToggle('AntiMassless', {
    Text = 'Anti Massless',
    Default = false,
    Tooltip = 'Anti Massless',
})
_Toggles33.AntiMassless:OnChanged(function(_540, _540_2, _540_3, _540_4, _540_5) end)
_call484:AddToggle('AntiSnowball', {
    Text = 'Anti Ragdoll',
    Default = false,
    Tooltip = 'Anti Snowball (Ragdoll Walk)',
})
_Toggles33.AntiSnowball:OnChanged(function(_546, _546_2) end)
_call484:AddToggle('AntiInPlot', {
    Text = 'Anti InPlot',
    Default = false,
    Tooltip = 'Reparent to SpawnedInToys',
})
_Toggles33.AntiInPlot:OnChanged(function(_552, _552_2, _552_3) end)
_call484:AddToggle('AntiReleaseToggle', {
    Default = false,
    Text = 'Anti Input',
})
_Toggles33.AntiReleaseToggle:OnChanged(function(_558, _558_2, _558_3, _558_4, _558_5) end)
_call484:AddToggle('AntiVoid', {
    Text = 'Anti Void',
    Default = false,
    Tooltip = 'Anti Void',
})
_Toggles33.AntiVoid:OnChanged(function(_564, _564_2, _564_3, _564_4, _564_5) end)
_call484:AddToggle('AntiLoop', {
    Text = 'Anti Loop',
    Default = false,
    Tooltip = 'Allows you to escape from group kills/kicks',
})
_Toggles33.AntiLoop:OnChanged(function(_570, _570_2, _570_3, _570_4, _570_5) end)

local _call572 = _call484:AddDependencyBox()

_call572:SetupDependencies({
    [1] = {
        [1] = _Toggles33.AntiLoop,
        [2] = true,
    },
})
_call572:AddSlider('AntiLoopRadius', {
    Min = 1,
    Default = 8,
    Max = 50000,
    Text = 'Radius',
    Rounding = 0,
})
_Options32.AntiLoopRadius:OnChanged(function() end)
_call572:AddSlider('AntiLoopSteps', {
    Min = 4,
    Default = 8,
    Max = 32,
    Text = 'Steps',
    Rounding = 0,
})
_Options32.AntiLoopSteps:OnChanged(function(_587, _587_2, _587_3, _587_4) end)
_call484:AddToggle('AntiKick', {
    Default = false,
    Text = 'Anti Kick',
})
_Toggles33.AntiKick:OnChanged(function(_593, _593_2) end)
_call484:AddDropdown('AntiKickType', {
    Text = 'Type',
    Values = {
        [1] = 'Break PLCD',
        [2] = 'Stick Part',
    },
    Default = 'Break PLCD',
})

local _call597 = _call474:AddLeftGroupbox('Entire', 'server')

_call597:AddDivider('Entire')

fenv.AntiBananaF = function(_600, _600_2, _600_3, _600_4, _600_5) end
fenv.AntiBlobUseF = function(_601, _601_2, _601_3) end

_call597:AddToggle('AntiHoldItem', {
    Text = 'Anti Hold Item',
    Default = false,
    Tooltip = 'Anti Hold Part Active',
})
_Toggles33.AntiHoldItem:OnChanged(function() end)
_call597:AddToggle('AntiGucciCrush', {
    Text = 'Anti Gucci/Crush',
    Default = false,
    Tooltip = 'Anti Vehicle Toy Active',
})
_Toggles33.AntiGucciCrush:OnChanged(function() end)
_call597:AddToggle('TouchKill', {
    Text = 'Touch Kill',
    Default = false,
    Tooltip = 'Touch Kill',
})
_Toggles33.TouchKill:OnChanged(function(_619, _619_2, _619_3, _619_4) end)

local _call621 = _call474:AddRightGroupbox('Local Player Settings', 'user')

_call621:AddDivider('Local Player Settings')
_call621:AddToggle('OceanWalk', {
    Default = false,
    Text = 'Ocean Walk',
})
_Toggles33.OceanWalk:OnChanged(function(_629, _629_2, _629_3) end)

local _call631 = _call621:AddToggle('TPWalk', {
    Default = false,
    Text = 'TP Walk',
})

_call631:AddKeyPicker('TPWalkKey', {
    Default = 'Q',
    NoUI = false,
    SyncToggleState = true,
    Text = 'TP Walk Keybind',
    Mode = 'Toggle',
})

local _call635 = _call621:AddDependencyBox()

_call635:SetupDependencies({
    [1] = {
        [1] = _Toggles33.TPWalk,
        [2] = true,
    },
})
_call635:AddSlider('TPWalkSpeed', {
    Min = 1,
    Default = 5,
    Max = 50,
    Text = 'TP Walk Speed',
    Rounding = 0,
})
_Toggles33.TPWalk:OnChanged(function(_644, _644_2, _644_3) end)
_call621:AddToggle('InfiniteJump', {
    Default = false,
    Text = 'Infinite Jump',
})
_Toggles33.InfiniteJump:OnChanged(function(_650, _650_2, _650_3) end)
_call621:AddToggle('Noclip', {
    Default = false,
    Text = 'Noclip',
})
_Toggles33.Noclip:OnChanged(function() end)

local _LocalPlayer661 = game:GetService('Players').LocalPlayer
local _ = workspace.CurrentCamera
local _ = CFrame.new(1, 0.5, 0) * CFrame.Angles(0, 1.5707963267948966, 0)

CFrame.new(1.6, 1, -0.15)
CFrame.new(1.5, 0.9, 0)
CFrame.new(1.2, 0.5, -0.5)
CFrame.new(1.5, 0.9, 0)
CFrame.Angles(1.5707963267948966, 0, 0)
_LocalPlayer661.CharacterAdded:Connect(function(_681, _681_2, _681_3, _681_4, _681_5) end)

local _ = _LocalPlayer661.Character
local _Character683 = _LocalPlayer661.Character

_Character683:FindFirstChild('Torso'):FindFirstChild('Right Shoulder')
_Character683:FindFirstChild('Left Arm')
_Character683:FindFirstChild('Right Arm')
_Character683:FindFirstChild('Head')
game:GetService('RunService').RenderStepped:Connect(function(_697, _697_2, _697_3, _697_4, _697_5) end)
workspace.DescendantAdded:Connect(function(_701, _701_2, _701_3, _701_4, _701_5, _701_6) end)

_G.ToggleRealisticFP = function(_702) end

_call621:AddToggle('RealisticOcean', {
    Text = 'Realistic Ocean',
    Default = false,
    Tooltip = 'Generates a realistic terrain ocean with 3D underwater sound',
})
_Toggles33.RealisticOcean:OnChanged(function(_708, _708_2, _708_3, _708_4) end)
_call621:AddToggle('RealisticFP', {
    Text = 'Realistic First Person',
    Default = true,
    Tooltip = 'Realistic arm tracking',
})
_Toggles33.RealisticFP:OnChanged(function() end)
_call621:AddButton({
    Text = 'Third Person',
    Func = function(_717, _717_2) end,
    Tooltip = 'You can Third Person!',
})

local _call719 = _call474:AddRightGroupbox('Target Detector', 'radar')

_call719:AddDivider('Target Detector')
_call719:AddToggle('TPDetectorToggle', {
    Callback = function(_724, _724_2, _724_3, _724_4) end,
    Text = 'Anti Cheater',
    Default = false,
    Tooltip = 'Anti Cheater',
})
_call719:AddToggle('SetOwnerToggle', {
    Callback = function(_727) end,
    Text = 'Anti Owner',
    Default = false,
    Tooltip = 'Anti Owner.',
})
_call719:AddToggle('SelectTargetCheck', {
    Callback = function(_730, _730_2, _730_3, _730_4) end,
    Text = 'Select Target check',
    Default = false,
    Tooltip = 'Select Target check',
})
_call719:AddDivider('Player State')

local _call734 = Instance.new('Frame')

_call734.Size = UDim2.new(1, 0, 0, 75)
_call734.BackgroundTransparency = 1
_call734.Parent = _call719.Container

_call719:AddLabel('Enemy: Waiting...')
_call719:AddLabel('Health: -')
_call719:AddLabel('Status: -')
_call719:AddLabel('Location: -')
_call719:AddLabel('Local Owner : None')
_call719:AddLabel('Packet Owner : 0')
_call719:AddLabel("Enemy's Owner : None")

_G.UpdateHackerUI = function(_753, _753_2, _753_3, _753_4) end

_call367.Heartbeat:Connect(function() end)
_call329.PlayerRemoving:Connect(function(_761) end)

local _call763 = _call478:AddLeftGroupbox('Keybinds', 'keyboard')

_call763:AddToggle('ClickTP', {
    Text = 'Click TP - X',
    Default = false,
    Tooltip = 'Press the X key and aim with the crosshair',
})
_Toggles33.ClickTP:OnChanged(function(_769, _769_2, _769_3) end)
_call763:AddToggle('LoopGrab', {
    Text = 'Loop Grab - F',
    Default = false,
    Tooltip = 'If your opponent is within 20 studs/within your crosshair, press F to lock on.',
})
_Toggles33.LoopGrab:OnChanged(function() end)
_call763:AddToggle('CameraZoom', {
    Text = 'Camera Zoom - Z',
    Default = false,
    Tooltip = 'You can use it by pressing the Z key and rolling the mouse wheel',
})
_Toggles33.CameraZoom:OnChanged(function(_781, _781_2) end)

local _call783 = _call476:AddLeftGroupbox('Loop Functions', 'maximize')

for _786, _786_2 in pairs(_call329:GetPlayers())do
    local _ = _786_2 == _LocalPlayer31
    local _ = '(' .. _786_2.DisplayName .. ')' .. _786_2.Name
end

_call783:AddDropdown('SpamTarget', {
    Values = {[1] = _792},
    Tooltip = 'Select Target Player!',
    Multi = false,
    Text = 'Select Target',
    Default = 1,
})
_Options32.SpamTarget:OnChanged(function(_798, _798_2) end)
_call783:AddLabel('Crosshair Select Target'):AddKeyPicker('CrosshairKey', {
    Default = 'T',
    NoUI = false,
    SyncToggleState = false,
    Text = 'Crosshair Select Target',
    Mode = 'Hold',
})
_call28.InputBegan:Connect(function(_806, _806_2, _806_3) end)
_call783:AddDivider('Loop Functions')
_call783:AddSlider('SpamPosX', {
    Min = -43,
    Default = 0,
    Compact = false,
    Max = 43,
    Text = 'Position X',
    Rounding = 0,
})
_Options32.SpamPosX:OnChanged(function(_814, _814_2, _814_3) end)
_call783:AddSlider('SpamPosY', {
    Min = -43,
    Default = -4,
    Compact = false,
    Max = 43,
    Text = 'Position Y',
    Rounding = 0,
})
_Options32.SpamPosY:OnChanged(function(_820, _820_2, _820_3, _820_4) end)
_call783:AddSlider('SpamPosZ', {
    Min = -43,
    Default = 0,
    Compact = false,
    Max = 43,
    Text = 'Position Z',
    Rounding = 0,
})
_call783:AddToggle('LoopKickV1', {
    Text = 'Kick Loop VI(Regular)',
    Default = false,
    Tooltip = 'It is a standard kick loop.',
})
_Toggles33.LoopKickV1:OnChanged(function(_828, _828_2, _828_3, _828_4, _828_5) end)
_call783:AddToggle('LoopKick', {
    Text = 'Kick Loop VII(Slient)',
    Default = false,
    Tooltip = 'To use this at 100%, your ping needs to be good.',
})
_Toggles33.LoopKick:OnChanged(function(_834, _834_2, _834_3, _834_4, _834_5) end)
game:GetService('ReplicatedStorage')
game:GetService('RunService')
workspace:WaitForChild(game:GetService('Players').LocalPlayer.Name .. 'SpawnedInToys')
workspace:WaitForChild('PlotItems'):WaitForChild('PlayersInPlots')
Vector3.new(0, 20, 0)
_call783:AddToggle('LoopKickV8', {
    Text = 'Kick Loop VIII(Slient)',
    Default = false,
    Tooltip = 'It\u{2019}s generally not recommended unless your ping is extremely good.',
})
_Toggles33.LoopKickV8:OnChanged(function(_857, _857_2, _857_3) end)
_call783:AddToggle('RagdollSpam', {
    Text = 'Loop Ragdoll',
    Default = false,
    Tooltip = 'Spam Ragdoll',
})
_Toggles33.RagdollSpam:OnChanged(function(_863, _863_2, _863_3, _863_4) end)
_call783:AddDivider()
_call476:AddRightGroupbox('Target List', 'users'):AddDropdown('BlobmanTarget', {
    Values = {[1] = _792},
    Tooltip = 'Select Target Player!',
    Multi = false,
    Text = 'Select Target',
    Default = 1,
})
_Options32.BlobmanTarget:OnChanged(function(_873, _873_2) end)

local _call875 = _call476:AddRightGroupbox('Target Functions', 'swords')

_call875:AddToggle('LoopTargetToggle', {
    Text = 'Loop Target Type',
    Default = false,
    Tooltip = 'Toggle Loop Target',
})
_call875:AddDropdown('LoopTargetDropdown', {
    Text = 'Type',
    Multi = false,
    Values = {
        [1] = 'Loop kill/Blobman',
        [2] = 'Loop kill/Owner',
        [3] = 'Loop Kick /Owner',
        [4] = 'Loop Kick/bypass/blobman',
        [5] = 'Loop Lock/Blobman',
        [6] = 'Loop kill/Desync',
    },
    Default = 1,
})
_call875:AddButton({
    Text = 'Kick All Players',
    Func = function(_882, _882_2, _882_3) end,
    Tooltip = 'Kick everyone on the server',
})
_call875:AddToggle('FriendWhitelistToggle', {
    Text = 'Whitelist',
    Default = false,
    Tooltip = 'Exclude friends',
})
_Toggles33.FriendWhitelistToggle:OnChanged(function(_888) end)
_Options32.LoopTargetDropdown:OnChanged(function(_892, _892_2, _892_3) end)
_Toggles33.LoopTargetToggle:OnChanged(function(_896, _896_2, _896_3) end)
_call480:AddLeftGroupbox('ESP', 'eye'):AddToggle('PLCDESP', {
    Text = 'PCLD ESP',
    Default = false,
    Tooltip = 'PlayerCharacterLocationDetector ESP',
})
_Toggles33.PLCDESP:OnChanged(function(_904) end)

local _call906 = _call482:AddLeftGroupbox('Menu', 'wrench')

_call329.PlayerRemoving:Connect(function(_910) end)
_call906:AddDropdown('BackgroundSelect', {
    Text = 'Background Image',
    Values = {
        [1] = 'Default',
        [2] = 'Mir Edition',
        [3] = 'Ian Edition',
        [4] = 'Mountain Edition',
        [5] = 'Minecraft Edition',
    },
    Default = 'Default',
})
_Options32.BackgroundSelect:OnChanged(function(_916) end)
_call906:AddToggle('KickAlarm', {
    Text = 'Kick Alarm',
    Default = true,
    Tooltip = 'Kick Alarm!',
})
_Toggles33.KickAlarm:OnChanged(function(_922, _922_2) end)
_call906:AddToggle('ShowKeybinds', {
    Default = false,
    Text = 'Show Keybind Menu',
})
_call906:AddToggle('ToggleSound', {
    Default = true,
    Text = 'Toggle Sound Effect',
})
_Toggles33.ShowKeybinds:OnChanged(function(_930, _930_2, _930_3, _930_4) end)
_call906:AddLabel('Menu Keybind'):AddKeyPicker('MenuKeybind', {
    NoUI = true,
    Default = 'RightShift',
    Text = 'Menu keybind',
})
_call906:AddButton({
    Func = function() end,
    Text = 'Unload',
})

_10.ToggleKeybind = _Options32.MenuKeybind

_14:SetLibrary(_10)
_18:SetLibrary(_10)
_18:IgnoreThemeSettings()
_18:SetIgnoreIndexes({
    [1] = 'MenuKeybind',
})
_14:SetFolder('FlingThings')
_18:SetFolder('FlingThings/configs')
_18:BuildConfigSection(_call482)
_14:ApplyToTab(_call482)
task.spawn(function(_957, _957_2) end)
_10:Notify({
    Time = 3,
    Title = 'Fling Things And People',
    Description = 'LAX HUB',
})
