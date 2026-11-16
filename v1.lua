local replicatedStorage = game:GetService("ReplicatedStorage")
local playersService = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local localPlayer = playersService.LocalPlayer
local misora = replicatedStorage:WaitForChild("Misora")
local fieldAct = misora:WaitForChild("FieldAct")
local fieldEvent = misora:WaitForChild("FieldEvent")
local sim = require(misora:WaitForChild("Sim"))

local oldGui = localPlayer:WaitForChild("PlayerGui"):FindFirstChild("auto farm gui")
if oldGui then
	oldGui:Destroy()
end

-- State
local coinIds = {}
local coinSeen = {}
local autoCoin =false
local autoTeleport =false
local enemyLoop = false
local lastSwing = 0
local enemyTarget = nil
local speedEnabled = false
local targetSpeed = 125

local ENEMY_PRIORITY = {
	"おこったでかサフール",
	"おこったサフール",
	"おこったちびサフール",
	"でかサフール",
	"サフール",
	"ちびサフール",
}

local PRIORITY_MAP = {}
for i, name in ipairs(ENEMY_PRIORITY) do
	PRIORITY_MAP[name] = i
end

-- Anti-speed-check
local oldNewIndex
oldNewIndex = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
	if key == "WalkSpeed" then
		if checkcaller() then
			return oldNewIndex(self, key, value)
		end
		return
	end
	return oldNewIndex(self, key, value)
end))

-- Force WalkSpeed every frame while enabled.
task.spawn(function()
	while true do
		runService.Heartbeat:Wait()
		if speedEnabled then
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.WalkSpeed ~= targetSpeed then
				humanoid.WalkSpeed = targetSpeed
			end
		end
	end
end)

-- UI.
local gui = Instance.new("ScreenGui")
gui.Name = "auto farm gui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 100
gui.Parent = localPlayer:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.AnchorPoint = Vector2.new(0, 0)
panel.Position = UDim2.fromOffset(20, 120)
panel.Size = UDim2.fromOffset(220, 580)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
panel.BackgroundTransparency = 0.05
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true
panel.Parent = gui

local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new(Color3.fromRGB(35, 35, 45), Color3.fromRGB(15, 15, 20))
mainGradient.Rotation = 90
mainGradient.Parent = panel

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = panel

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(70, 70, 90)
stroke.Thickness = 1.5
stroke.Transparency = 0.5
stroke.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundTransparency = 1
title.Text = "みそチー🤓"
title.Font = Enum.Font.GothamBlack
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = panel

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new(Color3.fromRGB(160, 220, 255), Color3.fromRGB(200, 160, 255))
titleGradient.Parent = title

local function makeToggle(labelText, getState, setState, yOffset)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -20, 0, 36)
	button.Position = UDim2.fromOffset(10, yOffset)
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	button.BorderSizePixel = 0
	button.Text = ""
	button.AutoButtonColor = false
	button.Parent = panel

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = button

	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = Color3.fromRGB(60, 60, 80)
	btnStroke.Thickness = 1
	btnStroke.Parent = button

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -50, 1, 0)
	label.Position = UDim2.fromOffset(12, 0)
	label.BackgroundTransparency = 1
	label.Text = labelText
	label.Font = Enum.Font.GothamBold
	label.TextSize = 13
	label.TextColor3 = Color3.fromRGB(220, 220, 230)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = button

	-- Switch background.
	local switchBg = Instance.new("Frame")
	switchBg.Size = UDim2.fromOffset(36, 18)
	switchBg.AnchorPoint = Vector2.new(1, 0.5)
	switchBg.Position = UDim2.new(1, -10, 0.5, 0)
	switchBg.BackgroundColor3 = getState() and Color3.fromRGB(60, 180, 100) or Color3.fromRGB(80, 80, 100)
	switchBg.BorderSizePixel = 0
	switchBg.Parent = button

	local switchCorner = Instance.new("UICorner")
	switchCorner.CornerRadius = UDim.new(1, 0)
	switchCorner.Parent = switchBg

	-- Switch knob.
	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(14, 14)
	knob.AnchorPoint = Vector2.new(0, 0.5)
	knob.Position = getState() and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
	knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	knob.BorderSizePixel = 0
	knob.Parent = switchBg

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob

	local function updateVisuals(state)
		tweenService:Create(switchBg, TweenInfo.new(0.2), {
			BackgroundColor3 = state and Color3.fromRGB(60, 180, 100) or Color3.fromRGB(80, 80, 100)
		}):Play()
		tweenService:Create(knob, TweenInfo.new(0.2), {
			Position = state and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
		}):Play()
	end

	button.MouseButton1Click:Connect(function()
		local newState = not getState()
		setState(newState)
		updateVisuals(newState)
	end)

	return button
