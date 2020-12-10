game:GetService("RunService").Stepped:Connect(function()
    setsimulationradius(math.huge,math.huge)
end)
local oldchar
if game.Players.LocalPlayer.Character:FindFirstChild("Dummy") then
    oldchar=game.Players.LocalPlayer.Character.Dummy
else
    game.Players.LocalPlayer.Character:BreakJoints()
    game.Players.LocalPlayer.Character=nil
    Connection = game.Workspace.DescendantAdded:Connect(function(c)
        if c.Name == "Animate" then
            c.Disabled=true        
        end
    end)
    repeat wait() until game.Players.LocalPlayer.Character
    Char = game.Players.LocalPlayer.Character
    Died = game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
        Connection:Disconnect()
        Died:Disconnect()
    end)
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
    if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
        v:Destroy()
    end
end
if game.Players.LocalPlayer.Character:FindFirstChild("Dummy") then
aaaaaaaaaaa=game.Players.LocalPlayer.Character.Dummy.HumanoidRootPart.CFrame
end
game.Players.LocalPlayer.Character.Humanoid:ChangeState(16)
torso = game.Players.LocalPlayer.Character:FindFirstChild("Torso")
if game.Players.LocalPlayer.Character:FindFirstChild("Dummy") then
    game.Players.LocalPlayer.Character.Dummy:Destroy()
end
if torso then
if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Right Shoulder") then
game.Players.LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
end
if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Left Shoulder") then
game.Players.LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
end
if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Right Hip") then
game.Players.LocalPlayer.Character.Torso["Right Hip"]:Destroy()
end
if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Left Hip") then
game.Players.LocalPlayer.Character.Torso["Left Hip"]:Destroy()
end
else
if game.Players.LocalPlayer.Character.RightUpperArm:FindFirstChild("RightShoulder") then
game.Players.LocalPlayer.Character.RightUpperArm["RightShoulder"]:Destroy()
end
if game.Players.LocalPlayer.Character.LeftUpperArm:FindFirstChild("LeftShoulder") then
game.Players.LocalPlayer.Character.LeftUpperArm["LeftShoulder"]:Destroy()
end
if game.Players.LocalPlayer.Character.RightUpperLeg:FindFirstChild("RightHip") then
game.Players.LocalPlayer.Character.RightUpperLeg["RightHip"]:Destroy()
end
if game.Players.LocalPlayer.Character.LeftUpperLeg:FindFirstChild("LeftHip") then
game.Players.LocalPlayer.Character.LeftUpperLeg["LeftHip"]:Destroy()
end
end
headoffset=CFrame.Angles(0,math.rad(32),0)
la = game.Players.LocalPlayer.Character:FindFirstChild("Left Arm")or game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperArm")
ra = game.Players.LocalPlayer.Character:FindFirstChild("Right Arm")or game.Players.LocalPlayer.Character:FindFirstChild("RightUpperArm")
local singulartorso = false
local t
local ut
local lt
if true then 
	singulartorso = true
	t = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso")
end
rl = game.Players.LocalPlayer.Character:FindFirstChild("Right Leg")or game.Players.LocalPlayer.Character:FindFirstChild("RightUpperLeg")
ll = game.Players.LocalPlayer.Character:FindFirstChild("Left Leg")or game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperLeg")
local h1
local h2
local h
if t then
else
end
local char = game:GetObjects("rbxassetid://5195737219")[1]
char.Parent = game.Players.LocalPlayer.Character
for i,v in pairs(char:GetDescendants()) do
    if v:IsA("NoCollisionConstraint") then
        v:Destroy()
    end
end
function nocollision(prt)
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") then
        e=Instance.new("NoCollisionConstraint",v)
        e.Part0 = v
        e.Part1 = prt
    end
end
end
for i,v in pairs(char:GetDescendants()) do
    if v:IsA("BasePart") then
        nocollision(v)
    end
end
for i,v in pairs(char:GetDescendants()) do
    if v:IsA("BasePart") then
        local prt=v
        prt:GetPropertyChangedSignal("Transparency"):Connect(function()
            prt.Transparency=1
        end)
    end
