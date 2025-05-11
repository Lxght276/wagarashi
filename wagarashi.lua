-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

-- Local player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
player.CharacterAdded:Connect(function(newChar)
    character = newChar
end)

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ESP_GUI"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 500)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "ESP & Player Tools"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = Frame

-- ESP Toggle
local ESPToggle = Instance.new("TextButton")
ESPToggle.Size = UDim2.new(0.9, 0, 0, 30)
ESPToggle.Position = UDim2.new(0.05, 0, 0, 40)
ESPToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggle.Text = "Toggle ESP"
ESPToggle.Font = Enum.Font.SourceSans
ESPToggle.TextSize = 16
ESPToggle.Parent = Frame

-- Fly Toggle
local FlyToggle = Instance.new("TextButton")
FlyToggle.Size = UDim2.new(0.9, 0, 0, 30)
FlyToggle.Position = UDim2.new(0.05, 0, 0, 80)
FlyToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggle.Text = "Toggle Fly"
FlyToggle.Font = Enum.Font.SourceSans
FlyToggle.TextSize = 16
FlyToggle.Parent = Frame

-- Noclip Toggle
local NoclipToggle = Instance.new("TextButton")
NoclipToggle.Size = UDim2.new(0.9, 0, 0, 30)
NoclipToggle.Position = UDim2.new(0.05, 0, 0, 120)
NoclipToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
NoclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipToggle.Text = "Toggle Noclip"
NoclipToggle.Font = Enum.Font.SourceSans
NoclipToggle.TextSize = 16
NoclipToggle.Parent = Frame

-- Infinite Jump Toggle
local InfiniteJumpToggle = Instance.new("TextButton")
InfiniteJumpToggle.Size = UDim2.new(0.9, 0, 0, 30)
InfiniteJumpToggle.Position = UDim2.new(0.05, 0, 0, 160)
InfiniteJumpToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
InfiniteJumpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJumpToggle.Text = "Toggle Infinite Jump"
InfiniteJumpToggle.Font = Enum.Font.SourceSans
InfiniteJumpToggle.TextSize = 16
InfiniteJumpToggle.Parent = Frame

-- Player Selection
local PlayerSelectionLabel = Instance.new("TextLabel")
PlayerSelectionLabel.Size = UDim2.new(0.9, 0, 0, 20)
PlayerSelectionLabel.Position = UDim2.new(0.05, 0, 0, 200)
PlayerSelectionLabel.BackgroundTransparency = 1
PlayerSelectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerSelectionLabel.Text = "Select Target Player:"
PlayerSelectionLabel.Font = Enum.Font.SourceSans
PlayerSelectionLabel.TextSize = 14
PlayerSelectionLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayerSelectionLabel.Parent = Frame

local PlayerDropdown = Instance.new("Frame")
PlayerDropdown.Size = UDim2.new(0.9, 0, 0, 30)
PlayerDropdown.Position = UDim2.new(0.05, 0, 0, 220)
PlayerDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PlayerDropdown.BorderSizePixel = 0
PlayerDropdown.ClipsDescendants = true
PlayerDropdown.Parent = Frame

local DropdownButton = Instance.new("TextButton")
DropdownButton.Size = UDim2.new(1, 0, 1, 0)
DropdownButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DropdownButton.Text = "Select Player"
DropdownButton.Font = Enum.Font.SourceSans
DropdownButton.TextSize = 16
DropdownButton.Parent = PlayerDropdown

local DropdownList = Instance.new("ScrollingFrame")
DropdownList.Size = UDim2.new(1, 0, 0, 150)
DropdownList.Position = UDim2.new(0, 0, 1, 0)
DropdownList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DropdownList.BorderSizePixel = 0
DropdownList.ScrollBarThickness = 5
DropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
DropdownList.AutomaticCanvasSize = Enum.AutomaticSize.Y
DropdownList.Visible = false
DropdownList.ZIndex = 2
PlayerDropdown.ZIndex = 2
DropdownList.Parent = PlayerDropdown

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = DropdownList

