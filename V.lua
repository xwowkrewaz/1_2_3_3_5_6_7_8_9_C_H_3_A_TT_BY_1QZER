local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local SoundService = game:GetService("SoundService")
local VirtualInput = game:GetService("VirtualInputManager")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")


local character = player.Character or player.CharacterAdded:Wait()
local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
local humanoid = character:FindFirstChild("Humanoid")
local camera = workspace.CurrentCamera

local flying = false
local flySpeed = 60
local MaxFlySpeed = 555
local connection = nil
local preventJumpConnection = nil



local newGui = Instance.new("ScreenGui", playerGui)
newGui.Name = "A_W_E_S_O_M_E_3_5_782_LDAPROS_MENU_210291939228390282242526967676767_67_SIX_SEVEN_OMEGA-NEMEGA_NEGLARS_BY_BY__V2L_EZ"
newGui.ResetOnSpawn = false

local walkSpeed = humanoid.WalkSpeed
local jumpHeight = humanoid.JumpHeight

local newFrame = Instance.new("Frame", newGui)

newFrame.Name = "M_A_1_N----F_R_A_M_3----C_0_D_3---378921"
newFrame.Size = UDim2.new(0, 576, 0, 471)
newFrame.Position = UDim2.new(0.348, 0, 0.274, -2)
newFrame.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)

local UIDragDetector = Instance.new("UIDragDetector", newFrame)

local function UiCornerToFrame(frame, cornerRadius)
	local uiCorner = Instance.new("UICorner", frame)
	uiCorner.CornerRadius =  UDim.new(0, cornerRadius)
end

local StatusLabel = Instance.new("TextLabel", newGui)
StatusLabel.Size = UDim2.new(0, 620,0, 72)
StatusLabel.Position = UDim2.new(0.331, 0,0.095, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.new(1, 1, 1)
StatusLabel.TextScaled = true
StatusLabel.Text = "NAME FUNCTION: STATUS"
StatusLabel.Visible = false

local function StatusUpdate(name, status, w)
	StatusLabel.Text = name .. " : " .. w
	StatusLabel.Visible = true
	
	if status == true then
		StatusLabel.TextColor3 = Color3.new(0, 1, 0)
	elseif status == false then
		StatusLabel.TextColor3 = Color3.new(1, 0, 0)	
	end
	
	task.wait(0.7)
	StatusLabel.Visible = false
end


local WALKSPEEDLabel = Instance.new("TextLabel", newFrame)
WALKSPEEDLabel.Size = UDim2.new(0,200,0,50)
WALKSPEEDLabel.Position = UDim2.new(0.075, 0, 0.096, 0)
WALKSPEEDLabel.Text = "WalkSpeed"

local WALKSPEEDTextBox = Instance.new("TextBox", newFrame)
WALKSPEEDTextBox.Size  = UDim2.new(0,200, 0,50)
WALKSPEEDTextBox.Position = UDim2.new(0.075, 0, 0.242, 0)
WALKSPEEDTextBox.Text = walkSpeed
WALKSPEEDTextBox.TextScaled = true


local JUMPHEIGHTLabel = Instance.new("TextLabel", newFrame)
JUMPHEIGHTLabel.Size = UDim2.new(0,200,0,50)
JUMPHEIGHTLabel.Position = UDim2.new(0.566, 0,0.096, 0)
JUMPHEIGHTLabel.Text = "JumpHeight"

local JUMPHEIGHTTextBox = Instance.new("TextBox", newFrame)
JUMPHEIGHTTextBox.Size  = UDim2.new(0,200, 0,50)
JUMPHEIGHTTextBox.Position = UDim2.new(0.566, 0, 0.242, 0)
JUMPHEIGHTTextBox.Text = jumpHeight
JUMPHEIGHTTextBox.TextScaled = true

local ON_OFF = Instance.new("TextButton", newFrame)
ON_OFF.Size = UDim2.new(0, 200, 0, 50)
ON_OFF.Position = UDim2.new(0.075, 0, 0.732, 0)
ON_OFF.Text = "OFF"
ON_OFF.BackgroundColor3 = Color3.new(1, 0, 0)
ON_OFF.TextScaled = true

local statusWH = false

local WALLHALabel = Instance.new("TextLabel", newFrame)
WALLHALabel.Size = UDim2.new(0,200,0,50)
WALLHALabel.Position = UDim2.new(0.075, 0,0.561, 0)
WALLHALabel.Text = "WALLHACK"
WALLHALabel.TextScaled = true
WALLHALabel.BackgroundColor3 = Color3.new(1, 0.533333, 0)

local INFINITYJUMPBUTTON = Instance.new("TextButton", newFrame)	
INFINITYJUMPBUTTON.Size = UDim2.new(0, 200, 0, 50)
INFINITYJUMPBUTTON.Position = UDim2.new(0.566, 0, 0.732, 0)
INFINITYJUMPBUTTON.Text = "OFF"
INFINITYJUMPBUTTON.BackgroundColor3 = Color3.new(1, 0, 0)
INFINITYJUMPBUTTON.TextScaled = true

local InfJumpStatus = false

local INFINITYJUMPLabel = Instance.new("TextLabel", newFrame)
INFINITYJUMPLabel.Size = UDim2.new(0,200,0,50)
INFINITYJUMPLabel.Position = UDim2.new(0.566, 0,0.561, 0)
INFINITYJUMPLabel.Text = "INFINITY JUMP"
INFINITYJUMPLabel.TextScaled = true
INFINITYJUMPLabel.BackgroundColor3 = Color3.new(0.113725, 0.380392, 1)

INFINITYJUMPBUTTON.MouseButton1Click:Connect(function()
	if not InfJumpStatus then
		InfJumpStatus = true
		INFINITYJUMPBUTTON.BackgroundColor3 = Color3.new(0, 1, 0)
		INFINITYJUMPBUTTON.Text = "ON"
	elseif InfJumpStatus then
		InfJumpStatus = false
		INFINITYJUMPBUTTON.BackgroundColor3 = Color3.new(1, 0, 0)
		INFINITYJUMPBUTTON.Text = "OFF"
	end
end)

local MainButton = Instance.new("TextButton", newFrame)
MainButton.Name = "MAIN"
MainButton.Size = UDim2.new(0, 136, 0, 31)
MainButton.Position = UDim2.new(0.381, 0,0.915, 0)
MainButton.Text = "MAIN"
MainButton.TextScaled = true
MainButton.TextColor3 = Color3.new(1, 1, 1)
MainButton.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)

local InfoButton = Instance.new("TextButton", newFrame)
InfoButton.Name = "INFO"
InfoButton.Size = UDim2.new(0, 136, 0, 31)
InfoButton.Position = UDim2.new(0.09, 0,0.915, 0)
InfoButton.Text = "INFO"
InfoButton.TextScaled = true
InfoButton.TextColor3 = Color3.new(1, 1, 1)
InfoButton.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)