end
spawn(function()

local Figure = char.Animate.Parent
local Torso = Figure:WaitForChild("Torso")
local RightShoulder = Torso:WaitForChild("Right Shoulder")
local LeftShoulder = Torso:WaitForChild("Left Shoulder")
local RightHip = Torso:WaitForChild("Right Hip")
local LeftHip = Torso:WaitForChild("Left Hip")
local Neck = Torso:WaitForChild("Neck")
local Humanoid = Figure:WaitForChild("Humanoid")
local pose = "Standing"

local currentAnim = ""
local currentAnimInstance = nil
local currentAnimTrack = nil
local currentAnimKeyframeHandler = nil
local currentAnimSpeed = 1.0
local animTable = {}
local animNames = { 
	idle = 	{	
				{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
				{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
			},
	walk = 	{ 	
				{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
			}, 
	run = 	{
				{ id = "run.xml", weight = 10 } 
			}, 
	jump = 	{
				{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
			}, 
	fall = 	{
				{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
			}, 
	climb = {
				{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
			}, 
	sit = 	{
				{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
			},	
	toolnone = {
				{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
			},
	toolslash = {
				{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
--				{ id = "slash.xml", weight = 10 } 
			},
	toollunge = {
				{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
			},
	wave = {
				{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
			},
	point = {
				{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
			},
	dance1 = {
				{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
			},
	dance2 = {
				{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
			},
	dance3 = {
				{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
			},
	laugh = {
				{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
			},
	cheer = {
				{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
			},
}
local dances = {"dance1", "dance2", "dance3"}

-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

function configureAnimationSet(name, fileList)
	if (animTable[name] ~= nil) then
		for _, connection in pairs(animTable[name].connections) do
			connection:disconnect()
		end
	end
	animTable[name] = {}
	animTable[name].count = 0
	animTable[name].totalWeight = 0	
	animTable[name].connections = {}

	-- check for config values
	local config = char.Animate:FindFirstChild(name)
	if (config ~= nil) then
--		print("Loading anims " .. name)
		table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
		table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
		local idx = 1
		for _, childPart in pairs(config:GetChildren()) do
			if (childPart:IsA("Animation")) then
				table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
				animTable[name][idx] = {}
				animTable[name][idx].anim = childPart
				local weightObject = childPart:FindFirstChild("Weight")
				if (weightObject == nil) then
					animTable[name][idx].weight = 1
				else
					animTable[name][idx].weight = weightObject.Value
				end
				animTable[name].count = animTable[name].count + 1
				animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
	--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
				idx = idx + 1
			end
		end
	end

	-- fallback to defaults
	if (animTable[name].count <= 0) then
		for idx, anim in pairs(fileList) do
			animTable[name][idx] = {}
			animTable[name][idx].anim = Instance.new("Animation")
			animTable[name][idx].anim.Name = name
			animTable[name][idx].anim.AnimationId = anim.id
			animTable[name][idx].weight = anim.weight
			animTable[name].count = animTable[name].count + 1
			animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
		end
	end
end

-- Setup animation objects
function scriptChildModified(child)
	local fileList = animNames[child.Name]
	if (fileList ~= nil) then
		configureAnimationSet(child.Name, fileList)
	end	
end

char.Animate.ChildAdded:connect(scriptChildModified)
char.Animate.ChildRemoved:connect(scriptChildModified)


for name, fileList in pairs(animNames) do 
	configureAnimationSet(name, fileList)
end	

-- ANIMATION

-- declarations
local toolAnim = "None"
local toolAnimTime = 0

local jumpAnimTime = 0
local jumpAnimDuration = 0.3

local toolTransitionTime = 0.1
local fallTransitionTime = 0.3
local jumpMaxLimbVelocity = 0.75

-- functions

function stopAllAnimations()
	local oldAnim = currentAnim

	-- return to idle if finishing an emote
	if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
		oldAnim = "idle"
	end

	currentAnim = ""
	currentAnimInstance = nil
	if (currentAnimKeyframeHandler ~= nil) then
		currentAnimKeyframeHandler:disconnect()
	end

	if (currentAnimTrack ~= nil) then
		currentAnimTrack:Stop()
		currentAnimTrack:Destroy()
		currentAnimTrack = nil
	end
	return oldAnim
end

function setAnimationSpeed(speed)
	if speed ~= currentAnimSpeed then
		currentAnimSpeed = speed
		currentAnimTrack:AdjustSpeed(currentAnimSpeed)
	end
end

function keyFrameReachedFunc(frameName)
	if (frameName == "End") then

		local repeatAnim = currentAnim
		-- return to idle if finishing an emote
		if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
			repeatAnim = "idle"
		end
		
		local animSpeed = currentAnimSpeed
		playAnimation(repeatAnim, 0.0, Humanoid)
		setAnimationSpeed(animSpeed)
	end
end

-- Preload animations
function playAnimation(animName, transitionTime, humanoid) 
		
	local roll = math.random(1, animTable[animName].totalWeight) 
	local origRoll = roll
	local idx = 1
	while (roll > animTable[animName][idx].weight) do
		roll = roll - animTable[animName][idx].weight
		idx = idx + 1
	end
--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
	local anim = animTable[animName][idx].anim

	-- switch animation		
	if (anim ~= currentAnimInstance) then
		
		if (currentAnimTrack ~= nil) then
			currentAnimTrack:Stop(transitionTime)
			currentAnimTrack:Destroy()
		end

		currentAnimSpeed = 1.0
	
		-- load it to the humanoid; get AnimationTrack
		currentAnimTrack = humanoid:LoadAnimation(anim)
		currentAnimTrack.Priority = Enum.AnimationPriority.Core
		 
		-- play the animation
		currentAnimTrack:Play(transitionTime)
		currentAnim = animName
		currentAnimInstance = anim

		-- set up keyframe name triggers
		if (currentAnimKeyframeHandler ~= nil) then
			currentAnimKeyframeHandler:disconnect()
		end
		currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)
		
	end

end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

local toolAnimName = ""
local toolAnimTrack = nil
local toolAnimInstance = nil
local currentToolAnimKeyframeHandler = nil

function toolKeyFrameReachedFunc(frameName)
	if (frameName == "End") then
--		print("Keyframe : ".. frameName)	
		playToolAnimation(toolAnimName, 0.0, Humanoid)
	end
end


function playToolAnimation(animName, transitionTime, humanoid, priority)	 
		
		local roll = math.random(1, animTable[animName].totalWeight) 
		local origRoll = roll
		local idx = 1
		while (roll > animTable[animName][idx].weight) do
			roll = roll - animTable[animName][idx].weight
			idx = idx + 1
		end
--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
		local anim = animTable[animName][idx].anim

		if (toolAnimInstance ~= anim) then
			
			if (toolAnimTrack ~= nil) then
				toolAnimTrack:Stop()
				toolAnimTrack:Destroy()
				transitionTime = 0
			end
					
			-- load it to the humanoid; get AnimationTrack
			toolAnimTrack = humanoid:LoadAnimation(anim)
			if priority then
				toolAnimTrack.Priority = priority
			end
			 
			-- play the animation
			toolAnimTrack:Play(transitionTime)
			toolAnimName = animName
			toolAnimInstance = anim

			currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
		end
end

function stopToolAnimations()
	local oldAnim = toolAnimName

	if (currentToolAnimKeyframeHandler ~= nil) then
		currentToolAnimKeyframeHandler:disconnect()
	end

	toolAnimName = ""
	toolAnimInstance = nil
	if (toolAnimTrack ~= nil) then
		toolAnimTrack:Stop()
		toolAnimTrack:Destroy()
		toolAnimTrack = nil
	end


	return oldAnim
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


function onRunning(speed)
	if speed > 0.01 then
		playAnimation("walk", 0.1, Humanoid)
		if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
			setAnimationSpeed(speed / 14.5)
		end
		pose = "Running"
	else
		if emoteNames[currentAnim] == nil then
			playAnimation("idle", 0.1, Humanoid)
			pose = "Standing"
		end
	end
end

function onDied()
	pose = "Dead"
end

function onJumping()
	playAnimation("jump", 0.1, Humanoid)
	jumpAnimTime = jumpAnimDuration
	pose = "Jumping"
end

function onClimbing(speed)
	playAnimation("climb", 0.1, Humanoid)
	setAnimationSpeed(speed / 12.0)
	pose = "Climbing"
end

function onGettingUp()
	pose = "GettingUp"
end

function onFreeFall()
	if (jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	end
	pose = "FreeFall"
end

function onFallingDown()
	pose = "FallingDown"
end

function onSeated()
	pose = "Seated"
end

function onPlatformStanding()
	pose = "PlatformStanding"
end

function onSwimming(speed)
	if speed > 0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end

function getTool()	
	for _, kid in ipairs(Figure:GetChildren()) do
		if kid.className == "Tool" then return kid end
	end
	return nil
end

function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end

function animateTool()
	
	if (toolAnim == "None") then
		playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
		return
	end

	if (toolAnim == "Slash") then
		playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end

	if (toolAnim == "Lunge") then
		playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end
end

function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder:SetDesiredAngle(3.14 /2)
	LeftShoulder:SetDesiredAngle(-3.14 /2)
	RightHip:SetDesiredAngle(3.14 /2)
	LeftHip:SetDesiredAngle(-3.14 /2)
end

local lastTick = 0

function move(time)
	local amplitude = 1
	local frequency = 1
  	local deltaTime = time - lastTick
  	lastTick = time

	local climbFudge = 0
	local setAngles = false

  	if (jumpAnimTime > 0) then
  		jumpAnimTime = jumpAnimTime - deltaTime
  	end

	if (pose == "FreeFall" and jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	elseif (pose == "Seated") then
		playAnimation("sit", 0.5, Humanoid)
		return
	elseif (pose == "Running") then
		playAnimation("walk", 0.1, Humanoid)
	elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
--		print("Wha " .. pose)
		stopAllAnimations()
		amplitude = 0.1
		frequency = 1
		setAngles = true
	end

	if (setAngles) then
		local desiredAngle = amplitude * math.sin(time * frequency)

		RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
		LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
		RightHip:SetDesiredAngle(-desiredAngle)
		LeftHip:SetDesiredAngle(-desiredAngle)
	end

	-- Tool Animation handling
	local tool = getTool()
	if tool and tool:FindFirstChild("Handle") then
	
		local animStringValueObject = getToolAnim(tool)

		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = time + .3
		end

		if time > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end

		animateTool()		
	else
		stopToolAnimations()
		toolAnim = "None"
		toolAnimInstance = nil
		toolAnimTime = 0
	end
end

-- connect events
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)

-- setup emote chat hook
game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
	local emote = ""
	if msg == "/e dance" then
		emote = dances[math.random(1, #dances)]
	elseif (string.sub(msg, 1, 3) == "/e ") then
		emote = string.sub(msg, 4)
	elseif (string.sub(msg, 1, 7) == "/emote ") then
		emote = string.sub(msg, 8)
	end
	
	if (pose == "Standing" and emoteNames[emote] ~= nil) then
		playAnimation(emote, 0.1, Humanoid)
	end

end)


-- main program

-- initialize to idle
playAnimation("idle", 0.1, Humanoid)
pose = "Standing"

while Figure.Parent ~= nil do
	local _, time = wait(0.1)
	move(time)
end
end)
function makeorientacc()
AlignOrient = Instance.new("AlignOrientation")
AlignOrient.RigidityEnabled = false
AlignOrient.MaxTorque = 9e99
AlignOrient.MaxAngularVelocity = 9e99
AlignOrient.PrimaryAxisOnly = false
AlignOrient.ReactionTorqueEnabled = true
AlignOrient.Responsiveness = 200
return(AlignOrient)
end
function makealignacc()
AlignPos = Instance.new("AlignPosition")
AlignPos.RigidityEnabled = false
AlignPos.ApplyAtCenterOfMass = true
AlignPos.MaxForce = 9e9
AlignPos.MaxVelocity = 9e99
AlignPos.ReactionForceEnabled = false
AlignPos.Responsiveness = 9e99
return(AlignPos)
end
function loopcf(prt1,prt2)
e=Instance.new("Motor6D",prt2)
e.Part0=prt1
e.Part1=prt2
end
function weldm(prt,prt3,offset,tr)
prt2=prt3:Clone()
prt2.Parent=prt3
prt2:BreakJoints()
prt2.CanCollide=false
prt2.Transparency=1
prt2.Massless=true
loopcf(prt2,prt3)
prt.Massless = true
--prt:BreakJoints()
laacc = Instance.new("Attachment",prt)
la3acc = Instance.new("Attachment",prt)
la2acc = Instance.new("Attachment",prt2)
la2acc.CFrame = offset
LaAli = makealignacc()
LaAli.Attachment0 = laacc
LaAli.Attachment1 = la2acc
LaAli.Parent = prt
LaAli = makeorientacc()
LaAli.Attachment0 = la3acc
LaAli.Attachment1 = la2acc
LaAli.Parent = prt
end
weldm(la,char["Left Arm"],CFrame.Angles(0,0,0))
weldm(ra,char["Right Arm"],CFrame.Angles(0,0,0))
weldm(ll,char["Left Leg"],CFrame.Angles(0,0,0))
weldm(rl,char["Right Leg"],CFrame.Angles(0,0,0))
weldm(t,char["Torso"],CFrame.new(0,0.5,0))
if showface == false then
char.Head.face.Transparency = 1
end
if oldchar then
   oldchar:Destroy()
end
if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    char:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
else
    char:SetPrimaryPartCFrame(aaaaaaaaaaa)
end
Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
char.HumanoidRootPart.Anchored = false
game.Workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid")
local spacedown=false
game:GetService("UserInputService").InputBegan:Connect(function(inputt,dothedid)
if dothedid then
    spacedown=false
else
if inputt.KeyCode==Enum.KeyCode.Space then
    spacedown=true
end
end
end)
game:GetService("UserInputService").InputEnded:Connect(function(inputt,dothedid)
if inputt.KeyCode==Enum.KeyCode.Space then
    spacedown=false
end
end)
spawn(function()while game.RunService.Heartbeat:Wait() do
	local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
	for _,v in pairs(ActiveTracks) do
    v:Stop()
	end
	if spacedown then
        char.Humanoid.Jump=true
    end
    char:FindFirstChildOfClass("Humanoid"):Move(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection, false)
end end)
spawn(function()while game.RunService.Stepped:Wait() do
    for i,v in pairs(char.Parent:GetChildren()) do
	    if v and v:IsA("BasePart") then
	        v.CanCollide=false
	    end
    end
    if char.Parent and char.Parent:FindFirstChild("Torso") then
        if char.Parent.Torso:FindFirstChild("Neck") then
            local _,Y,_ = char.Parent.Torso.CFrame:ToObjectSpace(char.Head.CFrame):ToEulerAnglesXYZ()
            char.Parent.Torso.Neck.CurrentAngle = Y
            char.Parent.Torso.Neck:SetDesiredAngle(Y)
        end
    else
        if char.Parent.Head:FindFirstChild("Neck") then
            local _,_,Z = char.Parent.UpperTorso.CFrame:ToObjectSpace(char.Head.CFrame):ToEulerAnglesXYZ()
            char.Parent.Head.Neck.CurrentAngle = Z
            char.Parent.Head.Neck:SetDesiredAngle(Z)
        end
    end
end 
end)
if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart:Destroy()
end
oc=game.Players.LocalPlayer.Character 
okasdiasdjkhawdjkaskldjajedlas=Instance.new("ObjectValue",char)
okasdiasdjkhawdjkaskldjajedlas.Name="RC"
okasdiasdjkhawdjkaskldjajedlas.Value=oc
while char.Parent ~= nil do wait() end