-- AutoFarm
local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Size = UDim2.new(0.9, 0, 0, 20)
AutoFarmLabel.Position = UDim2.new(0.05, 0, 0, 260)
AutoFarmLabel.BackgroundTransparency = 1
AutoFarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmLabel.Text = "AutoFarm Target: None"
AutoFarmLabel.Font = Enum.Font.SourceSans
AutoFarmLabel.TextSize = 14
AutoFarmLabel.Parent = Frame

local AutoFarmToggle = Instance.new("TextButton")
AutoFarmToggle.Size = UDim2.new(0.9, 0, 0, 30)
AutoFarmToggle.Position = UDim2.new(0.05, 0, 0, 280)
AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmToggle.Text = "Toggle AutoFarm"
AutoFarmToggle.Font = Enum.Font.SourceSans
AutoFarmToggle.TextSize = 16
AutoFarmToggle.Parent = Frame

-- Hitbox Extender
local HitboxExtenderToggle = Instance.new("TextButton")
HitboxExtenderToggle.Size = UDim2.new(0.9, 0, 0, 30)
HitboxExtenderToggle.Position = UDim2.new(0.05, 0, 0, 320)
HitboxExtenderToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
HitboxExtenderToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxExtenderToggle.Text = "Toggle Hitbox Extender"
HitboxExtenderToggle.Font = Enum.Font.SourceSans
HitboxExtenderToggle.TextSize = 16
HitboxExtenderToggle.Parent = Frame

-- Variables
local espEnabled = false
local flyEnabled = false
local noclipEnabled = false
local infiniteJumpEnabled = false
local autoFarmEnabled = false
local hitboxExtenderEnabled = false
local espObjects = {}
local selectedTarget = nil
local dropdownOpen = false

-- Fly Variables
local flySpeed = 50
local flyKeys = {
    Forward = Enum.KeyCode.W,
    Backward = Enum.KeyCode.S,
    Left = Enum.KeyCode.A,
    Right = Enum.KeyCode.D,
    Up = Enum.KeyCode.Space,
    Down = Enum.KeyCode.LeftShift
}
local flyController = {
    bodyVelocity = nil,
    bodyGyro = nil,
    connection = nil,
    flying = false
}

-- Noclip Variables
local noclipConnection = nil

-- Infinite Jump Variables
local infiniteJumpConnection = nil

-- AutoFarm Variables
local autoFarmConnection = nil

-- Hitbox Extender Variables
local hitboxParts = {}

-- ESP Functions
local function createESP(playerModel)
    if not playerModel:IsA("Model") then return end
    
    local player = Players:GetPlayerFromCharacter(playerModel)
    if not player or player == Players.LocalPlayer then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = player.Name .. "_ESP"
    highlight.Adornee = playerModel
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = player == selectedTarget and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = playerModel
    
    local humanoidRootPart = playerModel:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Check for EyeValues
    local eyeValue = 0
    local eyeValueObject = playerModel:FindFirstChild("EyeValues")
    if eyeValueObject and eyeValueObject:IsA("NumberValue") then
        eyeValue = eyeValueObject.Value
    end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = player.Name .. "_ESP_Label"
    billboard.Adornee = humanoidRootPart
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = playerModel
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = player.Name .. "\nEye Value: " .. tostring(eyeValue)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 14
    label.Parent = billboard
    
    espObjects[playerModel] = {highlight = highlight, billboard = billboard}
end

