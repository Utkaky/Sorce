local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local w = game:GetService("Workspace")
local Players = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local me = Players.LocalPlayer
local BackPack = w[me.Name .. 'SpawnedInToys']

local setowner = rs.GrabEvents.SetNetworkOwner
local StickyPartEvent = rs.PlayerEvents.StickyPartEvent
local SpawnToy = rs.MenuToys.SpawnToyRemoteFunction

local Window = Rayfield:CreateWindow({
   Name = "Vehicle Control",
   LoadingTitle = "UFO / CaveCart Controller",
   LoadingSubtitle = "by ",
   ConfigurationSaving = {
      Enabled = false,
   }
})

local function spawnShurikens(count)
    local spawnCFrame = me.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
    for i = 1, count do
        local args = {
            "NinjaShuriken",
            spawnCFrame,
            Vector3.new(0, 0, 0)
        }
        SpawnToy:InvokeServer(unpack(args))
        task.wait(0.05)
    end
end

local GrabLinesTab = Window:CreateTab("massless", 4483362458)
local Tab = Window:CreateTab("UFOs", 4483362458)

Tab:CreateButton({
   Name = "UFO1 (OuterUFO)",
   Callback = function()
      local UFO = w.Map.AlwaysHereTweenedObjects.OuterUFO.Object.ObjectModel.Body

      spawnShurikens(10)
      task.wait(1)

      for i = 1,10 do
          local shur = BackPack.NinjaShuriken
          shur.Name = i
          StickyPartEvent:FireServer(shur.StickyPart,UFO,CFrame.Angles(0,0,0))
      end

      for i = 1,100 do
          me.Character.HumanoidRootPart.CFrame = UFO.CFrame
          setowner:FireServer(UFO,UFO.CFrame)
          task.wait()
      end

      local obj = w.Map.AlwaysHereTweenedObjects.OuterUFO.Object
      local body = obj.ObjectModel.Body
      local attach = body:FindFirstChild("ObjectModelAttachment")
      if attach then attach:Destroy() end

      obj.FollowThisPart.AlignPosition.Attachment0 = nil
      obj.FollowThisPart.AlignOrientation.Attachment0 = nil
   end
})


Tab:CreateButton({
   Name = "Train",
   Callback = function()
      local Train = w.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel.Part

      spawnShurikens(10)
      task.wait(1)

      for i = 1,10 do
          local shur = BackPack.NinjaShuriken
          shur.Name = i
          StickyPartEvent:FireServer(shur.StickyPart,Train,CFrame.Angles(0,0,0))
      end

      for i = 1,100 do
          me.Character.HumanoidRootPart.CFrame = Train.CFrame
          setowner:FireServer(Train,Train.CFrame)
          task.wait()
      end

      local obj = w.Map.AlwaysHereTweenedObjects.Train.Object
      local body = obj.ObjectModel.Part
      local attach = body:FindFirstChild("ObjectModelAttachment")
      if attach then attach:Destroy() end

      obj.FollowThisPart.AlignPosition.Attachment0 = nil
      obj.FollowThisPart.AlignOrientation.Attachment0 = nil
   end
})

local UFOFolder = Workspace:WaitForChild("Map")
    :WaitForChild("AlwaysHereTweenedObjects")
    :WaitForChild("OuterUFO")
    :WaitForChild("Object")
    :WaitForChild("ObjectModel")

local spinEnabled = false
local followEnabled = false
local spinSpeed = 6
local radius = 15
local height = 5

local function getHitboxes()
    local hitboxes = {}
    for _, child in ipairs(UFOFolder:GetChildren()) do
        if child.Name:match("Hitbox") then
            table.insert(hitboxes, child)
        end
    end
    return hitboxes
end

local hitboxes = getHitboxes()

local SpinToggle = Tab:CreateToggle({
    Name = "UFO Hitbox Spin",
    CurrentValue = false,
    Flag = "UFOSpinHitboxes",
    Callback = function(Value)
        spinEnabled = Value
        if Value then
            followEnabled = false
        end
    end,
})

local ToggleFollow = Tab:CreateToggle({
    Name = "UFO Hitbox Follow Head",
    CurrentValue = false,
    Flag = "UFOSpinFollowHead",
    Callback = function(Value)
        followEnabled = Value
        if Value then
            spinEnabled = false
        end
    end,
})