end

makeToggle("Auto Coin", function() return autoCoin end, function(v) autoCoin = v end, 40)
makeToggle("Auto Teleport", function() return autoTeleport end, function(v) autoTeleport = v end, 80)
makeToggle("Enemy TP + Swing", function() return enemyLoop end, function(v)
	enemyLoop = v
	if not v then enemyTarget = nil end
end, 120)

-- Speed label + bar.
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -20, 0, 18)
speedLabel.Position = UDim2.fromOffset(10, 165)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "WalkSpeed: 125"
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 12
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = panel

local sliderBar = Instance.new("Frame")
sliderBar.Size = UDim2.new(1, -20, 0, 6)
sliderBar.Position = UDim2.fromOffset(10, 190)
sliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
sliderBar.BorderSizePixel = 0
sliderBar.Parent = panel

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(1, 0)
sliderCorner.Parent = sliderBar

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.fromScale(0.5, 1)
sliderFill.BackgroundColor3 = Color3.fromRGB(160, 120, 255)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderBar

local fillGradient = Instance.new("UIGradient")
fillGradient.Color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(180, 100, 255))
fillGradient.Parent = sliderFill

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = sliderFill

local sliderKnob = Instance.new("Frame")
sliderKnob.Size = UDim2.fromOffset(14, 14)
sliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
sliderKnob.Position = UDim2.fromScale(0.5, 0.5)
sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderKnob.BorderSizePixel = 0
sliderKnob.Parent = sliderBar

local knobCorner2 = Instance.new("UICorner")
knobCorner2.CornerRadius = UDim.new(1, 0)
knobCorner2.Parent = sliderKnob

local knobStroke = Instance.new("UIStroke")
knobStroke.Color = Color3.fromRGB(180, 100, 255)
knobStroke.Thickness = 2
knobStroke.Parent = sliderKnob

local SPEED_MIN = 16
local SPEED_MAX = 250

local function setSpeedFromX(x)
	local ratio = math.clamp(x / sliderBar.AbsoluteSize.X, 0, 1)
	local value = math.floor(SPEED_MIN + (SPEED_MAX - SPEED_MIN) * ratio)
	targetSpeed = value
	sliderFill.Size = UDim2.fromScale(ratio, 1)
	sliderKnob.Position = UDim2.fromScale(ratio, 0.5)
	speedLabel.Text = "WalkSpeed: " .. value
end

-- InputBegan sets position, InputChanged tracks drag.
local draggingSlider = false

sliderBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		draggingSlider = true
		setSpeedFromX(input.Position.X - sliderBar.AbsolutePosition.X)
	end
end)

sliderBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		draggingSlider = false
	end
end)

userInputService.InputChanged:Connect(function(input)
	if not draggingSlider then return end
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		setSpeedFromX(input.Position.X - sliderBar.AbsolutePosition.X)
	end
end)

local speedToggleButton = makeToggle("Speed", function() return speedEnabled end, function(v)
	speedEnabled = v
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = v and targetSpeed or 16
	end
end, 205)