local function removeESP(playerModel)
    if espObjects[playerModel] then
        if espObjects[playerModel].highlight then
            espObjects[playerModel].highlight:Destroy()
        end
        if espObjects[playerModel].billboard then
            espObjects[playerModel].billboard:Destroy()
        end
        espObjects[playerModel] = nil
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        ESPToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        
        -- Find Alive folder and create ESP for all alive players
        local aliveFolder = Workspace:FindFirstChild("Alive")
        if aliveFolder then
            -- Add ESP for existing players
            for _, playerModel in ipairs(aliveFolder:GetChildren()) do
                if playerModel:IsA("Model") then
                    createESP(playerModel)
                end
            end
            
            -- Connect to detect new players
            aliveFolder.ChildAdded:Connect(function(child)
                if espEnabled and child:IsA("Model") then
                    createESP(child)
                end
            end)
            
            -- Connect to detect when players leave
            aliveFolder.ChildRemoved:Connect(function(child)
                if espEnabled and child:IsA("Model") then
                    removeESP(child)
                end
            end)
        end
    else
        ESPToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        -- Remove all ESP objects
        for playerModel, _ in pairs(espObjects) do
            removeESP(playerModel)
        end
        espObjects = {}
    end
end

-- Fly Functions
local function fly()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    -- Create fly components
    flyController.bodyVelocity = Instance.new("BodyVelocity")
    flyController.bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    flyController.bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyController.bodyVelocity.Parent = character.HumanoidRootPart
    
    flyController.bodyGyro = Instance.new("BodyGyro")
    flyController.bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyController.bodyGyro.P = 1000
    flyController.bodyGyro.D = 50
    flyController.bodyGyro.Parent = character.HumanoidRootPart
    
    flyController.flying = true
    
    flyController.connection = RunService.Heartbeat:Connect(function()
        if not flyController.flying or not character or not character.HumanoidRootPart then return end
        
        local camera = workspace.CurrentCamera
        flyController.bodyGyro.CFrame = camera.CFrame
        
        local velocity = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(flyKeys.Forward) then
            velocity = velocity + (camera.CFrame.LookVector * flySpeed)
        end
        if UserInputService:IsKeyDown(flyKeys.Backward) then
            velocity = velocity + (camera.CFrame.LookVector * -flySpeed)
        end
        if UserInputService:IsKeyDown(flyKeys.Left) then
            velocity = velocity + (camera.CFrame.RightVector * -flySpeed)
        end
        if UserInputService:IsKeyDown(flyKeys.Right) then
            velocity = velocity + (camera.CFrame.RightVector * flySpeed)
        end
        if UserInputService:IsKeyDown(flyKeys.Up) then
            velocity = velocity + (Vector3.new(0, 1, 0) * flySpeed)
        end
        if UserInputService:IsKeyDown(flyKeys.Down) then
            velocity = velocity + (Vector3.new(0, -1, 0) * flySpeed)
        end
        
        flyController.bodyVelocity.Velocity = velocity
    end)
end

local function stopFly()
    flyController.flying = false
    if flyController.connection then
        flyController.connection:Disconnect()
    end
    if flyController.bodyVelocity then
        flyController.bodyVelocity:Destroy()
    end
    if flyController.bodyGyro then
        flyController.bodyGyro:Destroy()
    end
end

local function toggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        FlyToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        fly()
    else
        FlyToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        stopFly()
    end
end

