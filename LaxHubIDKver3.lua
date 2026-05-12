 genv = getgenv()
 fenv = getfenv()
 _call5 = game:HttpGet('https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua'):gsub('Toggle:SetValue%(not Toggle%.Value%)', 'if Toggles.ToggleSound and Toggles.ToggleSound.Value then do local s=Instance.new("Sound")s.SoundId="rbxassetid://15675059323"s.Volume=0.5 s.Parent=game:GetService("SoundService")s:Play()s.Ended:Once(function()s:Destroy()end)end end Toggle:SetValue(not Toggle.Value)')

writefile('ObsidianModded2.lua', _call5)

 _8 = loadstring(_call5)()
 _12 = loadstring(game:HttpGet('https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua'))()
 _16 = loadstring(game:HttpGet('https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua'))()
 _call18 = game:GetService('Players')
 _call20 = game:GetService('ReplicatedStorage')

game:GetService('RunService')

 _call24 = game:GetService('Workspace')

game:GetService('TweenService')

 _LocalPlayer29 = _call18.LocalPlayer
 _Options30 = _8.Options
 _Toggles31 = _8.Toggles

_LocalPlayer29:GetMouse()

 _call35 = _call20:WaitForChild('GrabEvents')

_call35:FindFirstChild('EndGrabEarly'):Destroy()

 _call41 = Instance.new('RemoteEvent')

_call41.Name = 'EndGrabEarly'
_call41.Parent = _call35

_call24.ChildAdded:Connect(function(_45, _45_2, _45_3, _45_4) end)

genv.AntiDeathT = false
fenv.AntiDeathF = function(_46)
    workspace:WaitForChild(game:GetService('Players').LocalPlayer.Name .. 'SpawnedInToys')
    game:GetService('ReplicatedStorage')
    game:GetService('RunService').Heartbeat:Connect(function(_61, _61_2)
         _ = fenv.AntiDeathT

        error("line 1: attempt to index nil with 'Disconnect'")
    end)
end

