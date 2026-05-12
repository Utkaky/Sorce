local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local rs = ReplicatedStorage

local NotifGui = Instance.new("ScreenGui")
NotifGui.Name = "AkaliNotif"
NotifGui.Parent = RunService:IsStudio() and LocalPlayer.PlayerGui or game:GetService("CoreGui")
NotifGui.IgnoreGuiInset = true
NotifGui.DisplayOrder = 999

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Position = UDim2.new(0, 20, 0.5, -20)
Container.Size = UDim2.new(0, 320, 0.5, 0)
Container.BackgroundTransparency = 1
Container.Parent = NotifGui

 function Image(ID, Button)
	local NewImage = Instance.new(string.format("Image%s", Button and "Button" or "Label"))
	NewImage.Image = ID
	NewImage.BackgroundTransparency = 1
	return NewImage
end

 function Round2px()
	local NewImage = Image("http://www.roblox.com/asset/?id=5761488251")
	NewImage.ScaleType = Enum.ScaleType.Slice
	NewImage.SliceCenter = Rect.new(2, 2, 298, 298)
	NewImage.ImageColor3 = Color3.fromRGB(20, 20, 25)
	return NewImage
end

 function Shadow2px()
	local NewImage = Image("http://www.roblox.com/asset/?id=5761498316")
	NewImage.ScaleType = Enum.ScaleType.Slice
	NewImage.SliceCenter = Rect.new(17, 17, 283, 283)
	NewImage.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30)
	NewImage.Position = -UDim2.fromOffset(15, 15)
	NewImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
	NewImage.ImageTransparency = 0.3
	return NewImage
end

local Padding = 8
local DescriptionPadding = 12
local InstructionObjects = {}
local TweenTime = 0.8
local TweenStyle = Enum.EasingStyle.Quart
local TweenDirection = Enum.EasingDirection.Out

local LastTick = tick()

local function CalculateBounds(TableOfObjects)
	local TableOfObjects = typeof(TableOfObjects) == "table" and TableOfObjects or {}
	local Y = 0
	for _, Object in next, TableOfObjects do
		Y += Object.AbsoluteSize.Y
	end
	return Y
end

local CachedObjects = {}

local function Update()
	local DeltaTime = tick() - LastTick
	local PreviousObjects = {}
	local CurrentY = 0
	
	for _, Object in next, InstructionObjects do
		local Label, Delta, Done = Object[1], Object[2], Object[3]
		
		if not Done and Delta < TweenTime then
			Object[2] = math.clamp(Delta + DeltaTime, 0, 1)
			Delta = Object[2]
		elseif Delta >= TweenTime then
			Object[3] = true
		end
		
		local NewValue = TweenService:GetValue(Delta, TweenStyle, TweenDirection)
		local TargetPos = UDim2.new(0, 0, 0, CurrentY)
		Label.Position = Label.Position:Lerp(TargetPos, NewValue)
		
		CurrentY += Label.AbsoluteSize.Y + Padding
		table.insert(PreviousObjects, Label)
	end
	
	CachedObjects = PreviousObjects
	LastTick = tick()
end

RunService:BindToRenderStep("UpdateList", 0, Update)

local TitleSettings = { Font = Enum.Font.GothamSemibold, Size = 14 }
local DescriptionSettings = { Font = Enum.Font.Gotham, Size = 13 }

local MaxWidth = (Container.AbsoluteSize.X - Padding - DescriptionPadding)

local function Label(Text, Font, Size, Button)
	local Label = Instance.new(string.format("Text%s", Button and "Button" or "Label"))
	Label.Text = Text
	Label.Font = Font
	Label.TextSize = Size
	Label.BackgroundTransparency = 1
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.RichText = true
	Label.TextColor3 = Color3.fromRGB(240, 240, 240)
	return Label
end

local function FadeProperty(Object)
	local Prop = Object:IsA("TextLabel") and "TextTransparency" or 
				 (Object:IsA("ImageLabel") and "ImageTransparency" or "BackgroundTransparency")
	
	TweenService:Create(Object, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		[Prop] = 1
	}):Play()
end

local function SearchTableFor(Table, For)
	for _, v in next, Table do
		if v == For then return true end
	end
	return false
end

local function FindIndexByDependency(Table, Dependency)
	for Index, Object in next, Table do
		if typeof(Object) == "table" then
			if SearchTableFor(Object, Dependency) then
				return Index
			end
		elseif Object == Dependency then
			return Index
		end
	end
