local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "h4x fan 🔪",
   LoadingTitle = "h4x fan Edition",
   LoadingSubtitle = "by Your Nickname",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false,
   Theme = "Custom",
   CustomTheme = {
      WindowBackground = Color3.fromRGB(15, 15, 15),
      Background = Color3.fromRGB(25, 20, 20),
      Topbar = Color3.fromRGB(40, 10, 10),
      TextColor = Color3.fromRGB(240, 240, 240),
      TextColorDark = Color3.fromRGB(150, 100, 100),
      ElementColor = Color3.fromRGB(35, 20, 20),
      AccentColor = Color3.fromRGB(220, 20, 20),
      StrokeColor = Color3.fromRGB(255, 0, 0),
      PlaceholderColor = Color3.fromRGB(120, 50, 50)
   }
})

local MainTab = Window:CreateTab("Main Features 🔪", 4483362458)
local espEnabled = false

MainTab:CreateButton({
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
   end,
})

MainTab:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
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
   end,
})

local PlayerTab = Window:CreateTab("Player ⚡", 4483362458)

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

Rayfield:Notify({
   Title = "h4x fan UI",
   Content = "Custom theme successfully loaded!",
   Duration = 4,
   Image = 4483362458,
})