local OtherButton = Instance.new("TextButton", newFrame)
OtherButton.Name = "OTHER"
OtherButton.Size = UDim2.new(0, 136, 0, 31)
OtherButton.Position = UDim2.new(0.677, 0,0.915, 0)
OtherButton.Text = "OTHER"
OtherButton.TextScaled = true
OtherButton.TextColor3 = Color3.new(1, 1, 1)
OtherButton.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)

local InfoLabel = Instance.new("TextLabel", newFrame)
InfoLabel.Name = "InfoLabel"
InfoLabel.Text = "хуле сюда нажал, а ну сьебался быстро нахуй"
InfoLabel.Visible = false
InfoLabel.Size = UDim2.new(0, 473, 0, 274)
InfoLabel.Position = UDim2.new(0.088, 0, 0.155, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextScaled = true
InfoLabel.TextColor3 = Color3.new(1, 1, 1)

local FPSBoost = Instance.new("TextLabel", newFrame)
FPSBoost.Name = "FPSBoost"
FPSBoost.Visible = false
FPSBoost.Text = "FPS Boost"
FPSBoost.TextScaled = true
FPSBoost.TextColor3 = Color3.new(1, 1, 1)
FPSBoost.BackgroundTransparency = 1
FPSBoost.Size = UDim2.new(0, 144, 0, 50)
FPSBoost.Position = UDim2.new(0.082, 0, 0.123, 0)

local FPSBoostButton = Instance.new("TextButton", newFrame)
FPSBoostButton.Name = "FPSBoostButton"
FPSBoostButton.Visible = false
FPSBoostButton.Text = "OFF"
FPSBoostButton.TextScaled = true
FPSBoostButton.TextColor3 = Color3.new(0, 0, 0)
FPSBoostButton.BackgroundColor3 = Color3.new(1, 0, 0)
FPSBoostButton.Size = UDim2.new(0, 93,0, 38)
FPSBoostButton.Position = UDim2.new(0.37, 0,0.136, 0)

local FlyLabel = Instance.new("TextLabel", newFrame)
FlyLabel.Name = "FlyLabel"
FlyLabel.Visible = false
FlyLabel.Text = "Fly"
FlyLabel.TextScaled = true
FlyLabel.TextColor3 = Color3.new(1, 1, 1)
FlyLabel.BackgroundTransparency = 1
FlyLabel.Size = UDim2.new(0, 144, 0, 50)
FlyLabel.Position = UDim2.new(0.089, 0,0.397, 0)

local FlyButton =  Instance.new("TextButton", newFrame)
FlyButton.Name = "FlyButton"
FlyButton.Text = "OFF"
FlyButton.Visible = false
FlyButton.TextScaled = true
FlyButton.TextColor3 = Color3.new(0, 0, 0)
FlyButton.BackgroundColor3 = Color3.new(1, 0, 0)
FlyButton.Size = UDim2.new(0, 93,0, 38)
FlyButton.Position = UDim2.new(0.37, 0,0.41, 0)

local FlyTextBox = Instance.new("TextBox", newFrame)
FlyTextBox.Name = "FlyTextBox"
FlyTextBox.Visible = false
FlyTextBox.Text = "50"
FlyTextBox.TextScaled = true
FlyTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
FlyTextBox.Size = UDim2.new(0, 65,0, 38)
FlyTextBox.Position = UDim2.new(0.563, 0,0.41, 0)
FlyTextBox.PlaceholderText = "Speed"
FlyTextBox.PlaceholderColor3 = Color3.new(0.498039, 0.498039, 0.498039)

local MainFolder = Instance.new("Folder", newFrame)
MainFolder.Name = "MainFolder"

local OtherFolder = Instance.new("Folder", newFrame)
OtherFolder.Name = "OtherFolder"

local InfoFolder = Instance.new("Folder", newFrame)
InfoFolder.Name = "InfoFolder"

local FunctionsFolder = Instance.new("Folder", newFrame)
FunctionsFolder.Name = "FunctionsFolder"

local StatusBackground = Instance.new("TextLabel", newFrame)
StatusBackground.Name = "StatusBackground"
StatusBackground.Text = "Main"
StatusBackground.Size = UDim2.new(0, 200,0, 30)
StatusBackground.Position = UDim2.new(0.325, 0,0.013, 0)
StatusBackground.BackgroundTransparency = 1
StatusBackground.TextScaled = true
StatusBackground.TextColor3 = Color3.new(1, 1, 1)

local FunctionsFrame = Instance.new("Frame", FunctionsFolder)
FunctionsFrame.Name = "FunctionsFrame"
FunctionsFrame.Size = UDim2.new(0, 306,0, 471)
FunctionsFrame.Position = UDim2.new(-0.557, 0,0, 0)
FunctionsFrame.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)

local FunctionsLabel = Instance.new("TextLabel", FunctionsFrame)
FunctionsLabel.Name = "FunctionsLabel"
FunctionsLabel.Text = "Functions"
FunctionsLabel.Size = UDim2.new(0, 200,0, 30)
FunctionsLabel.Position = UDim2.new(0.171, 0,0.013, 0)
FunctionsLabel.BackgroundTransparency = 1
FunctionsLabel.TextScaled = true
FunctionsLabel.TextColor3 = Color3.new(1, 1, 1)

local TBLabel = Instance.new("TextLabel", FunctionsFrame)
TBLabel.Name = "TBLabel"
TBLabel.Text = "Trigger Bot(for blade ball, T to use"
TBLabel.TextScaled = true
TBLabel.TextColor3 = Color3.new(1, 1, 1)
TBLabel.BackgroundTransparency = 1
TBLabel.Size = UDim2.new(0, 133,0, 37)
TBLabel.Position = UDim2.new(0.045, 0,0.123, 0)

local TBButton = Instance.new("TextButton", FunctionsFrame)
TBButton.Name = "TBButton"
TBButton.Text = "OFF"
TBButton.TextColor3 = Color3.new(0, 0, 0)
TBButton.BackgroundColor3 = Color3.new(1, 0, 0)
TBButton.Size = UDim2.new(0, 93,0, 38)
TBButton.Position = UDim2.new(0.556, 0,0.123, 0)	
TBButton.TextScaled = true

local CopyAvatarLabel = Instance.new("TextLabel", newFrame)
CopyAvatarLabel.Name = "CopyAvatarLabel"
CopyAvatarLabel.Text = "Copy Avatar"
CopyAvatarLabel.Visible = false	
CopyAvatarLabel.TextScaled = true
CopyAvatarLabel.TextColor3 = Color3.new(1, 1, 1)
CopyAvatarLabel.BackgroundTransparency = 1
CopyAvatarLabel.Size = UDim2.new(0, 144,0, 50)
CopyAvatarLabel.Position = UDim2.new(0.082, 0,0.558, 0)

