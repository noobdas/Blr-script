--// GPT X HUB - By ChatGPT (For Faheem!)

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Sloppy GnG",
    LoadingTitle = "Sloppy GnG Loading...",
    LoadingSubtitle = "Made by Sloppy GnG",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "GPTXHUB",
        FileName = "GPTXHUBConfig"
    },
    KeySystem = false,
})

local MainTab = Window:CreateTab("Main™", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)
local FunTab = Window:CreateTab("Fun", 4483362458)
local RageTab = Window:CreateTab("Rage", 4483362458)
local StyleChangerTab = Window:CreateTab("Style Changer", 4483362458)

local LocalPlayerSection = MainTab:CreateSection("PlayerSet")

LocalPlayerSection:CreateButton({
    Name = "No Cooldown",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local C = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
        local o = C.AbilityCooldown
        C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
        Rayfield:Notify({Title = "No Cooldown", Content = "No Cooldown Activated!", Duration = 5})
    end,
})

LocalPlayerSection:CreateButton({
    Name = "Infinite Awakening",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local StarterGui = game:GetService("StarterGui")
        local LocalPlayer = Players.LocalPlayer
        local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))

        StarterGui:SetCore("SendNotification", {
            Title = "InfAwakening",
            Text = "Only works for Kaiser, King, Kurona!",
            Duration = 7
        })

        task.spawn(function()
            while task.wait(1) do
                if LocalPlayer and LocalPlayer:FindFirstChild("PlayerStats") and LocalPlayer.PlayerStats:FindFirstChild("InAwakening") then
                    LocalPlayer.PlayerStats.InAwakening.Value = true
                    AbilityController:UseAbility("Awakening")
                end
            end
        end)
    end,
})

local MiscSection = MiscTab:CreateSection("Misc Player")

MiscSection:CreateButton({
    Name = "Noclip",
    Callback = function()
        game:GetService('RunService').Stepped:Connect(function()
            local character = game.Players.LocalPlayer.Character
            if character then
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end,
})

MiscSection:CreateButton({
    Name = "Anti Ragdoll",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("RagdollRemote") then
            player.Character.RagdollRemote:Destroy()
        end
    end,
})

MiscSection:CreateButton({
    Name = "Anti Breaker",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Breaker") then
            player.Character.Breaker:Destroy()
        end
    end,
})

local FunSection = FunTab:CreateSection("Fun Features")

FunSection:CreateButton({
    Name = "Force Give Ball",
    Callback = function()
        local ball = workspace:FindFirstChild("Ball")
        if ball and ball:FindFirstChildOfClass("ProximityPrompt") then
            fireproximityprompt(ball:FindFirstChildOfClass("ProximityPrompt"))
        end
    end,
})

local RageSection = RageTab:CreateSection("Rage Features")

local cfSpeed = 0.2
local cfEnabled = false

MainTab:CreateSlider({
	Name = "Speed Hack",
	Range = {0.2, 0.7},
	Increment = 0.05,
	Suffix = "Speed",
	CurrentValue = cfSpeed,
	Flag = "cf_slider",
	Callback = function(val)
		cfSpeed = val
	end,
})

MainTab:CreateToggle({
	Name = "Toggle Speed Hack",
	CurrentValue = false,
	Flag = "cf_toggle",
	Callback = function(enabled)
		cfEnabled = enabled
		if enabled then
			task.spawn(function()
				while cfEnabled and task.wait() do
					local p = game.Players.LocalPlayer
					local c = p.Character
					if c then
						local h = c:FindFirstChildOfClass("Humanoid")
						local hrp = c:FindFirstChild("HumanoidRootPart")
						if h and hrp then
							hrp.CFrame = hrp.CFrame + (h.MoveDirection * cfSpeed)
						end
					end
				end
			end)
		end
	end,
})

local StyleSection = StyleChangerTab:CreateSection("Change Style")

StyleSection:CreateDropdown({
    Name = "Choose Style",
    Options = {
        "NEL Isagi: Direct Shot",
        "NEL Bachira: Monster",
        "Kunigami: Power Shot",
        "Chigiri: Speedster",
        "Nagi: Genius Trapper",
        "Baro: King",
        "Rin: Calculated Precision",
        "Sae: Maestro",
        "Kaiser: Emperor's Vision",
        "Lorenzo: Shadow Defense",
        "Shidou: Wild Card",
    },
    Callback = function(style)
        Rayfield:Notify({Title = "Style Changer", Content = "Selected: " .. style, Duration = 5})
    end,
})