-- Character table header.
local tableHeader = Instance.new("TextLabel")
tableHeader.Size = UDim2.new(1, -20, 0, 20)
tableHeader.Position = UDim2.fromOffset(10, 250)
tableHeader.BackgroundTransparency = 1
tableHeader.Text = "サーバーキャラ表"
tableHeader.Font = Enum.Font.GothamBold
tableHeader.TextSize = 12
tableHeader.TextColor3 = Color3.fromRGB(200, 200, 220)
tableHeader.TextXAlignment = Enum.TextXAlignment.Left
tableHeader.Parent = panel

-- Scrollable character list.
local scroll = Instance.new("ScrollingFrame")
scroll.Position = UDim2.fromOffset(10, 274)
scroll.Size = UDim2.new(1, -20, 0, 294)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BackgroundTransparency = 0.2
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
scroll.CanvasSize = UDim2.new()
scroll.Parent = panel

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 6)
scrollCorner.Parent = scroll

local scrollPad = Instance.new("UIPadding")
scrollPad.PaddingTop = UDim.new(0, 4)
scrollPad.PaddingBottom = UDim.new(0, 4)
scrollPad.PaddingLeft = UDim.new(0, 4)
scrollPad.PaddingRight = UDim.new(0, 4)
scrollPad.Parent = scroll

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 4)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scroll

-- Coin id capture + teleport.
local function teleportTo(pos)
	if not autoTeleport then return end
	if typeof(pos) ~= "Vector3" then return end

	local character = localPlayer.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not root then return end

	root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
end

fieldEvent.OnClientEvent:Connect(function(payload)
	if type(payload) ~= "table" then return end

	if payload.kind == "coinsAll" then
		table.clear(coinIds)
		table.clear(coinSeen)
		for _, entry in ipairs(payload.list or {}) do
			local id, pos = entry[1], entry[2]
			if id and not coinSeen[id] then
				coinSeen[id] = true
				table.insert(coinIds, id)
			end
			if pos then
				teleportTo(pos)
			end
		end
		return
	end

	if payload.kind == "coins" then
		for _, id in ipairs(payload.del or {}) do
			coinSeen[id] = nil
			for i, existing in ipairs(coinIds) do
				if existing == id then
					table.remove(coinIds, i)
					break
				end
			end
		end
		for _, entry in ipairs(payload.add or {}) do
			local id, pos = entry[1], entry[2]
			if id and not coinSeen[id] then
				coinSeen[id] = true
				table.insert(coinIds, id)
			end
			if pos then
				teleportTo(pos)
			end
		end
	end
end)