local CopyAvatarButton = Instance.new("TextButton", newFrame)
CopyAvatarButton.Name = "CopyAvatarButton"
CopyAvatarButton.Text = "Apply"
CopyAvatarButton.Visible = false
CopyAvatarButton.TextColor3 = Color3.new(0, 0, 0)
CopyAvatarButton.BackgroundColor3 = Color3.fromRGB(134, 227, 255)
CopyAvatarButton.Size = UDim2.new(0, 93,0, 38)
CopyAvatarButton.Position = UDim2.new(0.601, 0,0.571, 0)
CopyAvatarButton.TextScaled = true

local CopyAvatarTextBox = Instance.new("TextBox", newFrame)
CopyAvatarTextBox.Name = "CopyAvatarTextBox"
CopyAvatarTextBox.Visible = false
CopyAvatarTextBox.Text = ""
CopyAvatarTextBox.PlaceholderText = "ID"
CopyAvatarTextBox.TextScaled = true
CopyAvatarTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
CopyAvatarTextBox.Size = UDim2.new(0, 111,0, 38)
CopyAvatarTextBox.Position = UDim2.new(0.37, 0,0.571, 0)
CopyAvatarTextBox.PlaceholderColor3 = Color3.new(0.498039, 0.498039, 0.498039)


local CosmeticLabel = Instance.new("TextLabel", newFrame)
CosmeticLabel.Name = "Cosmetics"
CosmeticLabel.Text = "Cosmetics"
CosmeticLabel.TextScaled = true
CosmeticLabel.TextColor3 = Color3.new(1, 1, 1)
CosmeticLabel.BackgroundTransparency = 1
CosmeticLabel.Visible = false
CosmeticLabel.Size = UDim2.new(0, 144,0, 50)
CosmeticLabel.Position = UDim2.new(0.082, 0,0.257, 0)

local CosmeticButton = Instance.new("TextButton", newFrame)
CosmeticButton.Name = "CosmeticButton"
CosmeticButton.Text = "OPEN"
CosmeticButton.TextScaled = true
CosmeticButton.Visible = false
CosmeticButton.TextColor3 = Color3.new(0, 0, 0)
CosmeticButton.BackgroundColor3 = Color3.new(0, 1, 0)
CosmeticButton.Size = UDim2.new(0, 93,0, 38)
CosmeticButton.Position = UDim2.new(0.37, 0,0.27, 0)

local CosmFrame = Instance.new("Frame", newFrame)
CosmFrame.Name = "CosmeticsFrame"
CosmFrame.Visible = false
CosmFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CosmFrame.Size = UDim2.new(0, 306,0, 471)
CosmFrame.Position = UDim2.new(4.036, 0,-3.342, 0)


local MacrosLabel = Instance.new("TextLabel", newFrame)
MacrosLabel.Name = "MacrosLabel"
MacrosLabel.Text = "Macros(for blade ball, press E to activate)"
MacrosLabel.Visible = false	
MacrosLabel.TextScaled = true
MacrosLabel.TextColor3 = Color3.new(1, 1, 1)
MacrosLabel.BackgroundTransparency = 1
MacrosLabel.Size = UDim2.new(0, 144,0, 50)
MacrosLabel.Position = UDim2.new(0.082, 0,0.724, 0)

local MacrosButton = Instance.new("TextButton", newFrame)
MacrosButton.Name = "MacrosButton"
MacrosButton.Text = "OFF"
MacrosButton.Visible = false
MacrosButton.TextScaled = true
MacrosButton.TextColor3 = Color3.new(0, 0, 0)
MacrosButton.BackgroundColor3 = Color3.new(1, 0, 0)
MacrosButton.Size = UDim2.new(0, 93,0, 38)
MacrosButton.Position = UDim2.new(0.37, 0,0.737, 0)

local PackLabel = Instance.new("TextLabel", newFrame)
PackLabel.Name = "PackLabel"
PackLabel.Text = "Pack: Korblox"
PackLabel.TextScaled = true
PackLabel.TextColor3 = Color3.new(1, 1, 1)
PackLabel.BackgroundTransparency = 1
PackLabel.Visible = true
PackLabel.Size = UDim2.new(0, 200,0, 44)
PackLabel.Position = UDim2.new(0.173, 0,0.03, 0)
PackLabel.Font = Enum.Font.GothamBold
PackLabel.Parent = CosmFrame

local PacksFrame = Instance.new("Frame", newFrame)
PacksFrame.Name = "PacksFrame"
PacksFrame.Visible = true
PacksFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
PacksFrame.Size = UDim2.new(0, 306,0, 75)
PacksFrame.Position = UDim2.new(-0.002, 0,-0.174, 0)
PacksFrame.Parent = CosmFrame

local UICridLayout = Instance.new("UIGridLayout", PacksFrame)
UICridLayout.CellSize = UDim2.new(0, 69, 0, 75)
UICridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UICridLayout.FillDirection = Enum.FillDirection.Horizontal
UICridLayout.FillDirectionMaxCells = 0
UICridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left

local ResetAllButton = Instance.new("TextButton", newFrame)
ResetAllButton.Name = "ResetAllButton"
ResetAllButton.Text = "Reset All"
ResetAllButton.TextScaled = true
ResetAllButton.Visible = true
ResetAllButton.TextColor3 = Color3.new(1, 1, 1)
ResetAllButton.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
ResetAllButton.Size = UDim2.new(0, 200, 0, 38)
ResetAllButton.Position = UDim2.new(0.18, 0,0.9, 0)
ResetAllButton.Font = Enum.Font.GothamBold
ResetAllButton.Parent = CosmFrame

-- init CORNER --


UiCornerToFrame(newFrame, 12)
UiCornerToFrame(CosmFrame, 12)
UiCornerToFrame(FunctionsFrame, 12)

-- ad12 --

local function ShablonButtonPacks(button: TextButton, name, text)
	button.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
	button.Parent = PacksFrame
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Visible = true
	button.TextScaled = true
	button.Font = Enum.Font.GothamBold
	button.Text = text
    button.Name = name
end

local Korblox_Button = Instance.new("TextButton")
local Headless_Button = Instance.new("TextButton")
local TentacliedAlien_Button = Instance.new("TextButton")
local Gunslinger_Button = Instance.new("TextButton")


ShablonButtonPacks(Gunslinger_Button, "Gunslinger_Button", "Gunslinger Pack")
ShablonButtonPacks(TentacliedAlien_Button, "TentacliedAlien_Button", "Tentaclied Alien Pack")
ShablonButtonPacks(Headless_Button, "Headless_Button", "Headless Pack")
ShablonButtonPacks(Korblox_Button, "Korblox_Button", "Korblox Pack")




local function ShablonButtonV1(button: TextButton, torso)
	if not torso then
	button.BackgroundColor3 = Color3.fromRGB(191, 191, 191)
	else
		button.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
	end
	button.Parent = CosmFrame
	button.TextTransparency = 1
	button.Visible = true
	
	local uiCorner = Instance.new("UICorner", button)
	uiCorner.CornerRadius = UDim.new(0, 6)
end