local angle = 0
RunService.RenderStepped:Connect(function(dt)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if spinEnabled then
        angle = angle + dt * spinSpeed
        local count = #hitboxes
        for i, hitbox in ipairs(hitboxes) do
            if hitbox and hitbox.Parent then
                local offset = (i / count) * (2 * math.pi)
                local x = math.sin(angle + offset) * radius
                local z = math.cos(angle + offset) * radius
                hitbox.CFrame = CFrame.new(hrp.Position + Vector3.new(x, height, z))
            end
        end
    elseif followEnabled then
        for _, hitbox in ipairs(hitboxes) do
            if hitbox and hitbox.Parent then
                hitbox.CFrame = CFrame.new(hrp.Position + Vector3.new(0, height + 3, 0))
            end
        end
    end
end)

Tab:CreateButton({
   Name = "UFO2 (InnerUFO)",
   Callback = function()
      local UFO = w.Map.AlwaysHereTweenedObjects.InnerUFO.Object.ObjectModel.Body

      spawnShurikens(10)
      task.wait(1)

      for i = 1,10 do
          local shur = BackPack.NinjaShuriken
          shur.Name = i
          StickyPartEvent:FireServer(shur.StickyPart,UFO,CFrame.Angles(0,0,0))
      end

      for i = 1,100 do
          me.Character.HumanoidRootPart.CFrame = UFO.CFrame
          setowner:FireServer(UFO,UFO.CFrame)
          task.wait()
      end

      local obj = w.Map.AlwaysHereTweenedObjects.InnerUFO.Object
      local body = obj.ObjectModel.Body
      local attach = body:FindFirstChild("ObjectModelAttachment")
      if attach then attach:Destroy() end

      obj.FollowThisPart.AlignPosition.Attachment0 = nil
      obj.FollowThisPart.AlignOrientation.Attachment0 = nil
   end
})

local Tab2 = Window:CreateTab("CaveCart", 4483362458)

Tab2:CreateButton({
   Name = "CaveCart",
   Callback = function()
      local obj = w.Map.AlwaysHereTweenedObjects.CaveCart.Object
      local model = obj.ObjectModel
      local target = model:GetChildren()[13]

      spawnShurikens(10)
      task.wait(1)

      for i = 1,10 do
          local shur = BackPack.NinjaShuriken
          shur.Name = i
          StickyPartEvent:FireServer(shur.StickyPart,target,CFrame.Angles(0,0,0))
      end

      for i = 1,100 do
          me.Character.HumanoidRootPart.CFrame = target.CFrame
          setowner:FireServer(target,target.CFrame)
          task.wait()
      end

      local attach = target:FindFirstChild("ObjectModelAttachment")
      if attach then attach:Destroy() end

      obj.FollowThisPart.AlignPosition.Attachment0 = nil
      obj.FollowThisPart.AlignOrientation.Attachment0 = nil
   end
})

local Sense, Massless = 30, nil
GrabLinesTab:CreateToggle({
   Name = 'Massless Grab	<font face=\"GothamBlack\" color=\"rgb(255, 255, 255)\">(PLAYER & OBJECT)</font>	<font face="GothamBlack" color="rgb(7,255,0)">GRAB</font>',
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(v)
       if v then
           Massless = workspace.ChildAdded:Connect(function(r)
               if r.Name == "GrabParts" then
                   while workspace:FindFirstChild("GrabParts") do
                       task.wait()
                       local dp = r:FindFirstChild("DragPart")
                       if dp and dp:FindFirstChild("AlignPosition") and dp:FindFirstChild("AlignOrientation") then
                           dp.AlignPosition.Responsiveness = Sense
                           dp.AlignPosition.MaxForce = math.huge
                           dp.AlignPosition.MaxVelocity = math.huge
                           dp.AlignOrientation.Responsiveness = Sense
                           dp.AlignOrientation.MaxTorque = math.huge
                       end
                   end
               end
           end)
       else
           if Massless then Massless:Disconnect() Massless = nil end
       end
   end,
})
GrabLinesTab:CreateInput({
   Name = "Massless Sense",
   CurrentValue = tostring(Sense),
   PlaceholderText = "Enter sense value",
   RemoveTextAfterFocusLost = false,
   Flag = "MasslessSenseInput",
   Callback = function(Text)
       local v = tonumber(Text)
       if v and v > 0 then Sense = v end
   end,
})
