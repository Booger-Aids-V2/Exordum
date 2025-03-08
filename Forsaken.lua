local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Exordum - Forsaken",
   Icon = 96997837860953,
   LoadingTitle = "worst hub ever",
   LoadingSubtitle = "by Ex0rdum",
    
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Exorsaken"
   },
})

local SurvivorsTab = Window:CreateTab("Survivors", "users")

local shedloop
local shedaim = false
local ShedAimbotToggle = SurvivorsTab:CreateToggle({
    Name = "Shedletsky Aimbot",
    CurrentValue = false,
    Flag = "ShedAimbotToggle",
    Callback = function(state)
        shedaim = state
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if player.PlayerData.Equipped.Survivor.Value ~= "Shedletsky" and state then
            Rayfield:Notify{
                Title = "Wrong Character",
                Content = "Your current character isn't Shedletsky, you can still enable this but it might cause bugs, so it's best just to turn it off.",
                Duration = 5
            }
        end

        if shedloop then
            shedloop:Disconnect()
            shedloop = nil
        end

        if shedaim then
            local sword = character:WaitForChild("Sword", 5)
            if sword then
                shedloop = sword.ChildAdded:Connect(function(child)
                    if not shedaim then return end
                    local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                    if killersFolder then
                        local killer = killersFolder:FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            local killerHRP = killer.HumanoidRootPart
                            local rootpart = character:FindFirstChild("HumanoidRootPart")
                            if rootpart then
                              local startTime = tick()
                              while tick() - startTime < 1 do
                              task.wait()
                              workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                              rootpart.CFrame = CFrame.lookAt(rootpart.Position, killerHRP.Position)
                           end
                            end
                        end
                    end
                end)
            end
        end
    end,
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    if shedaim then
        local sword = character:WaitForChild("Sword", 5)
        if sword then
            shedloop = sword.ChildAdded:Connect(function(child)
                if not shedaim then return end
                local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                if killersFolder then
                    local killer = killersFolder:FindFirstChildOfClass("Model")
                    if killer and killer:FindFirstChild("HumanoidRootPart") then
                        local killerHRP = killer.HumanoidRootPart
                        local rootpart = character:FindFirstChild("HumanoidRootPart")
                        if rootpart then
                           local startTime = tick()
                           while tick() - startTime < 1 do
                              task.wait()
                              workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                              rootpart.CFrame = CFrame.lookAt(rootpart.Position, killerHRP.Position)
                           end
                        end
                    end
                end
            end)
        end
    end
end)

local KillerTab = Window:CreateTab("Killer", "axe")

local AimLoop1x
local aimbot1x1 = false
local Aimbot1x1Toggle = KillerTab:CreateToggle({
    Name = "1x1x1x1 Aimbot",
    CurrentValue = false,
    Flag = "Aimbot1x1Toggle",
    Callback = function(state)
        aimbot1x1 = state
        if game:GetService("Players").LocalPlayer.PlayerData.Equipped.Killer.Value ~= "1x1x1x1" and state then
            Rayfield:Notify{
                Title = "Wrong Character",
                Content = "Your current character isn't 1x1x1x1, you can still enable this but it might cause bugs, so it's best just to turn it off",
                Duration = 5
            }
        end
        if AimLoop1x then
            AimLoop1x:Disconnect()
            AimLoop1x = nil
        end
        if aimbot1x1 then
            AimLoop1x = game:GetService("RunService").Heartbeat:Connect(function()
                local survivors = {}
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            table.insert(survivors, character)
                        end
                    end
                end
                local nearestSurvivor, shortestDistance = nil, math.huge
                local rootpart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                for _, survivor in pairs(survivors) do
                    local survivorHRP = survivor.HumanoidRootPart
                    if rootpart then
                        local distance = (survivorHRP.Position - rootpart.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestSurvivor = survivor
                        end
                    end
                end
                if nearestSurvivor then
                    local nearestHRP = nearestSurvivor.HumanoidRootPart
                    if rootpart then
                        local startTime = tick()
                        while tick() - startTime < 1 do
                            task.wait()
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                            rootpart.CFrame = CFrame.lookAt(rootpart.Position, nearestHRP.Position)
                        end
                    end
                end
            end)
        end
    end,
})

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if aimbot1x1 then
        local survivors = {}
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    table.insert(survivors, character)
                end
            end
        end
        local nearestSurvivor, shortestDistance = nil, math.huge
        local rootpart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        for _, survivor in pairs(survivors) do
            local survivorHRP = survivor.HumanoidRootPart
            if rootpart then
                local distance = (survivorHRP.Position - rootpart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestSurvivor = survivor
                end
            end
        end
        if nearestSurvivor then
            local nearestHRP = nearestSurvivor.HumanoidRootPart
            if rootpart then
                local startTime = tick()
                while tick() - startTime < 1 do
                    task.wait()
                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                    rootpart.CFrame = CFrame.lookAt(rootpart.Position, nearestHRP.Position)
                end
            end
        end
    end
end)

local GeneratorTab = Window:CreateTab("Generator", "dock")

local GenSolveDelay = 5
local debounce = {}
local mapFolder

local function MapWait()
    local success
    success, mapFolder = pcall(function()
        return game.Workspace:WaitForChild("Map"):WaitForChild("Ingame"):FindFirstChild("Map")
    end)
    if not success or not mapFolder then
        mapFolder = nil
    end
end

local function AutoGen(state)
    if not state then
        debounce = {}
        return
    end
    task.spawn(function()
        while state do
            task.wait()
            if mapFolder then
                for _, gen in ipairs(mapFolder:GetChildren()) do
                    if gen.Name == "Generator" and not debounce[gen] then
                        debounce[gen] = true
                        gen:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                        task.delay(GenSolveDelay, function()
                            debounce[gen] = nil
                        end)
                    end
                end
            end
            task.wait(GenSolveDelay)
        end
    end)
end

game.Workspace.ChildAdded:Connect(function(child)
    if child.Name == "Map" then
        MapWait()
    end
end)

local AutoGenToggle = GeneratorTab:CreateToggle({
    Name = "Auto Generator",
    CurrentValue = false,
    Flag = "AutoGenToggle",
    Callback = function(state)
        MapWait()
        AutoGen(state)
    end,
})

local GenDelaySlider = GeneratorTab:CreateSlider({
   Name = "Auto Generator Delay",
   Range = {2, 10},
   Increment = 0.1,
   Suffix = "Seconds",
   CurrentValue = GenSolveDelay,
   Flag = "GenDelaySlider",
   Callback = function(Value)
         GenSolveDelay = Value
   end,
})

local VisualsTab = Window:CreateTab("Visuals", "eye")

local SurvivorESPToggle = VisualsTab:CreateToggle({
    Name = "Survivor ESP",
    CurrentValue = false,
    Flag = "SurvivorESPToggle",
    Callback = function(state)
        for _, model in pairs(game.Workspace.Players.Survivors:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local existingBillboard = model.Head:FindFirstChild("Sigma")
                local existingHighlight = model:FindFirstChild("Sigma2")
                if state then
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "Sigma"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = model.Head
                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = model.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end
                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "Sigma2"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillTransparency = 1
                        highlight.Parent = model
                    end
                else
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end
        game.Workspace.Players.Survivors.ChildAdded:Connect(function(child)
            if state and child:IsA("Model") and child:FindFirstChild("Head") then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "Sigma"
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = child.Head
                local textLabel = Instance.new("TextLabel", billboard)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = child.Name
                textLabel.TextColor3 = Color3.new(1, 1, 1)
                textLabel.TextStrokeTransparency = 0
                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                textLabel.BackgroundTransparency = 1
                local highlight = Instance.new("Highlight")
                highlight.Name = "Sigma2"
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillTransparency = 1
                highlight.Parent = child
            end
        end)
    end,
})

local ToolsESPToggle = VisualsTab:CreateToggle({
    Name = "Tools ESP",
    CurrentValue = false,
    Flag = "ToolsESPToggle",
    Callback = function(state)
        for _, tool in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if tool:IsA("Tool") then
                local existingHighlight = tool:FindFirstChild("Sigma3")
                local existingBillboard = tool:FindFirstChild("Sigma4")
                if state then
                    if not existingHighlight then
                        local toolHighlight = Instance.new("Highlight")
                        toolHighlight.Name = "Sigma3"
                        toolHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        toolHighlight.FillTransparency = 1
                        toolHighlight.Parent = tool
                    end
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "Sigma4"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = tool
                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = tool.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end
                else
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                end
            end
        end
        game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
            if state and child:IsA("Tool") then
                local toolHighlight = Instance.new("Highlight")
                toolHighlight.Name = "Sigma3"
                toolHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                toolHighlight.FillTransparency = 1
                toolHighlight.Parent = child
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "Sigma4"
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = child
                local textLabel = Instance.new("TextLabel", billboard)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = child.Name
                textLabel.TextColor3 = Color3.new(1, 1, 1)
                textLabel.TextStrokeTransparency = 0
                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                textLabel.BackgroundTransparency = 1
            end
        end)
    end
})

local KillerESPToggle = VisualsTab:CreateToggle({
    Name = "Killer ESP",
    CurrentValue = false,
    Flag = "KillerESPToggle",
    Callback = function(state)
        for _, model in pairs(game.Workspace.Players.Killers:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local existingHighlight = model:FindFirstChild("Sigma5")
                local existingBillboard = model.Head:FindFirstChild("Sigma6")
                if state then
                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "Sigma5"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = Color3.new(1, 0, 0)
                        highlight.Parent = model
                    end
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "Sigma6"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = model.Head
                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = model.Name
                        textLabel.TextColor3 = Color3.new(1, 0, 0)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end
                else
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                end
            end
        end
        game.Workspace.Players.Killers.ChildAdded:Connect(function(child)
            if state and child:IsA("Model") and child:FindFirstChild("Head") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Sigma5"
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillTransparency = 1
                highlight.OutlineColor = Color3.new(1, 0, 0)
                highlight.Parent = child
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "Sigma6"
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = child.Head
                local textLabel = Instance.new("TextLabel", billboard)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = child.Name
                textLabel.TextColor3 = Color3.new(1, 0, 0)
                textLabel.TextStrokeTransparency = 0
                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                textLabel.BackgroundTransparency = 1
            end
        end)
    end
})

local SESection = VisualsTab:CreateSection("Status Effects")

local StatusEffects = game:GetService("ReplicatedStorage").Modules.StatusEffects
local SubspacedClone = StatusEffects.SurvivorExclusive:FindFirstChild("Subspaced") and StatusEffects.SurvivorExclusive.Subspaced:Clone() 
local SlownessClone = StatusEffects:FindFirstChild("Slowness") and StatusEffects.Slowness:Clone()
local BlindnessClone = StatusEffects:FindFirstChild("Blindness") and StatusEffects.Blindness:Clone()
local HallucinationClone = StatusEffects.KillerExclusive:FindFirstChild("Hallucination") and StatusEffects.KillerExclusive.Hallucination:Clone()
local GlitchedClone = StatusEffects.KillerExclusive:FindFirstChild("Glitched") and StatusEffects.KillerExclusive.Glitched:Clone()

local AntiSubspacedToggle = VisualsTab:CreateToggle({ 
    Name = "Anti Subspaced",
    CurrentValue = false,
    Flag = "AntiSubspacedToggle",
    Callback = function(state)
        if state then
            local subspaced = StatusEffects.SurvivorExclusive:FindFirstChild("Subspaced") 
            if subspaced then
                subspaced:Destroy()
            end
        else
            if not StatusEffects.SurvivorExclusive:FindFirstChild("Subspaced") then 
                SubspacedClone:Clone().Parent = StatusEffects.SurvivorExclusive
            end
        end
    end,
})

local AntiSlownessToggle = VisualsTab:CreateToggle({
    Name = "Anti Slowness",
    CurrentValue = false,
    Flag = "AntiSlownessToggle",
    Callback = function(state)
        if state then
            local slowness = StatusEffects:FindFirstChild("Slowness")
            if slowness then
                slowness:Destroy()
            end
        else
            if not StatusEffects:FindFirstChild("Slowness") then
                SlownessClone:Clone().Parent = StatusEffects
            end
        end
    end
})

local AntiBlindnessToggle = VisualsTab:CreateToggle({
    Name = "Anti Blindness",
    CurrentValue = false,
    Flag = "AntiBlindnessToggle",
    Callback = function(state)
        if state then
            local blindness = StatusEffects:FindFirstChild("Blindness")
            if blindness then
                blindness:Destroy()
            end
        else
            if not StatusEffects:FindFirstChild("Blindness") then
                BlindnessClone:Clone().Parent = StatusEffects
            end
        end
    end
})

local AntiHallucinationToggle = VisualsTab:CreateToggle({
    Name = "Anti Hallucination",
    CurrentValue = false,
    Flag = "AntiHallucinationToggle",
    Callback = function(state)
        if state then
            local hallucination = StatusEffects.KillerExclusive:FindFirstChild("Hallucination")
            if hallucination then
                hallucination:Destroy()
            end
        else
            if not StatusEffects.KillerExclusive:FindFirstChild("Hallucination") then
                HallucinationClone:Clone().Parent = StatusEffects.KillerExclusive
            end
        end
    end
})

local AntiGlitchedToggle = VisualsTab:CreateToggle({
    Name = "Anti Glitched (only removes the screen glitch effect)",
    CurrentValue = false,
    Flag = "AntiGlitchedToggle",
    Callback = function(state)
        if state then
            local glitched = StatusEffects.KillerExclusive:FindFirstChild("Glitched")
            if glitched then
                glitched:Destroy()
            end
        else
            if not StatusEffects.KillerExclusive:FindFirstChild("Glitched") then
                GlitchedClone:Clone().Parent = StatusEffects.KillerExclusive
            end
        end
    end
})

local LocalTab = Window:CreateTab("Local", "user")

local InfStamToggle = LocalTab:CreateToggle({ 
      Name = "Inf Stamina",
      CurrentValue = false,
      Callback = function(state)
         stam = state
        local stamscript = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
        local connection
        connection = game:GetService("RunService").Heartbeat:Connect(function()
            if not stam then
                connection:Disconnect()
                stamscript.StaminaLossDisabled = nil
                return
            end
            stamscript.StaminaLossDisabled = function() 
            end
        end)
      end,
})

local Divider = LocalTab:CreateDivider()

local GravitySlider = LocalTab:CreateSlider({
   Name = "Gravity",
   Range = {1, 300},
   Increment = 1,
   CurrentValue = 196,
   Callback = function(Value)
      game.Workspace.Gravity = Value
   end,
})

local Divider = LocalTab:CreateDivider()

local Walkspeed = 1
local WSSlider = LocalTab:CreateSlider({
   Name = "Walkspeed Multiplier",
   Range = {1, 10},
   Increment = 0.1,
   CurrentValue = Walkspeed,
   Callback = function(Value)
       Walkspeed = Value
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("SpeedMultipliers") then
           char.SpeedMultipliers.Sprinting.Value = Value
       end
   end,
})

local KeepWS = false
local LWSToggle = LocalTab:CreateToggle({
   Name = "Loop Walkspeed",
   CurrentValue = false,
   Flag = "LWSToggle",
   Callback = function(Value)
       KeepWS = Value
       if KeepWS then
           task.spawn(function()
               while KeepWS do
                   local char = game.Players.LocalPlayer.Character
                   if char and char:FindFirstChild("SpeedMultipliers") then
                       if char.SpeedMultipliers.Sprinting.Value ~= Walkspeed then
                           char.SpeedMultipliers.Sprinting.Value = Walkspeed
                       end
                   end
                   task.wait()
               end
           end)
       end
   end,
})

local Divider = LocalTab:CreateDivider()

local JumpPower = 50
local JPSlider = LocalTab:CreateSlider({
   Name = "JumpPower",
   Range = {1, 500},
   Increment = 1,
   CurrentValue = JumpPower,
   Callback = function(Value)
       JumpPower = Value
       local humanoid = game.Players.LocalPlayer.Character.Humanoid
       if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = Value
       end
   end,
})

local KeepJP = false
local LJPToggle = LocalTab:CreateToggle({
   Name = "Loop JumpPower",
   CurrentValue = false,
   Flag = "LJPToggle",
   Callback = function(Value)
       KeepJP = Value
       if KeepJP then
           task.spawn(function()
               while KeepJP do
                   local humanoid = game.Players.LocalPlayer.Character.Humanoid
                   if humanoid then
                        humanoid.UseJumpPower = true
                       if humanoid and humanoid.JumpPower ~= JumpPower then
                           humanoid.JumpPower = JumpPower
                       end
                   end
                   task.wait()
               end
           end)
       end
   end,
})

local EmotesTab = Window:CreateTab("Emotes", "person-standing")

local ELabel = EmotesTab:CreateLabel("Other people won't see the effects or assets, they will only see the animation", "triangle-alert")

local function EnableEmote(state, animationId, soundId, emoteName, scriptName, effectPath, destroyAssets, loopSound)
    local p = game.Players.LocalPlayer
    local char = p.Character or p.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    if state then
        humanoid.PlatformStand = true
        humanoid.JumpPower = 0
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = root

        if scriptName then
            local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes[scriptName])
            emoteScript.Created({Character = char})
        end

        local animation = Instance.new("Animation")
        animation.AnimationId = animationId
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()

        local sound = Instance.new("Sound")
        sound.SoundId = soundId
        sound.Parent = root
        sound.Volume = 0.5
        sound.Looped = loopSound or false
        sound:Play()

        local effect
        if effectPath then
            local effectTemplate = game:GetService("ReplicatedStorage").Assets.Emotes.HakariDance:FindFirstChild(effectPath)
            if effectTemplate then
                effect = effectTemplate:Clone()
                effect.Name = "PlayerEmoteVFX"
                effect.Parent = char
                effect.CanCollide = false

                effect.CFrame = root.CFrame * CFrame.new(0, -1, -0.3)

                local weld = Instance.new("WeldConstraint")
                weld.Part0 = root
                weld.Part1 = effect
                weld.Parent = effect
            else
                warn("Hakari aura effect not found!")
            end
        end

        local args = {"PlayEmote", "Animations", emoteName}
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

        animationTrack.Stopped:Connect(function()
            humanoid.PlatformStand = false
            if bodyVelocity and bodyVelocity.Parent then
                bodyVelocity:Destroy()
            end
            if effect then
                effect:Destroy()
            end
            if destroyAssets then
                for _, asset in ipairs(destroyAssets) do
                    local foundAsset = char:FindFirstChild(asset)
                    if foundAsset then foundAsset:Destroy() end
                end
            end
        end)
    else
        humanoid.PlatformStand = false
        humanoid.JumpPower = 0

        local existingEffect = char:FindFirstChild("PlayerEmoteVFX")
        if existingEffect then
            existingEffect:Destroy()
        end

        if destroyAssets then
            for _, asset in ipairs(destroyAssets) do
                local foundAsset = char:FindFirstChild(asset)
                if foundAsset then foundAsset:Destroy() end
            end
        end

        local bodyVelocity = root:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end

        local sound = root:FindFirstChildOfClass("Sound")
        if sound then
            sound:Stop()
            sound:Destroy()
        end

        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId == animationId then
                track:Stop()
            end
        end
    end
end

local Hakari = EmotesTab:CreateToggle({
    Name = "Hakari Dance",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://138019937280193", "rbxassetid://87166578676888", "HakariDance", nil, "HakariBeamEffect", {"PlayerEmoteVFX"}, true)
    end,
})

local HMMSection = EmotesTab:CreateSection("With Hookmetamethod")

local Shucks = EmotesTab:CreateToggle({
    Name = "Shucks",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://74238051754912", "rbxassetid://123236721947419", "Shucks", "Shucks", nil, {"Saw", "PlayerEmoteHand"}, false)
    end,
})

local MissTheQuiet = EmotesTab:CreateToggle({
    Name = "Miss the Quiet",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://100986631322204", "rbxassetid://131936418953291", "MissTheQuiet", "MissTheQuiet", nil, {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}, false)
    end,
})

local Subterfuge = EmotesTab:CreateToggle({
    Name = "Subterfuge",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://87482480949358", "rbxassetid://132297506693854", "Subterfuge", "Subterfuge", nil, {"PlayerEmoteHand"}, false)
    end,
})

local SillyBilly = EmotesTab:CreateToggle({
    Name = "Silly Billy",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, 
            "rbxassetid://107464355830477", "rbxassetid://77601084987544", "SillyBilly", "SillyBilly", "SillyBilly.SillyBillyMicrophone", {"SillyBillyMicrophone"}, false)
    end,
})

local NoHMMSection = EmotesTab:CreateSection("No Hookmetamethod")

local Shucks2 = EmotesTab:CreateToggle({
    Name = "Shucks [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://74238051754912", "rbxassetid://123236721947419", "Shucks", nil, nil, false)
    end,
})

local MissTheQuiet2 = EmotesTab:CreateToggle({
    Name = "Miss the Quiet [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://100986631322204", "rbxassetid://131936418953291", "MissTheQuiet", nil, nil, false)
    end,
})

local Subterfuge2 = EmotesTab:CreateToggle({
    Name = "Subterfuge [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://87482480949358", "rbxassetid://132297506693854", "Subterfuge", nil, nil, false)
    end,
})

local SillyBilly2 = EmotesTab:CreateToggle({
    Name = "Silly Billy [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        EnableEmote(state, "rbxassetid://107464355830477", "rbxassetid://77601084987544", "SillyBilly", nil, nil, false)
    end,
})

local MiscTab = Window:CreateTab("Misc", "settings")

local DestroyUIButton = MiscTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
         Rayfield:Destroy()
   end,
})