local HeadButton = Instance.new("TextButton", newFrame)
HeadButton.Name = "HeadButton"
HeadButton.Size = UDim2.new(0, 68, 0, 68)
HeadButton.Position = UDim2.new(0.386, 0, 0.176, 0)
HeadButton.Text = ""

local TorsoButton = Instance.new("TextButton", newFrame)
TorsoButton.Name = "TorsoButton"
TorsoButton.Size = UDim2.new(0, 114, 0, 124)
TorsoButton.Position = UDim2.new(0.32, 0, 0.338, 0)
TorsoButton.Text = ""

local LeftArmButton = Instance.new("TextButton", newFrame)
LeftArmButton.Name = "LeftArmButton"
LeftArmButton.Size = UDim2.new(0, 59, 0, 124)
LeftArmButton.Position = UDim2.new(0.101, 0, 0.338, 0) 
LeftArmButton.Text = ""

local RightArmButton = Instance.new("TextButton", newFrame)
RightArmButton.Name = "RightArmButton"
RightArmButton.Size = UDim2.new(0, 59, 0, 124)
RightArmButton.Position = UDim2.new(0.716, 0, 0.338, 0) 
RightArmButton.Text = ""

local LeftLegButton = Instance.new("TextButton", newFrame)
LeftLegButton.Name = "LeftLegButton"
LeftLegButton.Size = UDim2.new(0, 51, 0, 114)
LeftLegButton.Position = UDim2.new(0.32, 0, 0.614, 0)
LeftLegButton.Text = ""

local RightLegButton = Instance.new("TextButton", newFrame)
RightLegButton.Name = "RightLegButton"
RightLegButton.Size = UDim2.new(0, 51, 0, 114)
RightLegButton.Position = UDim2.new(0.526, 0, 0.614, 0)
RightLegButton.Text = ""

-- apply shablons --

ShablonButtonV1(HeadButton, false)
ShablonButtonV1(TorsoButton, true)
ShablonButtonV1(LeftArmButton, false)
ShablonButtonV1(RightArmButton, false)
ShablonButtonV1(LeftLegButton, false)
ShablonButtonV1(RightLegButton, false)

-- close --

-- Re:Location --
WALKSPEEDLabel.Parent = MainFolder
JUMPHEIGHTLabel.Parent = MainFolder
WALKSPEEDTextBox.Parent = MainFolder
JUMPHEIGHTTextBox.Parent = MainFolder
WALLHALabel.Parent = MainFolder
ON_OFF.Parent = MainFolder
INFINITYJUMPLabel.Parent = MainFolder
INFINITYJUMPBUTTON.Parent = MainFolder

InfoLabel.Parent = InfoFolder

FPSBoost.Parent = OtherFolder
FPSBoostButton.Parent = OtherFolder
FlyLabel.Parent = OtherFolder
FlyButton.Parent = OtherFolder
CosmeticLabel.Parent = OtherFolder
CosmeticButton.Parent = OtherFolder
FlyTextBox.Parent = OtherFolder
CopyAvatarLabel.Parent = OtherFolder
CopyAvatarButton.Parent = OtherFolder
CopyAvatarTextBox.Parent = OtherFolder
CosmFrame.Parent = CosmeticButton
MacrosLabel.Parent = OtherFolder
MacrosButton.Parent = OtherFolder

-- FLY SYSTEM --
local keys = {
	W = false,
	A = false,
	S = false,
	D = false,
	Space = false,
	Ctrl = false
}

local flyInputConnections = {}
local EnabledFly = false

local function createFlightParts()
	local flightHold = Instance.new("BodyPosition")
	flightHold.Name = "FlightHold"
	flightHold.D = 1000
	flightHold.P = 10000
	flightHold.maxForce = Vector3.new(flightHold.P, flightHold.P, flightHold.P)
	flightHold.Parent = torso

	local flightPower = Instance.new("BodyVelocity")
	flightPower.Name = "FlightPower"
	flightPower.P = 1000
	flightPower.maxForce = Vector3.new(flightPower.P * 100, flightPower.P * 100, flightPower.P * 100)
	flightPower.Parent = torso

	local flightSpin = Instance.new("BodyGyro")
	flightSpin.Name = "FlightSpin"
	flightSpin.D = 1000
	flightSpin.P = 10000
	flightSpin.maxTorque = Vector3.new(flightSpin.P, flightSpin.P, flightSpin.P)
	flightSpin.Parent = torso

	return flightHold, flightPower, flightSpin
end

local function destroyFlightParts()
	local parts = {"FlightHold", "FlightPower", "FlightSpin"}
	for _, partName in ipairs(parts) do
		local part = torso:FindFirstChild(partName)
		if part then
			part:Destroy()
		end
	end
end

local function disableJump(disable)
	if preventJumpConnection then
		preventJumpConnection:Disconnect()
		preventJumpConnection = nil
	end

	if disable then
		preventJumpConnection = humanoid.Changed:Connect(function(property)
			if property == "Jump" then
				humanoid.Jump = false
			end
		end)
	end
end

local function stopFlight()
	if not flying then return end

	flying = false

	if connection then
		connection:Disconnect()
		connection = nil
	end

	destroyFlightParts()

	if humanoid and humanoid.Parent then
		humanoid.WalkSpeed = 16
		humanoid.PlatformStand = false
		humanoid.AutoRotate = true
		disableJump(false)

		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if rootPart then
			rootPart.Velocity = Vector3.new(0, 0, 0)
			rootPart.RotVelocity = Vector3.new(0, 0, 0)
		end

		humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
	end
end

local function startFlight()
	if flying then return end

	if not torso or not humanoid then return end

	local flightHold, flightPower, flightSpin = createFlightParts()

	flying = true
	humanoid.WalkSpeed = 0
	humanoid.PlatformStand = true
	humanoid.AutoRotate = false
	disableJump(true)

	connection = RunService.RenderStepped:Connect(function()
		if not flying or not torso or not humanoid or humanoid.Health <= 0 then
			stopFlight()
			return
		end

		local moveVector = Vector3.new(0, 0, 0)
		local cameraCFrame = camera.CFrame

		local forwardVector = cameraCFrame.LookVector
		local rightVector = cameraCFrame.RightVector
		local upVector = cameraCFrame.UpVector
		

		if keys.W then
			moveVector = moveVector + forwardVector * flySpeed
		end
		if keys.S then
			moveVector = moveVector - forwardVector * flySpeed
		end
		if keys.D then
			moveVector = moveVector + rightVector * flySpeed
		end
		if keys.A then
			moveVector = moveVector - rightVector * flySpeed
		end
		if keys.Space then
			moveVector = moveVector + upVector * flySpeed
		end
		if keys.Ctrl then
			moveVector = moveVector - upVector * flySpeed
		end

		if moveVector.Magnitude < 0.1 then
			flightHold.maxForce = Vector3.new(flightHold.P, flightHold.P, flightHold.P)
			flightPower.maxForce = Vector3.new(0, 0, 0)
			flightHold.Position = torso.Position
		else
			flightHold.maxForce = Vector3.new(0, 0, 0)
			flightPower.maxForce = Vector3.new(flightPower.P * 100, flightPower.P * 100, flightPower.P * 100)
			flightPower.Velocity = moveVector
		end

		local lookDirection = forwardVector
		if lookDirection.Magnitude > 0 then
			flightSpin.CFrame = CFrame.new(torso.Position, torso.Position + lookDirection)
		end
	end)