task.spawn(function(_65, _65_2, _65_3, _65_4, _65_5)
    task.wait()

     _ = _Toggles31.AntiBurn
     _ = _Toggles31.AntiBurn.Value
     _ExtinguishPart72 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
     _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart72.Transparency = 1
    _ExtinguishPart72.CastShadow = false
    _ExtinguishPart72.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart72:FindFirstChild('Tex')

     _Tex81 = _ExtinguishPart72.Tex

    _Tex81.Transparency = 1

     _CFrame84 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart72.CFrame = _CFrame84

    task.wait()

    _ExtinguishPart72.CFrame = (_CFrame84 * CFrame.new(0, 3, 0))

    task.wait()

     _ = _Toggles31.AntiBurn
     _ = _Toggles31.AntiBurn.Value
     _ExtinguishPart94 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
     _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart94.Transparency = 1
    _ExtinguishPart94.CastShadow = false
    _ExtinguishPart94.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart94:FindFirstChild('Tex')

    local _Tex103 = _ExtinguishPart94.Tex

    _Tex103.Transparency = 1

    local _CFrame106 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart94.CFrame = _CFrame106

    task.wait()

    _ExtinguishPart94.CFrame = (_CFrame106 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart116 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart116.Transparency = 1
    _ExtinguishPart116.CastShadow = false
    _ExtinguishPart116.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart116:FindFirstChild('Tex')

    local _Tex125 = _ExtinguishPart116.Tex

    _Tex125.Transparency = 1

    local _CFrame128 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart116.CFrame = _CFrame128

    task.wait()

    _ExtinguishPart116.CFrame = (_CFrame128 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart138 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart138.Transparency = 1
    _ExtinguishPart138.CastShadow = false
    _ExtinguishPart138.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart138:FindFirstChild('Tex')

    local _Tex147 = _ExtinguishPart138.Tex

    _Tex147.Transparency = 1

    local _CFrame150 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart138.CFrame = _CFrame150

    task.wait()

    _ExtinguishPart138.CFrame = (_CFrame150 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart160 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart160.Transparency = 1
    _ExtinguishPart160.CastShadow = false
    _ExtinguishPart160.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart160:FindFirstChild('Tex')

    local _Tex169 = _ExtinguishPart160.Tex

    _Tex169.Transparency = 1

    local _CFrame172 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart160.CFrame = _CFrame172

    task.wait()

    _ExtinguishPart160.CFrame = (_CFrame172 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart182 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart182.Transparency = 1
    _ExtinguishPart182.CastShadow = false
    _ExtinguishPart182.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart182:FindFirstChild('Tex')

    local _Tex191 = _ExtinguishPart182.Tex

    _Tex191.Transparency = 1

    local _CFrame194 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart182.CFrame = _CFrame194

    task.wait()

    _ExtinguishPart182.CFrame = (_CFrame194 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart204 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart204.Transparency = 1
    _ExtinguishPart204.CastShadow = false
    _ExtinguishPart204.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart204:FindFirstChild('Tex')

    local _Tex213 = _ExtinguishPart204.Tex

    _Tex213.Transparency = 1

    local _CFrame216 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart204.CFrame = _CFrame216

    task.wait()

    _ExtinguishPart204.CFrame = (_CFrame216 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart226 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart226.Transparency = 1
    _ExtinguishPart226.CastShadow = false
    _ExtinguishPart226.Size = Vector3.new(0, 0, 0)

    _ExtinguishPart226:FindFirstChild('Tex')

    local _Tex235 = _ExtinguishPart226.Tex

    _Tex235.Transparency = 1

    local _CFrame238 = _LocalPlayer29.Character.Head.CFrame

    _ExtinguishPart226.CFrame = _CFrame238

    task.wait()

    _ExtinguishPart226.CFrame = (_CFrame238 * CFrame.new(0, 3, 0))

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ = _call24.Map.Hole.PoisonSmallHole
    local _ = _call24.Map.Hole

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart328 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart328.Transparency = 1
    _ExtinguishPart328.CastShadow = false
    _ExtinguishPart328.Size = Vector3.new(0, 0, 0)

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart402 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart402.Transparency = 1
    _ExtinguishPart402.CastShadow = false
    _ExtinguishPart402.Size = Vector3.new(0, 0, 0)

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart476 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart476.Transparency = 1
    _ExtinguishPart476.CastShadow = false
    _ExtinguishPart476.Size = Vector3.new(0, 0, 0)

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart550 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart550.Transparency = 1
    _ExtinguishPart550.CastShadow = false
    _ExtinguishPart550.Size = Vector3.new(0, 0, 0)

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart624 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart624.Transparency = 1
    _ExtinguishPart624.CastShadow = false
    _ExtinguishPart624.Size = Vector3.new(0, 0, 0)

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value
    local _ExtinguishPart698 = _call24.Map.Hole.PoisonSmallHole.ExtinguishPart
    local _ = _LocalPlayer29.Character

    _LocalPlayer29.Character:FindFirstChild('Head')

    _ExtinguishPart698.Transparency = 1
    _ExtinguishPart698.CastShadow = false
    _ExtinguishPart698.Size = Vector3.new(0, 0, 0)

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn.Value

    task.wait()

    local _ = _Toggles31.AntiBurn
    local _ = _Toggles31.AntiBurn

    error('internal 579: <25ms: infinitelooperror>')
end)

local _ = game.Players.LocalPlayer

game:GetService('ReplicatedStorage')
task.spawn(function(_775) end)
workspace:WaitForChild('PlotItems'):WaitForChild('PlayersInPlots')

fenv.blobLoopT4 = false
fenv.BlobRelease = function(_780, _780_2, _780_3) end
fenv.BlobGrab = function(_781, _781_2, _781_3) end
fenv.OwnerKickMODED = false
fenv.SitMODED = false
fenv.OnlyOwner = false
fenv.SkipOL = false
fenv.OLTPValue = Vector3.new(0, 20, 0)
fenv.loopPlayerBlobF4 = function(_786, _786_2, _786_3, _786_4) end
fenv.masslessT = false
fenv.AntiBlobT = false
fenv.masslessF = function() end
fenv.AntiBlobF = function(_788, _788_2, _788_3, _788_4) end
fenv.CheckBlob = function(_789, _789_2, _789_3, _789_4) end
fenv.setRagdollF = function(_790, _790_2, _790_3, _790_4) end
fenv.startRagdollWalk = function() end

_LocalPlayer29.CharacterAdded:Connect(function(_795, _795_2, _795_3) end)

genv.ToggleAntiRagdollMoment = function(_796) end

game:GetService('UserInputService').JumpRequest:Connect(function(_800, _800_2, _800_3) end)
game:GetService('RunService').Stepped:Connect(function(_804, _804_2, _804_3, _804_4) end)

local _ = Enum.KeyCode.X

_LocalPlayer29.CharacterAdded:Connect(function(_810) end)
_call18.PlayerAdded:Connect(function(_814, _814_2, _814_3, _814_4, _814_5) end)
_call18.PlayerRemoving:Connect(function(_818, _818_2, _818_3, _818_4, _818_5) end)

_8.ForceCheckbox = false

_call20:WaitForChild('MenuToys'):WaitForChild('SpawnToyRemoteFunction')
_call20:WaitForChild('CharacterEvents'):WaitForChild('RagdollRemote')
_call20:WaitForChild('MenuToys'):FindFirstChild('DestroyToy')
_call20:WaitForChild('CharacterEvents'):WaitForChild('Struggle')

local _ = _LocalPlayer29.Character

_LocalPlayer29.Character:WaitForChild('Humanoid', 5).Died:Connect(function(_842) end)
_LocalPlayer29.CharacterAdded:Connect(function(_846) end)
task.spawn(function(_849, _849_2, _849_3, _849_4) end)

local _call855 = _8:CreateWindow({
    SidebarCompacted = true,
    SearchbarSize = UDim2.fromScale(0.5, 1),
    Title = '',
    Footer = 'Fling Things and people',
    IconSize = UDim2.fromOffset(30, 30),
    SidebarCompactWidth = 65,
    Icon = '113033571661819',
    CornerRadius = 20,
})
local _call857 = Instance.new('Sound')

_call857.SoundId = 'rbxassetid://137402801272072'
_call857.Volume = 3
_call857.Parent = game:GetService('SoundService')

_call857:Play()
_call857.Ended:Once(function(_865, _865_2, _865_3, _865_4, _865_5) end)

local _call868 = _call855:AddTab({
    Description = 'player settings',
    Name = 'Main',
    Icon = 'user',
})
local _call869 = _call855:AddTab({
    Description = 'Target options',
    Name = 'Target',
    Icon = 'target',
})
local _call871 = _call855:AddTab({
    Description = 'visual enhancements',
    Name = 'Visual',
    Icon = 'eye',
})
local _call873 = _call855:AddTab({
    Description = 'customize ui',
    Name = 'UI Settings',
    Icon = 'settings',
})
local _call875 = _call868:AddLeftGroupbox('Invisibility', 'shield')

_call875:AddToggle('AntiGrab', {
    Text = 'Anti Grab',
    Default = false,
    Tooltip = 'Anti Grab',
})
_Toggles31.AntiGrab:OnChanged(function(_881, _881_2) end)
_call875:AddToggle('AntiGucci', {
    Text = 'Anti Gucci/Desync',
    Default = false,
    Tooltip = 'Anti Gucci',
})
_Toggles31.AntiGucci:OnChanged(function() end)
_call875:AddToggle('AntiBanana', {
    Text = 'Anti Banana',
    Default = false,
    Tooltip = 'Anti Banana',
})
_Toggles31.AntiBanana:OnChanged(function(_893, _893_2, _893_3, _893_4) end)
_call875:AddToggle('AntiKick', {
    Text = 'Anti Kick (Break PLCD)',
    Default = false,
    Tooltip = 'Anti Kick (Break PLCD)',
})
_Toggles31.AntiKick:OnChanged(function(_899, _899_2, _899_3, _899_4, _899_5) end)
_call875:AddToggle('AntiLag', {
    Text = 'Anti Lag',
    Default = false,
    Tooltip = 'Anti Lag',
})
_Toggles31.AntiLag:OnChanged(function(_905, _905_2) end)
_call875:AddToggle('AntiExplode', {
    Text = 'Anti Explosion',
    Default = false,
    Tooltip = 'Anti Explosion',
})
_Toggles31.AntiExplode:OnChanged(function(_911, _911_2) end)
_call875:AddToggle('AntiInPlot', {
    Text = 'Anti InPlot(BlobMan)',
    Default = false,
    Tooltip = 'Reparent to SpawnedInToys',
})
_Toggles31.AntiInPlot:OnChanged(function(_917) end)
_call875:AddToggle('AntiReleaseToggle', {
    Default = false,
    Text = 'Anti-Release',
})
_Toggles31.AntiReleaseToggle:OnChanged(function(_923) end)
_call875:AddToggle('AntiBurn', {
    Text = 'Anti Burn',
    Default = false,
    Tooltip = 'Teleports ExtinguishPart to Head',
})
_Toggles31.AntiBurn:OnChanged(function(_929, _929_2, _929_3, _929_4) end)
_call875:AddToggle('AntiMassless', {
    Text = 'Anti Massless',
    Default = false,
    Tooltip = 'Anti Massless',
})
_Toggles31.AntiMassless:OnChanged(function(_935, _935_2, _935_3) end)
_call875:AddToggle('AntiBlob', {
    Text = 'Anti blob',
    Default = false,
    Tooltip = 'Anti Blob',
})
_Toggles31.AntiBlob:OnChanged(function(_941, _941_2, _941_3) end)
_call875:AddToggle('AntiSnowball', {
    Text = 'Anti Snowball',
    Default = false,
    Tooltip = 'Anti Snowball (Ragdoll Walk)',
})
_Toggles31.AntiSnowball:OnChanged(function(_947, _947_2, _947_3) end)
_LocalPlayer29.CharacterAdded:Connect(function(_951, _951_2) end)

genv.ToggleAntiRagdollMoment = function(_952, _952_2, _952_3, _952_4, _952_5, _952_6) end

_call875:AddToggle('AntiRagdollMoment', {
    Text = 'Anti Ragdoll/Moment',
    Default = false,
    Tooltip = 'Anti Ragdoll/Moment (Ragdoll Walk with Smart Jump)',
})
_Toggles31.AntiRagdollMoment:OnChanged(function(_958, _958_2, _958_3, _958_4, _958_5) end)

local _call960 = _call868:AddRightGroupbox('Player', 'user')

_call960:AddToggle('OceanWalk', {
    Default = false,
    Text = 'Ocean Walk',
})
_Toggles31.OceanWalk:OnChanged(function(_966, _966_2, _966_3) end)
_call960:AddToggle('Noclip', {
    Default = false,
    Text = 'Noclip',
})
_Toggles31.Noclip:OnChanged(function() end)
_call960:AddToggle('TPWalk', {
    Default = false,
    Text = 'TP Walk',
})
_call960:AddSlider('TPWalkSpeed', {
    Min = 1,
    Default = 5,
    Compact = false,
    Max = 50,
    Text = 'TP Walk Speed',
    Rounding = 0,
})
_Toggles31.TPWalk:OnChanged(function(_980, _980_2, _980_3, _980_4) end)
_call960:AddToggle('InfiniteJump', {
    Default = false,
    Text = 'Infinite Jump',
})
_Toggles31.InfiniteJump:OnChanged(function(_986) end)
_call960:AddButton({
    Text = 'Third Person',
    Func = function(_989, _989_2, _989_3) end,
    Tooltip = 'You can Third Person!',
})

local _call991 = _call868:AddRightGroupbox('Keybinds', 'keyboard')

_call991:AddToggle('ClickTP', {
    Text = 'Click TP - X',
    Default = false,
    Tooltip = 'Press the X key and aim with the crosshair',
})
_Toggles31.ClickTP:OnChanged(function(_997, _997_2, _997_3) end)
_call991:AddToggle('LoopGrab', {
    Text = 'Loop Grab - F',
    Default = false,
    Tooltip = 'If your opponent is within 20 studs/within your crosshair, press F to lock on.',
})
_Toggles31.LoopGrab:OnChanged(function(_1003, _1003_2) end)
_call991:AddToggle('CameraZoom', {
    Text = 'Camera Zoom - Z',
    Default = false,
    Tooltip = 'You can use it by pressing the Z key and rolling the mouse wheel',
})
_Toggles31.CameraZoom:OnChanged(function(_1009, _1009_2) end)

local _call1011 = _call868:AddLeftGroupbox('Anti Loop', 'zap')

_call1011:AddButton({
    Text = 'Lock Position',
    Func = function(_1014, _1014_2, _1014_3, _1014_4, _1014_5) end,
    Tooltip = 'Fix from current location',
})
_call1011:AddToggle('AntiLoop', {
    Text = 'Anti Loop',
    Default = false,
    Tooltip = 'Allows you to escape from group kills/kicks',
})
_Toggles31.AntiLoop:OnChanged(function(_1020) end)
_call1011:AddSlider('AntiLoopRadius', {
    Min = 1,
    Default = 8,
    Compact = false,
    Max = 50000,
    Text = 'Radius',
    Tooltip = 'Determine the radius of the circle',
    Rounding = 0,
})
_Options30.AntiLoopRadius:OnChanged(function(_1026, _1026_2) end)
_call1011:AddSlider('AntiLoopSteps', {
    Min = 4,
    Default = 8,
    Compact = false,
    Max = 32,
    Text = 'Steps',
    Tooltip = 'Determine the point that divides the circle',
    Rounding = 0,
})
_Options30.AntiLoopSteps:OnChanged(function(_1032, _1032_2) end)

local _call1034 = _call869:AddLeftGroupbox('SpamSetOwner', 'target')

for _1037, _1037_2 in pairs(_call18:GetPlayers())do
    local _ = _1037_2 == _LocalPlayer29
    local _ = _1037_2.Name
end

_call1034:AddDropdown('SpamTarget', {
    Values = {[1] = _Name1039},
    Tooltip = 'Select Target Player!',
    Multi = false,
    Text = 'Select Target',
    Default = 1,
})
_Options30.SpamTarget:OnChanged(function(_1045, _1045_2, _1045_3, _1045_4) end)
_call1034:AddSlider('SpamPosX', {
    Min = -100,
    Default = 0,
    Compact = false,
    Max = 100,
    Text = 'Position X',
    Rounding = 0,
})
_Options30.SpamPosX:OnChanged(function(_1051, _1051_2, _1051_3) end)
_call1034:AddSlider('SpamPosY', {
    Min = -100,
    Default = -3,
    Compact = false,
    Max = 100,
    Text = 'Position Y',
    Rounding = 0,
})
_Options30.SpamPosY:OnChanged(function(_1057, _1057_2) end)
_call1034:AddSlider('SpamPosZ', {
    Min = -100,
    Default = 0,
    Compact = false,
    Max = 100,
    Text = 'Position Z',
    Rounding = 0,
})
_Options30.SpamPosZ:OnChanged(function() end)
_call1034:AddSlider('CreateLineLength', {
    Min = 0,
    Default = 0,
    Compact = false,
    Max = 1000000,
    Text = 'CreateLine Length',
    Rounding = 0,
})
_Options30.CreateLineLength:OnChanged(function(_1069) end)
_call1034:AddToggle('MathHugeToggle', {
    Text = 'Math Huge',
    Default = false,
    Tooltip = 'Ignore the slider value and fix the Y coordinate to math.huge(infinity)',
})
_Toggles31.MathHugeToggle:OnChanged(function(_1075, _1075_2) end)
_call1034:AddToggle('SetOwnerKick', {
    Text = 'OwnerKick',
    Default = false,
    Tooltip = 'Kick the enemy by repeating Setowner and Destory',
})
_Toggles31.SetOwnerKick:OnChanged(function(_1081, _1081_2, _1081_3, _1081_4) end)
_call1034:AddDropdown('KickMode', {
    Values = {
        [1] = 'Setowner -> destory',
        [2] = 'Setowner + destory',
        [3] = 'CreateOwnerKick',
    },
    Tooltip = 'Select Ownerkick Type!',
    Multi = false,
    Text = 'Owner Type',
    Default = 1,
})
_Options30.KickMode:OnChanged(function(_1087, _1087_2) end)
_Toggles31.SetOwnerKick:OnChanged(function(_1091, _1091_2, _1091_3, _1091_4) end)
_call1034:AddToggle('RagdollSpam', {
    Text = 'Ragdoll Spam',
    Default = false,
    Tooltip = 'The Pallet is hit back and forth with 500,000 studs',
})
_Toggles31.RagdollSpam:OnChanged(function(_1097, _1097_2, _1097_3, _1097_4) end)
_call869:AddRightGroupbox('Target List', 'users'):AddDropdown('BlobmanTarget', {
    Values = {[1] = _Name1039},
    Tooltip = 'Select Target Player!',
    Multi = false,
    Text = 'Select Target',
    Default = 1,
})
_Options30.BlobmanTarget:OnChanged(function(_1105, _1105_2) end)

 _call1107 = _call869:AddRightGroupbox('Target Functions', 'swords')

_call1107:AddToggle('LoopTargetToggle', {
    Text = 'Loop Target Type',
    Default = false,
    Tooltip = 'Toggle Loop Target',
})
_call1107:AddDropdown('LoopTargetDropdown', {
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
_Options30.LoopTargetDropdown:OnChanged(function(_1115) end)
_call1107:AddButton({
    Text = 'Kick All Players',
    Func = function(_1118, _1118_2, _1118_3, _1118_4) end,
    Tooltip = 'Kick everyone on the server',
})
_call1107:AddToggle('FriendWhitelistToggle', {
    Text = 'Whitelist',
    Default = false,
    Tooltip = 'Exclude friends',
})
_Toggles31.FriendWhitelistToggle:OnChanged(function(_1124, _1124_2, _1124_3) end)
_Options30.LoopTargetDropdown:OnChanged(function(_1128, _1128_2, _1128_3) end)
_Toggles31.LoopTargetToggle:OnChanged(function(_1132, _1132_2) end)
_call871:AddLeftGroupbox('ESP', 'eye'):AddToggle('PLCDESP', {
    Text = 'PCLD ESP',
    Default = false,
    Tooltip = 'PlayerCharacterLocationDetector ESP',
})
_Toggles31.PLCDESP:OnChanged(function(_1140) end)

 _call1142 = _call873:AddLeftGroupbox('Menu', 'wrench')

_call18.PlayerRemoving:Connect(function(_1146, _1146_2, _1146_3, _1146_4, _1146_5) end)
_call1142:AddToggle('KickAlarm', {
    Text = 'Kick Alarm',
    Default = false,
    Tooltip = 'Kick Alarm!',
})
_Toggles31.KickAlarm:OnChanged(function(_1152, _1152_2, _1152_3) end)
_call1142:AddToggle('ShowKeybinds', {
    Default = false,
    Text = 'Show Keybind Menu',
})
_call1142:AddToggle('ToggleSound', {
    Default = true,
    Text = 'Toggle Sound Effect',
})
_Toggles31.ShowKeybinds:OnChanged(function(_1160, _1160_2, _1160_3) end)
_call1142:AddLabel('Menu Keybind'):AddKeyPicker('MenuKeybind', {
    NoUI = true,
    Default = 'RightShift',
    Text = 'Menu keybind',
})
_call1142:AddButton({
    Func = function(_1167, _1167_2) end,
    Text = 'Unload',
})

_8.ToggleKeybind = _Options30.MenuKeybind

_12:SetLibrary(_8)
_16:SetLibrary(_8)
_16:IgnoreThemeSettings()
_16:SetIgnoreIndexes({
    [1] = 'MenuKeybind',
})
_12:SetFolder('FlingThings')
_16:SetFolder('FlingThings/configs')
_16:BuildConfigSection(_call873)
_12:ApplyToTab(_call873)
task.spawn(function(_1187, _1187_2, _1187_3, _1187_4) end)
_8:Notify({
    Time = 3,
    Title = 'Fling Things And People',
    Description = 'LAX HUB',
})
