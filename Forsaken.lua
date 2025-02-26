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
local KillerTab = Window:CreateTab("Killer", "axe")
local GeneratorTab = Window:CreateTab("Generator", "dock")
local VisualsTab = Window:CreateTab("Visuals", "eye")
local LocalTab = Window:CreateTab("Local", "user")
local MiscTab = Window:CreateTab("Misc", "settings")