end

local function enableFlyFeature()
	if EnabledFly then return end
	EnabledFly = true

	FlyButton.Text = "ON"
	FlyButton.BackgroundColor3 = Color3.new(0, 1, 0)

	local inputBeganConnection = UIS.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end

		if EnabledFly then
			local key = input.KeyCode

			if key == Enum.KeyCode.U then
				if flying then
					stopFlight()
					print("fly disabled")
				else
					if character and humanoid and humanoid.Health > 0 then
						startFlight()
						print("fly enabled")
					end
				end
			end

			if key == Enum.KeyCode.W then keys.W = true end
			if key == Enum.KeyCode.A then keys.A = true end
			if key == Enum.KeyCode.S then keys.S = true end
			if key == Enum.KeyCode.D then keys.D = true end
			if key == Enum.KeyCode.Space then keys.Space = true end
			if key == Enum.KeyCode.LeftControl then keys.Ctrl = true end
		end
	end)

	local inputEndedConnection = UIS.InputEnded:Connect(function(input, gameProcessed)
		if gameProcessed then return end

		if EnabledFly then
			local key = input.KeyCode

			if key == Enum.KeyCode.W then keys.W = false end
			if key == Enum.KeyCode.A then keys.A = false end
			if key == Enum.KeyCode.S then keys.S = false end
			if key == Enum.KeyCode.D then keys.D = false end
			if key == Enum.KeyCode.Space then keys.Space = false end
			if key == Enum.KeyCode.LeftControl then keys.Ctrl = false end
		end
	end)

	flyInputConnections = {inputBeganConnection, inputEndedConnection}
end

local function disableFlyFeature()
	if not EnabledFly then return end

	EnabledFly = false
	FlyButton.Text = "OFF"
	FlyButton.BackgroundColor3 = Color3.new(1, 0, 0)

	stopFlight()

	for _, conn in ipairs(flyInputConnections) do
		if conn then
			conn:Disconnect()
		end
	end
	flyInputConnections = {}

	for k in pairs(keys) do
		keys[k] = false
	end
end

FlyButton.MouseButton1Click:Connect(function()
	if EnabledFly then
		disableFlyFeature()
		print("Fly feature DISABLED")
	else
		enableFlyFeature()
		print("Fly feature ENABLED")
	end
end)

local function onCharacterAdded(newCharacter)
	character = newCharacter
	humanoid = character:WaitForChild("Humanoid")
	torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")

	if EnabledFly and flying then
		stopFlight()
	end
end

player.CharacterAdded:Connect(onCharacterAdded)

-- AVATAR COPY FUNCTION --

local copyConnection = nil

local function cleanAvatar()

	if not character then
		character = player.CharacterAdded:Wait()
	end

	for _, child in ipairs(character:GetChildren()) do
		if child:IsA("Accessory") or 
			child:IsA("Hat") or 
			child:IsA("Shirt") or 
			child:IsA("Pants") or 
			child:IsA("ShirtGraphic") or
			child:IsA("CharacterMesh") then
			child:Destroy()
		end
	end

	local backpack = player:FindFirstChild("Backpack")
	if backpack then
		for _, tool in ipairs(backpack:GetChildren()) do
			if tool:IsA("Shirt") or tool:IsA("Pants") or tool:IsA("ShirtGraphic") then
				tool:Destroy()
			end
		end
	end

	print("Avatar cleaned! All clothes and accessories removed.")
end

local function applyAvatar(targetUserId)
	local success, description = pcall(function()
		return Players:GetHumanoidDescriptionFromUserId(targetUserId)
	end)

	if not success or not description then
		warn("Failed to get avatar description")
		return false
	end

	local character = player.Character
	if not character then
		warn("No character found")
		return false
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		warn("No humanoid found")
		return false
	end

	local applied = pcall(function()
		if humanoid.ApplyDescriptionClientServer then
			humanoid:ApplyDescriptionClientServer(description)
		else
			humanoid:ApplyDescription(description)
		end
	end)

	if applied then

		print("Avatar applied successfully!")
	
		return true
	else
		warn("Failed to apply avatar")
		return false
	end
end

CopyAvatarTextBox:GetPropertyChangedSignal("Text"):Connect(function()
	local text = CopyAvatarTextBox.Text
	local onlyNumbers = text:gsub("[^%d]", "")

	if text ~= onlyNumbers then
		CopyAvatarTextBox.Text = onlyNumbers
	end
end)

CopyAvatarButton.MouseButton1Click:Connect(function()

	local id = tonumber(CopyAvatarTextBox.Text)

    cleanAvatar()
	applyAvatar(id) 
	
	copyConnection = player.CharacterAdded:Connect(function(character)

		task.wait(0.25)
		
		cleanAvatar()
		applyAvatar(id)
	
	end)
end)

-- COSMETICS FUNCTION --

local cosmeticsConnection = nil
local CosmeticsEnabled = false

local Packs = {
	Korblox = {
		Name = "Korblox",
		Head = {Mesh = nil, Texture = nil, Transparent = true, UseHeadlessFunc = false, HasHat = true, Alien = false},
		Torso = {Mesh = "101851389", Texture = "101851254", Transparent = false},
		LeftArm = {Mesh = "101851531", Texture = "101851254", Transparent = false},
		RightArm = {Mesh = "101851623", Texture = "101851254", Transparent = false},
		LeftLeg = {Mesh = "101851582", Texture = "101851254", Transparent = false},
		RightLeg = {Mesh = "101851696", Texture = "101851254", Transparent = false},
	},
	Headless = {
		Name = "Headless",
		Head = {Mesh = nil, Texture = nil, Transparent = false, UseHeadlessFunc = true, HasHat = false, Alien = false},
		Torso = {Mesh = "133936470", Texture = "133936439", Transparent = false},
		LeftArm = {Mesh = "133936455", Texture = "133936439", Transparent = false},
		RightArm = {Mesh = "133936497", Texture = "133936439", Transparent = false},
		LeftLeg = {Mesh = "133936488", Texture = "133936439", Transparent = false},
		RightLeg = {Mesh = "133936505", Texture = "133936439", Transparent = false},
	},
	TentacledAlien = {
		Name = "TentacledAlien",
		Head = {Mesh = nil, Texture = nil, Transparent = false, UseHeadlessFunc = false, HasHat = false, Alien = true},
		Torso = {Mesh = "27493004", Texture = nil, Transparent = false},
		LeftArm = {Mesh = "27492984", Texture = nil, Transparent = false},
		RightArm = {Mesh = "27493061", Texture = nil, Transparent = false},
		LeftLeg = {Mesh = "27493033", Texture = nil, Transparent = false},
		RightLeg = {Mesh = "27493073", Texture = nil, Transparent = false},
	},
	Gunslinger = {
		Name = "Gunslinger",
		Head = {Mesh = nil, Texture = nil, Transparent = false, UseHeadlessFunc = false, HasHat = false, Alien = false},
		Torso = {Mesh = "32332055", Texture = nil, Transparent = false},
		LeftArm = {Mesh = "32331863", Texture = nil, Transparent = false},
		RightArm = {Mesh = "32331968", Texture = nil, Transparent = false},
		LeftLeg = {Mesh = "32331927", Texture = nil, Transparent = false},
		RightLeg = {Mesh = "32332020", Texture = nil, Transparent = false},
	},
}