-- Coin flush.
local function flush()
	if not autoCoin or #coinIds == 0 then return end

	local batch = {}
	for i = 1, math.min(12, #coinIds) do
		table.insert(batch, table.remove(coinIds, 1))
	end

	for _, id in ipairs(batch) do
		coinSeen[id] = nil
	end

	fieldAct:FireServer("coins", batch)
end

-- Resolve the display name safely.
local function getHpName(hp)
	if not hp then return "" end
	if hp:IsA("BillboardGui") then
		local label = hp:FindFirstChildWhichIsA("TextLabel", true)
		if not label then return "" end
		return tostring(label.Text)
	end
	if hp:IsA("TextLabel") then return tostring(hp.Text) end
	if hp:IsA("StringValue") then return tostring(hp.Value) end
	return tostring(hp.Name)
end

-- Find highest-priority enemy (ties broken by distance).
local function findNearestEnemy()
	local fieldStuff = workspace:FindFirstChild("FieldStuff")
	local enemies = fieldStuff and fieldStuff:FindFirstChild("Enemies")
	local root = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not (enemies and root) then return nil end

	local best, bestPriority, bestDist = nil, math.huge, math.huge

	for _, enemy in ipairs(enemies:GetChildren()) do
		local hrp = enemy:FindFirstChild("HumanoidRootPart")
		if not hrp then continue end

		local head = enemy:FindFirstChild("Head")
		local hp = head and head:FindFirstChild("HP")
		if not hp then continue end

		local priority = PRIORITY_MAP[getHpName(hp)]
		if not priority then continue end

		local dist = (hrp.Position - root.Position).Magnitude
		if priority < bestPriority or (priority == bestPriority and dist < bestDist) then
			best, bestPriority, bestDist = enemy, priority, dist
		end
	end

	return best
end

-- Swing at highest-priority enemy.
local function trySwingEnemy()
	if not enemyLoop then return end
	if localPlayer:GetAttribute("MisoraInGame") == true then return end

	local enemy = findNearestEnemy()
	if not enemy then return end

	local enemyHrp = enemy:FindFirstChild("HumanoidRootPart")
	local root = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not (enemyHrp and root) then return end

	enemyTarget = enemy
	root.CFrame = enemyHrp.CFrame * CFrame.new(0, 3, 3)

	lastSwing = os.clock()
	fieldAct:FireServer("swing")
end

-- Build one row in the character list.
local function buildRow(index, enemy, text, priority)
	local row = Instance.new("Frame")
	row.Name = "Row_" .. index
	row.Size = UDim2.new(1, 0, 0, 24)
	row.BackgroundColor3 = priority and Color3.fromRGB(40, 70, 50) or Color3.fromRGB(30, 30, 40)
	row.BorderSizePixel = 0
	row.LayoutOrder = index
	row.Parent = scroll

	local rowCorner = Instance.new("UICorner")
	rowCorner.CornerRadius = UDim.new(0, 4)
	rowCorner.Parent = row

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -8, 1, 0)
	label.Position = UDim2.fromOffset(8, 0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.Font = Enum.Font.GothamBold
	label.TextSize = 11
	label.TextColor3 = priority and Color3.fromRGB(140, 255, 140) or Color3.fromRGB(180, 180, 200)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextTruncate = Enum.TextTruncate.AtEnd
	label.Parent = row

	if priority then
		local indicator = Instance.new("Frame")
		indicator.Size = UDim2.fromOffset(4, 4)
		indicator.AnchorPoint = Vector2.new(1, 0.5)
		indicator.Position = UDim2.new(1, -8, 0.5, 0)
		indicator.BackgroundColor3 = Color3.fromRGB(140, 255, 140)
		indicator.BorderSizePixel = 0
		indicator.Parent = row

		local indCorner = Instance.new("UICorner")
		indCorner.CornerRadius = UDim.new(1, 0)
		indCorner.Parent = indicator
	end
end

-- Rebuild the list from FieldStuff.Enemies.
local function refreshList()
	for _, child in ipairs(scroll:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end

	local fieldStuff = workspace:FindFirstChild("FieldStuff")
	local enemies = fieldStuff and fieldStuff:FindFirstChild("Enemies")
	if not enemies then
		scroll.CanvasSize = UDim2.new()
		return
	end

	local entries = {}
	for _, enemy in ipairs(enemies:GetChildren()) do
		local head = enemy:FindFirstChild("Head")
		local hp = head and head:FindFirstChild("HP")
		if not hp then continue end

		local text = getHpName(hp)
		if text == "" then continue end

		local priority = PRIORITY_MAP[text]
		table.insert(entries, { enemy = enemy, text = text, priority = priority })
	end

	-- Priority enemies first, then alphabetical.
	table.sort(entries, function(a, b)
		if a.priority and b.priority then return a.priority < b.priority end
		if a.priority then return true end
		if b.priority then return false end
		return a.text < b.text
	end)

	for index, entry in ipairs(entries) do
		buildRow(index, entry.enemy, entry.text, entry.priority)
	end

	scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end

task.spawn(function()
	while true do
		task.wait(0.15)
		flush()
	end
end)

task.spawn(function()
	while true do
		task.wait(0.1)
		trySwingEnemy()
	end
end)

task.spawn(function()
	while true do
		task.wait(1)
		refreshList()
	end
end)
