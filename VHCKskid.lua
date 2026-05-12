local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "All Skids Script",
    LoadingTitle = "Skids Hub",
    LoadingSubtitle = "By VHCK",
    Theme = "Amethyst",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "TestHub",
        FileName = "KeyConfig"
    },
    KeySystem = false,
    KeySettings = {
        Title = "Scripture",
        Subtitle = "Key System",
        Note = "Join the discord: https://discord.gg/aJRqSuEYXf",
        FileName = "TestKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"Hub3481"}
    }
})


local Tab = Window:CreateTab("PC - Loaders", 4483362458)
local Section = Tab:CreateSection("PC Scripts")

local Button = Tab:CreateButton({
   Name = "Load Official Script | PC Supported",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-best/refs/heads/main/pc-supported.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load Scripture Hub Wings",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/R0j8tsk0/raw",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Auto Hack Train",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/4BzFGMYg/raw",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture  Void Loop",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-best/refs/heads/main/voidloop.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Silent Aimer",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/silentaim.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Loop-Kill",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/loopkill.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Permastuns",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/permastun2.lua",true))()
   end,
})

local Section = Tab:CreateSection("Universal PC Scripts")

local Button = Tab:CreateButton({
   Name = "Scripture Yield",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/scripture-yield.lua",true))()
   end,
})

function thirdperson()
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999
    game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
end

local Button = Tab:CreateButton({
   Name = "Enable 3rd Person",
   Callback = function()
   thirdperson()
   end,
})

local Tab = Window:CreateTab("MOBILE - Loaders", 4483362458)
local Section = Tab:CreateSection("Mobile Scripts")

local Button = Tab:CreateButton({
   Name = "Load Official Script | MOBILE Supported",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-best/refs/heads/main/FTAP-Scripture.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load Scripture Hub Wings",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/R0j8tsk0/raw",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Auto Hack Train",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/4BzFGMYg/raw",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture  Void Loop",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-best/refs/heads/main/voidloop.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Silent Aimer",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/silentaim.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Loop-Kill",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/loopkill.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Scripture Permastuns",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/permastun2.lua",true))()
   end,
})

local Section = Tab:CreateSection("Universal MOBILE Scripts")

local Button = Tab:CreateButton({
   Name = "Scripture Yield",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/scripture-script/refs/heads/main/scripture-yield.lua",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Enable 3rd Person",
   Callback = function()
   thirdperson()
   end,
})

local Tab = Window:CreateTab("Fixing Scripts", 4483362458)
local Section = Tab:CreateSection("Fixing Right Now")
local Label = Tab:CreateLabel("Send Bugs in our Discord Server!", 4483362458, Color3.fromRGB(75, 0, 130), false)
local Label = Tab:CreateLabel("Fixing Scripture Loop-Kick! - Skid", 4483362458, Color3.fromRGB(75, 0, 130), false)
local Label = Tab:CreateLabel("Fixing Scripture Loop-Kill! - Skid", 4483362458, Color3.fromRGB(75, 0, 130), false)


local Tab = Window:CreateTab("Credits", 4483362458)
local Section = Tab:CreateSection("1st Medal Credits")
local Label = Tab:CreateLabel("MaybeFlashh & Minion - Masters of Skids", 4483362458, Color3.fromRGB(75, 0, 130), false)
local Label = Tab:CreateLabel("https://discord.gg/aJRqSuEYXf - Normal Script Discord", 4483362458, Color3.fromRGB(75, 0, 130), false)



      