end

local function ResetObjects()
	for _, Object in next, InstructionObjects do
		Object[2] = 0
		Object[3] = false
	end
end

local function FadeOutAfter(Object, Seconds)
	task.wait(Seconds)
	FadeProperty(Object)
	for _, SubObj in next, Object:GetDescendants() do
		FadeProperty(SubObj)
	end
	task.wait(0.3)
	table.remove(InstructionObjects, FindIndexByDependency(InstructionObjects, Object))
	ResetObjects()
end

local function Notify(Properties)
	local Properties = typeof(Properties) == "table" and Properties or {}
	local Title = Properties.Title
	local Description = Properties.Description
	local Duration = Properties.Duration or 5
	
	if Title or Description then
		local Y = Title and 28 or 0
		if Description then
			local TextSize = TextService:GetTextSize(Description, DescriptionSettings.Size, DescriptionSettings.Font, Vector2.new(MaxWidth, 1000))
			Y += TextSize.Y + 12
		end
		
		local NewLabel = Round2px()
		NewLabel.Size = UDim2.new(1, 0, 0, Y)
		NewLabel.Position = UDim2.new(-1, 20, 0, CalculateBounds(CachedObjects))
		
		if Title then
			local NewTitle = Label(Title, TitleSettings.Font, TitleSettings.Size)
			NewTitle.Size = UDim2.new(1, -20, 0, 24)
			NewTitle.Position = UDim2.fromOffset(12, 6)
			NewTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
			NewTitle.Parent = NewLabel
		end
		
		if Description then
			local NewDescription = Label(Description, DescriptionSettings.Font, DescriptionSettings.Size)
			NewDescription.TextWrapped = true
			NewDescription.Size = UDim2.new(1, -24, 1, Title and -30 or -12)
			NewDescription.Position = UDim2.fromOffset(12, Title and 30 or 6)
			NewDescription.TextYAlignment = Title and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
			NewDescription.TextColor3 = Color3.fromRGB(200, 200, 200)
			NewDescription.Parent = NewLabel
		end
		
		Shadow2px().Parent = NewLabel
		NewLabel.Parent = Container
		table.insert(InstructionObjects, {NewLabel, 0, false})
		coroutine.wrap(FadeOutAfter)(NewLabel, Duration)
	end
end

local ChatGui = Instance.new("ScreenGui")
ChatGui.Name = "Fling Things And People"
ChatGui.Parent = game:GetService("CoreGui")
ChatGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ChatGui.DisplayOrder = 100
ChatGui.ResetOnSpawn = false

local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = ChatGui
MainContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.5, -175, 0.5, -150)
MainContainer.Size = UDim2.new(0, 350, 0, 300)
MainContainer.ClipsDescendants = true
MainContainer.Active = true
MainContainer.Draggable = true

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 20)
UICornerMain.Parent = MainContainer

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Parent = MainContainer
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6015897843"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.ZIndex = -1