-- Noclip Functions
local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        NoclipToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        
        noclipConnection = RunService.Stepped:Connect(function()
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        NoclipToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        if noclipConnection then
            noclipConnection:Disconnect()
        end
    end
end

-- Infinite Jump Functions
local function toggleInfiniteJump()
    infiniteJumpEnabled = not infiniteJumpEnabled
    
    if infiniteJumpEnabled then
        InfiniteJumpToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        
        infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        InfiniteJumpToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        if infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
        end
    end
end

-- Player Selection Functions
local function updateDropdown()
    -- Clear existing dropdown items
    for _, child in ipairs(DropdownList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Get players from Alive folder
    local aliveFolder = Workspace:FindFirstChild("Alive")
    if aliveFolder then
        for _, model in ipairs(aliveFolder:GetChildren()) do
            local player = Players:GetPlayerFromCharacter(model)
            if player and player ~= Players.LocalPlayer then
                local playerButton = Instance.new("TextButton")
                playerButton.Size = UDim2.new(1, 0, 0, 30)
                playerButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                playerButton.Text = player.Name
                playerButton.Font = Enum.Font.SourceSans
                playerButton.TextSize = 16
                playerButton.Parent = DropdownList
                
                playerButton.MouseButton1Click:Connect(function()
                    selectedTarget = player
                    AutoFarmLabel.Text = "AutoFarm Target: " .. player.Name
                    DropdownButton.Text = player.Name
                    DropdownList.Visible = false
                    dropdownOpen = false
                    PlayerDropdown.Size = UDim2.new(0.9, 0, 0, 30)
                    
                    -- Update ESP highlight if ESP is enabled
                    if espEnabled then
                        for playerModel, espData in pairs(espObjects) do
                            local plyr = Players:GetPlayerFromCharacter(playerModel)
                            if espData.highlight then
                                espData.highlight.FillColor = plyr == selectedTarget and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                            end
                        end
                    end
                end)
            end
        end
    end
    
    -- Add None option
    local noneButton = Instance.new("TextButton")
    noneButton.Size = UDim2.new(1, 0, 0, 30)
    noneButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    noneButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    noneButton.Text = "None"
    noneButton.Font = Enum.Font.SourceSans
    noneButton.TextSize = 16
    noneButton.Parent = DropdownList
    
    noneButton.MouseButton1Click:Connect(function()
        selectedTarget = nil
        AutoFarmLabel.Text = "AutoFarm Target: None"
        DropdownButton.Text = "Select Player"
        DropdownList.Visible = false
        dropdownOpen = false
        PlayerDropdown.Size = UDim2.new(0.9, 0, 0, 30)
        
        -- Update ESP highlights if ESP is enabled
        if espEnabled then
            for _, espData in pairs(espObjects) do
                if espData.highlight then
                    espData.highlight.FillColor = Color3.fromRGB(255, 0, 0)
                end
            end
        end
    end)
end

DropdownButton.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    
    if dropdownOpen then
        updateDropdown()
        DropdownList.Visible = true
        PlayerDropdown.Size = UDim2.new(0.9, 0, 0, 180)
    else
        DropdownList.Visible = false
        PlayerDropdown.Size = UDim2.new(0.9, 0, 0, 30)
    end
end)

-- Hitbox Extender Functions
local function toggleHitboxExtender()
    hitboxExtenderEnabled = not hitboxExtenderEnabled
    
    if hitboxExtenderEnabled then
        HitboxExtenderToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        
        if character then
            -- Create hitboxes for all limbs
            local limbs = {"RightHand", "LeftHand", "RightArm", "LeftArm", "RightLeg", "LeftLeg", "RightFoot", "LeftFoot"}
            
            for _, limbName in ipairs(limbs) do
                local limb = character:FindFirstChild(limbName)
                if limb and limb:IsA("BasePart") then
                    local hitbox = Instance.new("Part")
                    hitbox.Name = "HitboxExtender"
                    hitbox.Size = Vector3.new(5, 5, 5)
                    hitbox.Transparency = 1
                    hitbox.CanCollide = false
                    hitbox.Anchored = false
                    hitbox.Parent = character
                    
                    local weld = Instance.new("WeldConstraint")
                    weld.Part0 = limb
                    weld.Part1 = hitbox
                    weld.Parent = hitbox
                    
                    -- Add touch event to deal damage
                    hitbox.Touched:Connect(function(otherPart)
                        if selectedTarget and selectedTarget.Character and otherPart.Parent == selectedTarget.Character then
                            local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:TakeDamage(10)
                            end
                        end
                    end)
                    
                    table.insert(hitboxParts, hitbox)
                end
            end
        end
    else
        HitboxExtenderToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        -- Remove all hitbox parts
        for _, part in ipairs(hitboxParts) do
            if part and part.Parent then
                part:Destroy()
            end
        end
        hitboxParts = {}
    end
end

-- AutoFarm Functions
local function attackTarget()
    if not selectedTarget or not selectedTarget.Character or not character or not character:FindFirstChild("Humanoid") then
        return
    end
    
    local targetRoot = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
    local localRoot = character:FindFirstChild("HumanoidRootPart")
    
    if not targetRoot or not localRoot then return end
    
    -- Move towards target
    character.Humanoid:MoveTo(targetRoot.Position)
    
    -- Attack if close enough
    if (targetRoot.Position - localRoot.Position).Magnitude < 10 then
        -- Use hitbox extender if enabled
        if hitboxExtenderEnabled then
            for _, hitbox in ipairs(hitboxParts) do
                firetouchinterest(hitbox, targetRoot, 0) -- Touch
                firetouchinterest(hitbox, targetRoot, 1) -- Untouch
            end
        else
            -- Regular attack
            firetouchinterest(localRoot, targetRoot, 0) -- Touch
            firetouchinterest(localRoot, targetRoot, 1) -- Untouch
        end
    end
end

local function toggleAutoFarm()
    autoFarmEnabled = not autoFarmEnabled
    
    if autoFarmEnabled then
        if not selectedTarget then
            AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            autoFarmEnabled = false
            return
        end
        
        AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        
        autoFarmConnection = RunService.Heartbeat:Connect(function()
            attackTarget()
        end)
    else
        AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        if autoFarmConnection then
            autoFarmConnection:Disconnect()
        end
    end
end

-- Button Connections
ESPToggle.MouseButton1Click:Connect(toggleESP)
FlyToggle.MouseButton1Click:Connect(toggleFly)
NoclipToggle.MouseButton1Click:Connect(toggleNoclip)
InfiniteJumpToggle.MouseButton1Click:Connect(toggleInfiniteJump)
AutoFarmToggle.MouseButton1Click:Connect(toggleAutoFarm)
HitboxExtenderToggle.MouseButton1Click:Connect(toggleHitboxExtender)

-- Initialize dropdown
updateDropdown()

-- Cleanup
player.CharacterRemoving:Connect(function()
    stopFly()
    if noclipConnection then
        noclipConnection:Disconnect()
    end
    if infiniteJumpConnection then
        infiniteJumpConnection:Disconnect()
    end
    if autoFarmConnection then
        autoFarmConnection:Disconnect()
    end
    for _, part in ipairs(hitboxParts) do
        if part and part.Parent then
            part:Destroy()
        end
    end
    hitboxParts = {}
    
    -- Clean up ESP
    for playerModel, _ in pairs(espObjects) do
        removeESP(playerModel)
    end
    espObjects = {}
end)

-- Update when character respawns
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    
    -- Re-enable features if they were on
    if flyEnabled then
        toggleFly()
        toggleFly() -- Toggle twice to restart
    end
    if noclipEnabled then
        toggleNoclip()
        toggleNoclip()
    end
    if hitboxExtenderEnabled then
        toggleHitboxExtender()
        toggleHitboxExtender()
    end
    if espEnabled then
        toggleESP()
        toggleESP()
    end
end)

-- Monitor Alive folder for changes
local aliveFolder = Workspace:FindFirstChild("Alive")
if aliveFolder then
    aliveFolder.ChildAdded:Connect(updateDropdown)
    aliveFolder.ChildRemoved:Connect(updateDropdown)
    
    -- Also update ESP when alive folder changes
    aliveFolder.ChildAdded:Connect(function(child)
        if espEnabled and child:IsA("Model") then
            createESP(child)
        end
    end)
    
    aliveFolder.ChildRemoved:Connect(function(child)
        if espEnabled and child:IsA("Model") then
            removeESP(child)
        end
    end)
end
