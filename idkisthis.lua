local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

local function RagdollLoop()
    while task.wait() do
        game:GetService("RunService").RenderStepped:Wait()
        game:GetService("ReplicatedStorage").CharacterEvents.RagdollRemote:FireServer(RootPart, 1)
        game:GetService("ReplicatedStorage").CharacterEvents.RagdollRemote:FireServer(RootPart, 0)
    end
end

local function ConfigureHumanoid()
    Humanoid.BreakJointsOnDeath = false
    Humanoid.EvaluateStateMachine = false
    Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    Humanoid.Health = 0
    
    for i = 0, 1 do
        if Humanoid.Health == 0 then
            task.wait(0.5)
            Humanoid.BreakJointsOnDeath = true
            Humanoid.EvaluateStateMachine = true
            task.wait(0.5)
            Humanoid.EvaluateStateMachine = false
        end
    end
end

task.spawn(RagdollLoop)
ConfigureHumanoid()
