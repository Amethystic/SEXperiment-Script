local Menu = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Username = game:GetService("Players").LocalPlayer.DisplayName
local Player = game:GetService("Players").LocalPlayer
local Global = game.StarterPlayer

local Cheatname = "SEXperiment.pl | "
local sds = "User:"

local Window = Menu:CreateWindow({
    Title = Cheatname .. sds,
    SubTitle = Username,
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Delete -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player" }),
    Chat = Window:AddTab({ Title = "Chat" }),
}

local Options = Menu.Options do
    Tabs.Player:AddParagraph({ Title = "Im such a scriptkitty meoww", Content = "Made by @athena.software" })
    local Toggle = Tabs.Player:AddToggle("MyToggle", {Title = "GodMode", Default = false })
    local Ragdoller = Tabs.Player:AddToggle("MyToggle2", {Title = "Ragdoller", Default = false })

    Toggle:OnChanged(function()
        if Options.MyToggle.Value then
            Player.PlayerScripts.GhostHandler.Disabled = Options.MyToggle.Value
            Global.StarterPlayerScripts.GhostHandler.Disabled = Options.MyToggle.Value
            Player.PlayerScripts.GhostHandler.RunContext = "Server"
            Global.StarterPlayerScripts.GhostHandler.RunContext = "Server"
            Player:SetAttribute("ToEnroll", false)
            Player:SetAttribute("Enrolled", false)
            Player:SetAttribute("State", "Alive")
            Player:SetAttribute("Team", "1")
            print("GODMODE: ON")
        else
            Player.PlayerScripts.GhostHandler.Disabled = Options.MyToggle.Value
            Global.StarterPlayerScripts.GhostHandler.Disabled = Options.MyToggle.Value
            Player.PlayerScripts.GhostHandler.RunContext = "Legacy"
            Global.StarterPlayerScripts.GhostHandler.RunContext = "Legacy"
            Player:SetAttribute("ToEnroll", true)
            Player:SetAttribute("Enrolled", true)
            Player:SetAttribute("State", "nil")
            Player:SetAttribute("Team", "nil")
            print("GODMODE: OFF")
        end 
    end)

    Ragdoller:OnChanged(function()
        if Options.MyToggle2.Value then
            Player:SetAttribute("AliveRagdoll", true)
            print("RAGDOLL: ON")
        else
            Player:SetAttribute("AliveRagdoll", false)
            print("RAGDOLL: OFF")
        end 
    end)

    Tabs.Chat:AddParagraph({ Title = "I love this chat!!!!!!!", Content = "Activate the spammers" })
    local Chatspam = Tabs.Chat:AddToggle("MyToggle3", {Title = "SchizoSpam", Default = false })

    Chatspam:OnChanged(function()
        if Options.MyToggle3.Value then
            getgenv().spammess = {
                ":3",
                "You're a silly boykisser!",
                "TEH EPIK DUCK IS COMING!!!",
                "<(0_0<) <(0_0)> (>0_0)> KIRBY DANCE",
                "GET OFF MAH LAWN",
                "all your base are belong to me!",
                "ROFL",
                "1337",
                "Muahahahaha!",
                "z0mg h4x!",
                "ub3rR0xXorzage!",
                "w00t!",
                "i r teh pwnz0r!",
                "Use the Chat menu to talk to me.",
                "I can only see menu chats"
            }
        
            while Options.MyToggle3.Value and wait(math.random(1, 1.5)) do
                local randomIndex = math.random(1, #getgenv().spammess)
                local message = getgenv().spammess[randomIndex]
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
                print(message)
            end
        end 
    end)
end