local partPack = {
	Head = "Korblox",
	Torso = "Korblox",
	LeftArm = "Korblox",
	RightArm = "Korblox",
	LeftLeg = "Korblox",
	RightLeg = "Korblox",
}

local activeParts = {
	Head = false,
	Torso = false,
	LeftArm = false,
	RightArm = false,
	LeftLeg = false,
	RightLeg = false,
}

local currentPack = "Korblox"
local partButtons = {}

local function headless(character)
	local head = character:FindFirstChild("Head")
	if head then
		head.Transparency = 1
		local face = head:FindFirstChild("face")
		if face then
			face.Transparency = 1
		end
	end
end

local function removeHeadless(character)
	local head = character:FindFirstChild("Head")
	if head then
		head.Transparency = 0
		local face = head:FindFirstChild("face")
		if face then
			face.Transparency = 0
		end
	end
end

local function makeHeadTransparent(character)
	local head = character:FindFirstChild("Head")
	if head then
		head.Transparency = 1
		local face = head:FindFirstChild("face")
		if face then
			face.Transparency = 1
		end
	end
end

local function makeHeadVisible(character)
	local head = character:FindFirstChild("Head")
	if head then
		head.Transparency = 0
		local face = head:FindFirstChild("face")
		if face then
			face.Transparency = 0
		end
	end
end

local function addKorbloxHat(character)
	local oldHat = character:FindFirstChild("KorbloxDeathwalker")
	if oldHat then oldHat:Destroy() end

	local hat = Instance.new("Accessory")
	hat.Name = "KorbloxDeathwalker"

	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(1.5, 1.5, 1.5)
	handle.CanCollide = false
	handle.Transparency = 0
	handle.Parent = hat

	local mesh = Instance.new("SpecialMesh")
	mesh.MeshId = "rbxassetid://139609457"
	mesh.TextureId = "rbxassetid://139609495"
	mesh.Scale = Vector3.new(2, 2, 2)
	mesh.Parent = handle

	local head = character:FindFirstChild("Head")
	if head then
		local weld = Instance.new("WeldConstraint")
		weld.Part0 = handle
		weld.Part1 = head
		weld.Parent = handle
		handle.CFrame = head.CFrame * CFrame.new(0, 0.5, 0)
	end

	hat.Parent = character

	local RunService = game:GetService("RunService")
	local connection
	connection = RunService.RenderStepped:Connect(function()
		if hat and hat.Parent and head and head.Parent then
			handle.CFrame = head.CFrame * CFrame.new(0, 0.5, 0)
		else
			connection:Disconnect()
		end
	end)
end

local function removeKorbloxHat(character)
	local hat = character:FindFirstChild("KorbloxDeathwalker")
	if hat then
		hat:Destroy()
	end
end

local function AddAlienHat(character)
	local oldHat = character:FindFirstChild("Head"):FindFirstChild("AlienHat")
	if oldHat then
		oldHat:Destroy()
	end
	
	local newHatAlien = Instance.new("SpecialMesh")
	newHatAlien.Name = "AlienHat"
	newHatAlien.MeshId = "http://www.roblox.com/asset/?id=13827689"
	newHatAlien.TextureId = "rbxassetid://20908610"
	newHatAlien.MeshType = Enum.MeshType.FileMesh
	newHatAlien.Scale = Vector3.new(1, 1.02, 1)
	newHatAlien.Parent = character:FindFirstChild("Head")
	
	local face = character:WaitForChild("Head"):WaitForChild("face")
	face.Transparency = 1
end

local function RemoveAlienHat(character)
	local AlienHat = character:FindFirstChild("Head"):FindFirstChild("AlienHat")
	if AlienHat then
		AlienHat:Destroy()
	end
	
	local face = character:FindFirstChild("Head"):FindFirstChild("face")
	face.Transparency = 0
end

local function clearCharacterMesh(character, bodyPart)
	if not character then return end
	for _, v in ipairs(character:GetChildren()) do
		if v:IsA("CharacterMesh") and v.Name == ("Cosmetic_" .. tostring(bodyPart)) then
			v:Destroy()
		end
	end
end

local function clearAllMeshes(character)
	if not character then return end
	for _, v in ipairs(character:GetChildren()) do
		if v:IsA("CharacterMesh") and string.find(v.Name, "Cosmetic_") then
			v:Destroy()
		end
	end
end

local function applyBodyPart(character, bodyPart)
	if not character then return end

	local pack = partPack[bodyPart]
	local partData = Packs[pack][bodyPart]

	clearCharacterMesh(character, bodyPart)

	if activeParts[bodyPart] == false then
		if bodyPart == "Head" then
			removeHeadless(character)
			removeKorbloxHat(character)
			makeHeadVisible(character)
		end
		return 
	end

	if bodyPart == "Head" and partData and partData.UseHeadlessFunc then
		headless(character)
		removeKorbloxHat(character)
		return
	end

	if bodyPart == "Head" and partData and partData.HasHat then
		addKorbloxHat(character)
		makeHeadTransparent(character)
	end
	
	if bodyPart == "Head" and partData and partData.Alien then
		AddAlienHat(character)
	end

	if bodyPart == "Head" and not partData.HasHat and not partData.UseHeadlessFunc then
		removeHeadless(character)
	end

	if partData and partData.Mesh then
		local characterMesh = Instance.new("CharacterMesh")
		characterMesh.Name = "Cosmetic_" .. tostring(bodyPart)
		characterMesh.MeshId = partData.Mesh
		characterMesh.BodyPart = bodyPart
		characterMesh.BaseTextureId = 0
		characterMesh.OverlayTextureId = partData.Texture or 0
		characterMesh.Parent = character
	end
end

local function updateAllCosmetics(character)
	if not character or not CosmeticsEnabled then return end
	character:WaitForChild("Humanoid")

	for bodyPart, enabled in pairs(activeParts) do
		if enabled then
			applyBodyPart(character, bodyPart)
		else
			clearCharacterMesh(character, bodyPart)
			if bodyPart == "Head" then
				removeHeadless(character)
				removeKorbloxHat(character)
				makeHeadVisible(character)
			end
		end
	end
end

