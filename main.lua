local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()

local Window = OrionLib:MakeWindow({
    Name = "h4x fan 🔪", 
    HidePremium = true, 
    SaveConfig = false, 
    IntroText = "h4x fan loaded"
})

local MainTab = Window:MakeTab({
    Name = "Main Features 🔪",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

local espEnabled = false

MainTab:AddButton({
    Name = "Get All Coins",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        
        local container = workspace:FindFirstChild("Normal") or workspace:FindFirstChild("Map")
        if container then
            for _, obj in pairs(container:GetDescendants()) do
                if obj.Name == "Coin_Sub" or obj.Name == "Coin" and obj:IsA("BasePart") then
                    obj.CFrame = rootPart.CFrame
                end
            end
        end
    end
})

MainTab:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(Value)
        espEnabled = Value
        task.spawn(function()
            while espEnabled do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local isMurderer = p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife")
                        local isSheriff = p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun")
                        
                        local highlight = p.Character:FindFirstChildWhichIsA("Highlight")
                        if not highlight then
                            highlight = Instance.new("Highlight", p.Character)
                            highlight.OutlineTransparency = 0
                            highlight.FillTransparency = 0.5
                        end
                        
                        if isMurderer then
                            highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        elseif isSheriff then
                            highlight.FillColor = Color3.fromRGB(0, 0, 255)
                        else
                            highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        end
                    end
                end
                task.wait(2)
            end
            
            if not espEnabled then
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p.Character and p.Character:FindFirstChildWhichIsA("Highlight") then
                        p.Character:FindFirstChildWhichIsA("Highlight"):Destroy()
                    end
                end
            end
        end)
    end
})

local PlayerTab = Window:MakeTab({
    Name = "Player ⚡",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

PlayerTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Color = Color3.fromRGB(255,0,0),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end    
})

OrionLib:Init()