local TopBar = Instance.new("Frame")
TopBar.Parent = MainContainer
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 20)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 16, 0, 0)
Title.Size = UDim2.new(0, 150, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Fling Things And People"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local PlayerInfo = Instance.new("TextLabel")
PlayerInfo.Parent = TopBar
PlayerInfo.BackgroundTransparency = 1
PlayerInfo.Position = UDim2.new(0, 16, 0, 29)
PlayerInfo.Size = UDim2.new(0, 150, 0, 16)
PlayerInfo.Font = Enum.Font.Gotham
PlayerInfo.Text = "@" .. LocalPlayer.Name
PlayerInfo.TextColor3 = Color3.fromRGB(150, 150, 160)
PlayerInfo.TextSize = 11
PlayerInfo.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
CloseButton.Position = UDim2.new(1, -35, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.AutoButtonColor = false

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

CloseButton.MouseEnter:Connect(function()
	TweenService:Create(CloseButton, TweenInfo.new(0.2), {
		BackgroundColor3 = Color3.fromRGB(255, 80, 80)
	}):Play()
end)

CloseButton.MouseLeave:Connect(function()
	TweenService:Create(CloseButton, TweenInfo.new(0.2), {
		BackgroundColor3 = Color3.fromRGB(45, 45, 55)
	}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
	MainContainer.Visible = false
	ToggleButton.Visible = true
end)

local HistoryFrame = Instance.new("ScrollingFrame")
HistoryFrame.Parent = MainContainer
HistoryFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
HistoryFrame.BorderSizePixel = 0
HistoryFrame.Position = UDim2.new(0, 0, 0, 45)
HistoryFrame.Size = UDim2.new(1, 0, 1, -100)
HistoryFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
HistoryFrame.ScrollBarThickness = 4
HistoryFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 140)
HistoryFrame.ScrollBarImageTransparency = 0.5
HistoryFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
HistoryFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
HistoryFrame.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
HistoryFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
HistoryFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
HistoryFrame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable

local HistoryList = Instance.new("UIListLayout")
HistoryList.Parent = HistoryFrame
HistoryList.SortOrder = Enum.SortOrder.LayoutOrder
HistoryList.Padding = UDim.new(0, 6)
HistoryList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local HistoryPadding = Instance.new("UIPadding")
HistoryPadding.Parent = HistoryFrame
HistoryPadding.PaddingLeft = UDim.new(0, 10)
HistoryPadding.PaddingRight = UDim.new(0, 10)
HistoryPadding.PaddingTop = UDim.new(0, 10)
HistoryPadding.PaddingBottom = UDim.new(0, 10)

local InputFrame = Instance.new("Frame")
InputFrame.Parent = MainContainer
InputFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
InputFrame.BorderSizePixel = 0
InputFrame.Position = UDim2.new(0, 0, 1, -55)
InputFrame.Size = UDim2.new(1, 0, 0, 55)

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 20)
InputCorner.Parent = InputFrame

local MessageBox = Instance.new("TextBox")
MessageBox.Parent = InputFrame
MessageBox.BackgroundColor3 = Color3.fromRGB(38, 38, 45)
MessageBox.BorderSizePixel = 0
MessageBox.Position = UDim2.new(0, 12, 0.5, -15)
MessageBox.Size = UDim2.new(1, -80, 0, 30)
MessageBox.Font = Enum.Font.Gotham
MessageBox.PlaceholderText = "Enter your message..."
MessageBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 150)
MessageBox.Text = ""
MessageBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageBox.TextSize = 13
MessageBox.ClearTextOnFocus = false

local InputBoxCorner = Instance.new("UICorner")
InputBoxCorner.CornerRadius = UDim.new(0, 12)
InputBoxCorner.Parent = MessageBox

local SendButton = Instance.new("TextButton")
SendButton.Parent = InputFrame
SendButton.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
SendButton.BorderSizePixel = 0
SendButton.Position = UDim2.new(1, -60, 0.5, -15)
SendButton.Size = UDim2.new(0, 45, 0, 30)
SendButton.Font = Enum.Font.GothamBold
SendButton.Text = "→"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 18
SendButton.AutoButtonColor = false

local SendCorner = Instance.new("UICorner")
SendCorner.CornerRadius = UDim.new(0, 12)
SendCorner.Parent = SendButton

SendButton.MouseEnter:Connect(function()
	TweenService:Create(SendButton, TweenInfo.new(0.2), {
		BackgroundColor3 = Color3.fromRGB(100, 160, 255)
	}):Play()
end)

SendButton.MouseLeave:Connect(function()
	TweenService:Create(SendButton, TweenInfo.new(0.2), {
		BackgroundColor3 = Color3.fromRGB(80, 140, 255)
	}):Play()
end)

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ChatGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -20)
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "💬"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20
ToggleButton.Visible = false

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
	MainContainer.Visible = true
	ToggleButton.Visible = false
end)

 function ScrollToBottom()
	task.wait(0.05)
	HistoryFrame.CanvasPosition = Vector2.new(0, HistoryFrame.AbsoluteCanvasSize.Y)
end

