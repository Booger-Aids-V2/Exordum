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
        if game:GetService("Players").LocalPlayer.PlayerData.Equipped.Survivor.Value ~= "Shedletsky" and state then
            Rayfield:Notify{
                Title = "Wrong Character",
                Content = "Your current character isn't Shedletsky, you can still enable this but it might cause bugs, so it's best just to turn it off if you aren't using Shedletsky",
                Duration = 5
            }
            return
        end
        if state then
            shedloop = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
                if not shedaim then return end
                for _, v in pairs(shedaimbotsounds) do
                    if child.Name == v then
                        local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                        if killersFolder then
                            local killer = killersFolder:FindFirstChildOfClass("Model")
                            if killer and killer:FindFirstChild("HumanoidRootPart") then
                                local killerHRP = killer.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if playerHRP then
                                    local num, maxIterations = 1, 100
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if shedloop then
                shedloop:Disconnect()
                shedloop = nil
            end
        end
    end,
})

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
                Content = "Your current character isn't 1x1x1x1, you can still enable this but it might cause bugs, so it's best just to turn it off if you aren't using 1x1x1x1",
                Duration = 5
            }
            return
        end
        if state then
            AimLoop1x = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not aimbot1x1 then return end
                for _, v in pairs(aimbot1x1sounds) do
                    if child.Name == v then
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
                        for _, survivor in pairs(survivors) do
                            local survivorHRP = survivor.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then
                                local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestSurvivor = survivor
                                end
                            end
                        end
                        if nearestSurvivor then
                            local nearestHRP = nearestSurvivor.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then
                                local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                local num, maxIterations = 1, 100  
                                if child.Name == "rbxassetid://79782181585087" then
                                    maxIterations = 220  
                                end
                                while num <= maxIterations do
                                    task.wait(0.01)
                                    num = num + 1
                                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                    playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, nearestHRP.Position)
                                end
                            end
                        end
                    end
                end
            end)
        else
            if AimLoop1x then
                AimLoop1x:Disconnect()
                AimLoop1x = nil
            end
        end
    end,
})

local GeneratorTab = Window:CreateTab("Generator", "dock")
local VisualsTab = Window:CreateTab("Visuals", "eye")
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
