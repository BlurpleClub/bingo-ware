
local plr = game:GetService("Players").LocalPlayer
if plr:IsInGroup("14217738") then

-- // Start
game.StarterGui:SetCore("SendNotification", {Title = "Bingo-Ware", Text = "Thanks for buying! Enjoy.", Icon = "rbxassetid://505845268", Duration = 10, Button1 = "Mwa"})
local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()


local win = lib:Window("Bingo-Ware",Color3.fromRGB(52, 79, 235), Enum.KeyCode.RightShift)

local tab = win:Tab("Aimlock")

local tab2 = win:Tab("Misc")

local tab3 = win:Tab("Avatar Stuff")

tab:Button("Dot Lock (Q)", function()
    lib:Notification("Dot Lock Enabeld", "Q to toggle.", "Thank :D")
    
    local CC = game:GetService'Workspace'.CurrentCamera
    local Plr
    local enabled = false
    local accomidationfactor =  0.14
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
    local guimain = Instance.new("Folder", game.CoreGui)
    
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = true
        local a = Instance.new("Frame", e)
        a.Size = UDim2.new(1, 0, 1, 0)
        a.BackgroundTransparency = 0
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        g.CornerRadius = UDim.new(30, 30)
        return(e)
    end
    
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild("LowerTorso"), Color3.fromRGB(0, 76, 153), 0.0, 0)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("Head") end)
        
        local TextLabel = Instance.new("TextLabel", handler)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 0, 0, -50)
        TextLabel.Size = UDim2.new(0, 100, 0, 100)
        TextLabel.Font = Enum.Font.SourceSansSemibold
        TextLabel.TextSize = 14
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        TextLabel.Text = 'Name: '..player.Name
        TextLabel.ZIndex = 10
        
        spawn(function()
            while wait() do
                if player.Character then
                    --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
                end
            end
        end)
    end
    
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
    
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
    
    game.Players.PlayerRemoving:Connect(function()
        guimain[player.Name]:Destroy()
    end)
    
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
        placemarker.Transparency = 10
        makemarker(placemarker, placemarker, Color3.fromRGB(103, 75, 242), 0.55, 0)
    end)    
    
    mouse.KeyDown:Connect(function(k)
        if k ~= "q" then return end
        if enabled then
            enabled = false
           -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            enabled = true 
            Plr = getClosestPlayerToCursor()
            --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
        end    
    end)
    
    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = math.huge
    
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
       return closestPlayer
    end
    
        game:GetService"RunService".Stepped:connect(function()
            if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
                placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
            else
                placemarker.CFrame = CFrame.new(0, 9999, 0)
            end
        end)
    
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
                return old(unpack(args))
            end
            return old(...)
        end)
    end)

    tab2:Button("Speed (M) (N)", function()
        lib:Notification("Speed Enabeld", "Use M to Go faster and N to slow down.", "Elp meh")
        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BlurpleClub/bingo-ware/main/Speed%20glitch.lua", true))()
        end)

            tab3:Button("Right Korblox (Client Sided)", function()
                lib:Notification("Right Korblox","Right Korblox Enabled", "Okay")
                      local ply = game.Players.LocalPlayer
                        local chr = ply.Character
                        chr.RightLowerLeg.MeshId = "902942093"
                        chr.RightLowerLeg.Transparency = "1"
                        chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
                        chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
                        chr.RightFoot.MeshId = "902942089"
                        chr.RightFoot.Transparency = "1"
                end)
                
                tab3:Button("Headless (Client Sided)", function()
                    lib:Notification("Headless","Headless Enabled", "Okay")
                           getgenv().game.Players.LocalPlayer.Character.Head.Transparency = 1
                            getgenv().game.Players.LocalPlayer.Character.Head.face:Destroy()
                            getgenv().game.Players.LocalPlayer.Character.Head.face:Destroy()
                    end)

    else
        plr:kick("Funky Floppa Says YOUR NOT WHITELISTED")
        end 
