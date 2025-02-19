local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Forsaken Emote Hub",
   LoadingTitle = "By Ex0rdum",
   LoadingSubtitle = "worst hub ever",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Forsaken Emote Hub"
   }
})

local EmotesTab = Window:CreateTab("Emotes", "person-standing")

local function enable(state, animationId, soundId, emoteName, scriptName, effectPath, destroyAssets, loopSound)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local rootPart = char:WaitForChild("HumanoidRootPart")

    if state then
        humanoid.PlatformStand = true
        humanoid.JumpPower = 0
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = rootPart

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
        sound.Parent = rootPart
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

                effect.CFrame = rootPart.CFrame * CFrame.new(0, -1, -0.3)

                local weld = Instance.new("WeldConstraint")
                weld.Part0 = rootPart
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

        local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end

        local sound = rootPart:FindFirstChildOfClass("Sound")
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
        enable(state, "rbxassetid://138019937280193", "rbxassetid://87166578676888", "HakariDance", nil, "HakariBeamEffect", {"PlayerEmoteVFX"}, true)
    end,
})

local HMMSection = EmotesTab:CreateSection("With Hookmetamethod")

local Shucks = EmotesTab:CreateToggle({
    Name = "Shucks",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://74238051754912", "rbxassetid://123236721947419", "Shucks", "Shucks", nil, {"Saw", "PlayerEmoteHand"}, false)
    end,
})

local MissTheQuiet = EmotesTab:CreateToggle({
    Name = "Miss the Quiet",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://100986631322204", "rbxassetid://131936418953291", "MissTheQuiet", "MissTheQuiet", nil, {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}, false)
    end,
})

local Subterfuge = EmotesTab:CreateToggle({
    Name = "Subterfuge",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://87482480949358", "rbxassetid://132297506693854", "Subterfuge", "Subterfuge", nil, {"PlayerEmoteHand"}, false)
    end,
})

local SillyBilly = EmotesTab:CreateToggle({
    Name = "Silly Billy",
    CurrentValue = false,
    Callback = function(state)
        enable(state, 
            "rbxassetid://107464355830477", "rbxassetid://77601084987544", "SillyBilly", "SillyBilly", "SillyBilly.SillyBillyMicrophone", {"SillyBillyMicrophone"}, false)
    end,
})

local NoHMMSection = EmotesTab:CreateSection("No Hookmetamethod")

local Shucks2 = EmotesTab:CreateToggle({
    Name = "Shucks [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://74238051754912", "rbxassetid://123236721947419", "Shucks", nil, nil, false)
    end,
})

local MissTheQuiet2 = EmotesTab:CreateToggle({
    Name = "Miss the Quiet [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://100986631322204", "rbxassetid://131936418953291", "MissTheQuiet", nil, nil, false)
    end,
})

local Subterfuge2 = EmotesTab:CreateToggle({
    Name = "Subterfuge [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://87482480949358", "rbxassetid://132297506693854", "Subterfuge", nil, nil, false)
    end,
})

local SillyBilly2 = EmotesTab:CreateToggle({
    Name = "Silly Billy [No Hookmetamethod]",
    CurrentValue = false,
    Callback = function(state)
        enable(state, "rbxassetid://107464355830477", "rbxassetid://77601084987544", "SillyBilly", nil, nil, false)
    end,
})

local CreditsTab = Window:CreateTab("Scripts that I skidded from")
local Paragraph = CreditsTab:CreateParagraph({Title = "Appleware's AppleSaken Script", Content = "MASSIVE thanks for Appleware because they gave me the basic idea for the core of this script (and also Hakari, Shucks and Miss The Quiet Animation)"})
local Paragraph = CreditsTab:CreateParagraph({Title = "zrvvz's Subterfuge Emote Script", Content = "Also got the Subterfuge Emote from him"})