local function refreshButtons()
	local defaultColors = {
		Head = Color3.fromRGB(191, 191, 191),
		Torso = Color3.fromRGB(106, 106, 106),
		LeftArm = Color3.fromRGB(191, 191, 191),
		RightArm = Color3.fromRGB(191, 191, 191),
		LeftLeg = Color3.fromRGB(191, 191, 191),
		RightLeg = Color3.fromRGB(191, 191, 191),
	}

	for bodyPart, enabled in pairs(activeParts) do
		local button = partButtons[bodyPart]
		if button then
			if enabled then
				button.BackgroundColor3 = Color3.fromRGB(13, 191, 0)
			else
				button.BackgroundColor3 = defaultColors[bodyPart]
			end
		end
	end
end

local function togglePart(partName)
	activeParts[partName] = not activeParts[partName]

	if activeParts[partName] then
		partPack[partName] = currentPack
	end

	refreshButtons()

	if CosmeticsEnabled and player.Character then
		if activeParts[partName] then
			applyBodyPart(player.Character, partName)
		else
			clearCharacterMesh(player.Character, partName)
			if partName == "Head" then
				removeHeadless(player.Character)
				removeKorbloxHat(player.Character)
				RemoveAlienHat(player.Character)
				makeHeadVisible(player.Character)
			end
		end
	end

	print(partName, activeParts[partName] and "enabled" or "disabled", "Pack:", partPack[partName])
end

local function switchPack(packName)
	currentPack = packName
	print("Current pack set to:", packName)
	PackLabel.Text = "Pack: " .. packName
end

local function setupCharacter(character)
	task.wait(1)
	updateAllCosmetics(character)
end

local function setupPartButton(button, partName)
	if not button then return end
	partButtons[partName] = button
	button.MouseButton1Click:Connect(function()
		togglePart(partName)
	end)
end

setupPartButton(HeadButton, "Head")
setupPartButton(TorsoButton, "Torso")
setupPartButton(LeftArmButton, "LeftArm")
setupPartButton(RightArmButton, "RightArm")
setupPartButton(LeftLegButton, "LeftLeg")
setupPartButton(RightLegButton, "RightLeg")

if Korblox_Button then
	Korblox_Button.MouseButton1Click:Connect(function()
		switchPack("Korblox")
	end)
end

if Headless_Button then
	Headless_Button.MouseButton1Click:Connect(function()
		switchPack("Headless")
	end)
end

if TentacliedAlien_Button then
	TentacliedAlien_Button.MouseButton1Click:Connect(function()
		switchPack("TentacledAlien")
	end)
end

if Gunslinger_Button then
	Gunslinger_Button.MouseButton1Click:Connect(function()
		switchPack("Gunslinger")
	end)
end

CosmeticButton.MouseButton1Click:Connect(function()
	if CosmeticsEnabled == false then
		CosmeticsEnabled = true
		CosmeticButton.Text = "CLOSE"
		CosmeticButton.BackgroundColor3 = Color3.new(0, 1, 0)
		CosmFrame.Visible = true

		if player.Character then
			updateAllCosmetics(player.Character)
		end

		if cosmeticsConnection then
	cosmeticsConnection:Disconnect()
		end

		cosmeticsConnection = player.CharacterAdded:Connect(function(character)
			setupCharacter(character)
		end)
	else
		CosmeticsEnabled = false
		CosmeticButton.Text = "OPEN"
		CosmeticButton.BackgroundColor3 = Color3.new(1, 0, 0)
		CosmFrame.Visible = false

	--	if player.Character then
		--	clearAllMeshes(player.Character)
		--	removeHeadless(player.Character)
		--	removeKorbloxHat(player.Character)
		--	makeHeadVisible(player.Character)
	--	end

		if cosmeticsConnection then
			cosmeticsConnection:Disconnect()
			cosmeticsConnection = nil
		end
	end
end)

ResetAllButton.MouseButton1Click:Connect(function()
	if player.Character then
			clearAllMeshes(player.Character)
			removeHeadless(player.Character)
			removeKorbloxHat(player.Character)
			RemoveAlienHat(player.Character)
			makeHeadVisible(player.Character)
			
		activeParts.Head = false
		activeParts.Torso = false
		activeParts.LeftArm = false
		activeParts.RightArm = false
		activeParts.LeftLeg = false
		activeParts.RightLeg = false
		
		refreshButtons()
			end
end)


print("Cosmetics system loaded!")



-- FUNCTIONS --
local function ClearBackground(clear)
	for _, v in ipairs(clear:GetChildren()) do
		v.Visible = false
	end
end

local function openBackground(open)
	for _, v in ipairs(open:GetChildren()) do
		v.Visible = true
	end
end

local function background(status)
	if status == "Main" then
		ClearBackground(OtherFolder)
		ClearBackground(InfoFolder)
		StatusBackground.Text = "Main"

	elseif status == "Info" then
		ClearBackground(OtherFolder)
		ClearBackground(MainFolder)
		StatusBackground.Text = "Info"

	elseif status == "Other" then
		ClearBackground(InfoFolder)
		ClearBackground(MainFolder)
		StatusBackground.Text = "Other"

	end
end

MainButton.MouseButton1Click:Connect(function()
	background("Main")
	openBackground(MainFolder)
end)

InfoButton.MouseButton1Click:Connect(function()
	background("Info")
	openBackground(InfoFolder)
end)

OtherButton.MouseButton1Click:Connect(function()
	background("Other")
	openBackground(OtherFolder)
end)



--close AFM



-- macros function for blade ball --

local SpamState = false
local spamEnabled = false
local spamConnection = nil
local keyBindMacros = Enum.KeyCode.F
local macrosEnabled = false

local function startSpam()
	if spamConnection then return end
	spamConnection = game:GetService("RunService").RenderStepped:Connect(function()
		if spamEnabled and macrosEnabled then
			VirtualInput:SendKeyEvent(true, keyBindMacros, false, game)
			task.wait(0.025)
			VirtualInput:SendKeyEvent(false, keyBindMacros, false, game)
		end
	end)
end

local function stopSpam()
	if spamConnection then
		spamConnection:Disconnect()
		spamConnection = nil
	end
end

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E and macrosEnabled then
		spamEnabled = not spamEnabled
		if spamEnabled then
			startSpam()
			print("Spam mode ENABLED")
		else
			stopSpam()
			print("Spam mode DISABLED")
		end
	end
end)

MacrosButton.MouseButton1Click:Connect(function()
	if SpamState == false then
		SpamState = true
		macrosEnabled = true
		MacrosButton.Text = "ON"
		MacrosButton.BackgroundColor3 = Color3.new(0, 1, 0)
	else
		SpamState = false
		macrosEnabled = false
		spamEnabled = false
		MacrosButton.Text = "OFF"
		MacrosButton.BackgroundColor3 = Color3.new(1, 0, 0)
		stopSpam()
		print("Macros OFF")
	end
end)

-- close function macros code (203_21341)_1

-- Trigger Bot blade ball function --


local TriggerActive = false
local HasShot = false
local TriggerBotState = false