local ChatHistory = {}
local MAX_MESSAGES = 50

 function CreateMessageBubble(username, message, isSelf)
	local bubble = Instance.new("Frame")
	bubble.BackgroundColor3 = isSelf and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(38, 38, 45)
	bubble.BackgroundTransparency = 0.1
	bubble.BorderSizePixel = 0
	bubble.Size = UDim2.new(1, 0, 0, 0)
	bubble.AutomaticSize = Enum.AutomaticSize.Y

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = bubble
	
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 10)
	padding.PaddingRight = UDim.new(0, 10)
	padding.PaddingTop = UDim.new(0, 6)
	padding.PaddingBottom = UDim.new(0, 6)
	padding.Parent = bubble
	
	local nameLabel = Instance.new("TextLabel")
	nameLabel.Parent = bubble
	nameLabel.BackgroundTransparency = 1
	nameLabel.Size = UDim2.new(1, 0, 0, 16)
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.Text = username
	nameLabel.TextColor3 = isSelf and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 200, 255)
	nameLabel.TextSize = 12
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	local messageLabel = Instance.new("TextLabel")
	messageLabel.Parent = bubble
	messageLabel.BackgroundTransparency = 1
	messageLabel.Position = UDim2.new(0, 0, 0, 18)
	messageLabel.Size = UDim2.new(1, 0, 0, 0)
	messageLabel.AutomaticSize = Enum.AutomaticSize.Y
	messageLabel.Font = Enum.Font.Gotham
	messageLabel.Text = message
	messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	messageLabel.TextSize = 13
	messageLabel.TextWrapped = true
	messageLabel.TextXAlignment = Enum.TextXAlignment.Left
	messageLabel.RichText = true
	
	local timeLabel = Instance.new("TextLabel")
	timeLabel.Parent = bubble
	timeLabel.BackgroundTransparency = 1
	timeLabel.Size = UDim2.new(1, 0, 0, 12)
	timeLabel.Position = UDim2.new(0, 0, 1, -12)
	timeLabel.Font = Enum.Font.Gotham
	timeLabel.Text = os.date("%H:%M")
	timeLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
	timeLabel.TextSize = 9
	timeLabel.TextXAlignment = Enum.TextXAlignment.Right
	
	return bubble
end

 function AddMessageToHistory(username, message, isSelf)
	table.insert(ChatHistory, {
		Username = username,
		Message = message,
		IsSelf = isSelf,
		Time = os.date("%H:%M")
	})
	
	if #ChatHistory > MAX_MESSAGES then
		table.remove(ChatHistory, 1)
	end
	
	for _, child in ipairs(HistoryFrame:GetChildren()) do
		if child:IsA("Frame") and child ~= HistoryList and child ~= HistoryPadding then
			child:Destroy()
		end
	end
	
	for _, msg in ipairs(ChatHistory) do
		local bubble = CreateMessageBubble(msg.Username, msg.Message, msg.IsSelf)
		bubble.Parent = HistoryFrame
	end
	
	ScrollToBottom()
end

HistoryList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(ScrollToBottom)

AddMessageToHistory("Help", "✨ Hii niggabu", false)
AddMessageToHistory("Help", "Press F8 to open/exit", false)

 function SendCustomMessage()
	local message = MessageBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
	if message ~= "" then
		pcall(function()
			local encodedMessage = "CUSTOMMSG:" .. LocalPlayer.DisplayName .. ":" .. message
			rs:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine"):FireServer(encodedMessage)
			MessageBox.Text = ""
			SendButton.Text = "✓"
			SendButton.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
			task.wait(0.3)
			SendButton.Text = "→"
			SendButton.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
		end)
	end
end

SendButton.MouseButton1Click:Connect(SendCustomMessage)

MessageBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		SendCustomMessage()
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.F8 then
		ChatGui.Enabled = not ChatGui.Enabled
		if ChatGui.Enabled then
			MainContainer.Visible = true
			ToggleButton.Visible = false
			ScrollToBottom()
		end
	elseif input.KeyCode == Enum.KeyCode.F9 and ChatGui.Enabled then
		MainContainer.Visible = not MainContainer.Visible
		ToggleButton.Visible = not MainContainer.Visible
	end
end)

 ExtendGrabLine = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine")

ExtendGrabLine.OnClientEvent:Connect(function(...)
	local args = { ... }
	
	for _, v in ipairs(args) do
		if typeof(v) == "string" and v:sub(1, 10) == "CUSTOMMSG:" then
			local parts = {}
			for part in v:gmatch("[^:]+") do
				table.insert(parts, part)
			end
			
			if #parts >= 3 then
				local displayName = parts[2]
				local message = table.concat(parts, ":", 3)
				
				AddMessageToHistory(displayName, message, false)
				
				Notify({
					Title = displayName,
					Description = message,
					Duration = 5
				})
			end
			return
		end
	end
end)

MainContainer.Position = UDim2.new(0.5, -175, 0.5, -300)
TweenService:Create(MainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Expo, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, -175, 0.5, -150)
}):Play()

task.wait(0.2)
ScrollToBottom()
