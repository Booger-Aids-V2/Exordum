local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

local scripts = {
    [2537430692] = "https://raw.githubusercontent.com/Booger-Aids-V2/Exordum/refs/heads/main/Blocks%20n'%20Props"
}

local url = scripts[game.PlaceId]

if url then
    loadstring(game:HttpGet(url))()
else
    WindUI:Notify({
        Title = "Warning",
        Content = "You are currently in an unsupported game",
        Duration = 5,
    })
    local Window = WindUI:CreateWindow({
        Title = "Exordum Hub - Loader",
        Icon = nil,
        Author = "by Exordum",
        Folder = nil,
        Size = UDim2.fromOffset(580, 460),
        Transparent = true,
        Theme = "Dark",
        UserEnabled = false,
        SideBarWidth = 200,
        HasOutline = true,
    })
    local MainTab = Window:Tab({
        Title = "Supported Games",
        Icon = "gamepad-2",
    })
    Window:SelectTab(1)
    MainTab:Button({
        Title = "Blocks N' Props",
        Desc = "Teleports you to Blocks N' Props",
        Callback = function()
            game:GetService("TeleportService"):Teleport(2537430692, game.Players.LocalPlayer)
        end,
    })
end