local function IsRedHighlight(character)
	if not character then return false end
	local highlight = character:FindFirstChildWhichIsA("Highlight")
	if not highlight or not highlight.Enabled then return false end
	local color = highlight.FillColor
	return color.R > 0.7 and color.G < 0.3 and color.B < 0.3
end

local function Shoot()
	VirtualInput:SendKeyEvent(true, Enum.KeyCode.F, false, game)
	task.wait(0.02)
	VirtualInput:SendKeyEvent(false, Enum.KeyCode.F, false, game)
end

TBButton.MouseButton1Click:Connect(function()
	if TriggerBotState == false then
		TriggerBotState = true
	TBButton.Text = "ON"
	TBButton.BackgroundColor3 = Color3.new(0, 1, 0)
	--StatusUpdate("TriggerBot", true, "Enabled")
	else
		TriggerBotState = false
	TBButton.Text = "OFF"
	TBButton.BackgroundColor3 = Color3.new(1, 0, 0)
	TriggerActive = false
	--	StatusUpdate("TriggerBot", false, "Disabled")
	end
end)
	

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.T and TriggerBotState then
		TriggerActive = not TriggerActive
		HasShot = false
		print(TriggerActive and "Triggerbot ON" or "Triggerbot OFF")
		StatusUpdate("TriggerBot", TriggerActive, TriggerActive and "Enabled" or "Disabled")
	end
end)

RunService.RenderStepped:Connect(function()
	if not TriggerActive then return end

	if IsRedHighlight(player.Character) then
		if not HasShot then
			Shoot()
			HasShot = true
		end
	else
		HasShot = false
	end
end)

print("Triggerbot loaded")


-- close tb bb f (203_321_-01)

local function FPS_BOOST(on)
	if on then
		for _, v in ipairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.Material = Enum.Material.SmoothPlastic
			elseif v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("Texture") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") then
				v.Enabled = false
			elseif v:IsA("Beam") then
				v.Enabled = false
			elseif v:IsA("Trail") then
				v.Enabled = false
			elseif v:IsA("BillboardGui") then
				v.Enabled = false
			elseif v:IsA("SurfaceGui") then
				v.Enabled = false
			end
		end
	elseif not on then
		for _, v in ipairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.Material = Enum.Material.Plastic
			elseif v:IsA("Decal") then
				v.Transparency = 0
			elseif v:IsA("Texture") then
				v.Transparency = 0
			elseif v:IsA("ParticleEmitter") then
				v.Enabled = true
			elseif v:IsA("Beam") then
				v.Enabled = true	
			elseif v:IsA("Trail") then
				v.Enabled = true	
			elseif v:IsA("BillboardGui") then
				v.Enabled = true	
			elseif v:IsA("SurfaceGui") then
				v.Enabled = true	
			end
		end
	end
end

local FPSBoostState = false

FPSBoostButton.MouseButton1Click:Connect(function()
	if FPSBoostState == false then
		FPS_BOOST(true)
		FPSBoostState = true
		FPSBoostButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		FPSBoostButton.Text = "ON"
	elseif FPSBoostState == true then
		FPS_BOOST(false)
		FPSBoostState = false
		FPSBoostButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		FPSBoostButton.Text = "OFF"
	end
end)

UIS.InputBegan:Connect(function(inp, gameproc)
	if gameproc then return end
	if InfJumpStatus == true then
		if inp.KeyCode == Enum.KeyCode.Space then
			local character = player.Character
			if character then
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
		end
	end
end)

local function WALLHACK(status)
	if not status then
		for _, v in ipairs(game.Players:GetPlayers()) do
			if v:IsA("Player") and v.Character and v.Character:FindFirstChild("Humanoid") then
				local hl = v.Character:FindFirstChild("1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS")
				if hl then
					hl.Enabled = false
				end
			end
		end
	end
	if status then
		local hl = Instance.new("Highlight")
		hl.Name = "1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS"
		for _, v in ipairs(game.Players:GetPlayers()) do
			if v:IsA("Player") and v.Character and v.Character:FindFirstChild("Humanoid") then
				if not v.Character:FindFirstChild("1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS") then 
					local clone = hl:Clone()
					clone.Parent = v.Character
					clone.FillColor = Color3.new(0.54902, 0, 1)
					clone.FillTransparency = 0.45
					clone.OutlineTransparency = 0.3
					print("wh loaded in player:", v.Name)
				end
				local highlight = v.Character:FindFirstChild("1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS")
				if highlight then
					highlight.Enabled = true
					if v == player then
						highlight.Enabled = false
					end
				end
			end
		end
	end
end

ON_OFF.MouseButton1Click:Connect(function()
	if statusWH == false then
		ON_OFF.Text = "ON"
		ON_OFF.BackgroundColor3 = Color3.new(0, 1, 0)
		statusWH = true
		WALLHACK(true)

		task.spawn(function()
			while statusWH do
				task.wait(0.5)
				if statusWH then
					WALLHACK(true)
				end
			end
		end)

	elseif statusWH == true then
		ON_OFF.Text = "OFF"
		ON_OFF.BackgroundColor3 = Color3.new(1, 0, 0)
		statusWH = false
		WALLHACK(false)
	end
end)

FlyTextBox.FocusLost:Connect(function()


	local SPEED = tonumber(FlyTextBox.Text)
	if SPEED then
		task.spawn(function()
			while true do
				task.wait()
				if humanoid and humanoid.Parent then
					if SPEED > MaxFlySpeed then 
							return end
				flySpeed = SPEED
				
				end
			end
		end)
	end
end)

WALKSPEEDTextBox.FocusLost:Connect(function()
	local speed = tonumber(WALKSPEEDTextBox.Text)
	if speed then
		task.spawn(function()
			while true do
				task.wait()
				if humanoid and humanoid.Parent then
					humanoid.WalkSpeed = speed
				end
			end
		end)
	end
end)




local i = 3.8230281234259102
local x = 9.2109128 / 0.492

JUMPHEIGHTTextBox.FocusLost:Connect(function()
	local height = tonumber(JUMPHEIGHTTextBox.Text)
	if height then
		task.spawn(function()
			while true do
				task.wait()
				if humanoid and humanoid.Parent then
					humanoid.JumpHeight = height
					humanoid.JumpPower = height * i * x
				end
			end
		end)
	end
end)

UIS.InputBegan:Connect(function(inp, gameproc)
	if gameproc then return end
	if inp.KeyCode == Enum.KeyCode.RightControl then
		newFrame.Visible = not newFrame.Visible
	end
end)
--[[
local StarterGui = game:GetService("StarterGui")
local resetButtonActive = false

while true do
	task.wait()
	local success, result = pcall(function()
		return StarterGui:GetCore("ResetButtonCallback")
	end)

	if not resetButtonActive or (success and result == false) then
		StarterGui:SetCore("ResetButtonCallback", true)
		resetButtonActive = true
	end
end]]

print("LOAD SUCCESS!")
