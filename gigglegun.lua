-- this is skidded from upio!!
-- i know you decompiled this so uh just know this is skidded from upio (like the actual one)

local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local tweenService = game:GetService("TweenService")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local seekGun = game:GetObjects("rbxassetid://112675435735952")[1] or LoadCustomInstance("https://raw.githubusercontent.com/skieibidtoilet/GUIDINGMODHUBASSETS/main/gigglepistol.rbxm")
local seekAmmo = game:GetObjects("rbxassetid://132132497310273")[1] or LoadCustomInstance("https://raw.githubusercontent.com/skieibidtoilet/GUIDINGMODHUBASSETS/main/giggleammo.rbxm")
local seekPuddle = game:GetObjects("rbxassetid://114661544220782")[1] or LoadCustomInstance("https://raw.githubusercontent.com/skieibidtoilet/GUIDINGMODHUBASSETS/main/gigglepuddle.rbxm")
seekPuddle.Size = Vector3.new(0.001, 0.001, 0.001)

seekGun.Parent = player.Backpack

function playSound(rbxassetid,part)
    task.spawn(function()
        local sound = Instance.new("Sound",part or game:GetService("ReplicatedStorage"))
        sound.SoundId = LoadCustomAsset(rbxassetid)
        sound:Play()
        sound.Ended:Wait()
        sound:Destroy()
    end)
end

local function check(room)
    local Assets = room:WaitForChild("Assets",2)
    
    if Assets then
        for _,obj in ipairs(Assets:GetChildren()) do
            if string.match(obj.Name,"Painting") or string.match(obj.Name,"painting") then
                for _,instance in ipairs(obj:GetDescendants()) do
                    if instance:IsA("BasePart") or instance:IsA("Part") or instance:IsA("MeshPart") then
                        instance.CanTouch = true
                    end
                end
            end
        end
    end
end

local addconnect
addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
    check(room)
end)

for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
    check(v)
end

task.spawn(function()
    repeat task.wait() until seekGun == nil or not (seekGun:IsDescendantOf(player.Character) or seekGun:IsDescendantOf(player.Backpack))
    addconnect:Disconnect()
    seekAmmo:Destroy()
end)

function playPuddleAnimationOverModel(model)
    task.spawn(function()
        local seekPuddleClone = seekPuddle:Clone()

        seekPuddleClone.Position = model["Left Leg"].Position - Vector3.new(0,0.8,0)
        
        seekPuddleClone.CanCollide = true
        seekPuddleClone.Anchored = true
        seekPuddleClone.Parent = workspace

        tweenService:Create(seekPuddleClone,TweenInfo.new(1.5,Enum.EasingStyle.Sine),{
            ["Size"] = Vector3.new(10, 0.636, 10)
        }):Play()
    end)
end

seekGun.Activated:Connect(function()
    local seekAmmoClone = seekAmmo:Clone()
    local spawnPos = workspace.CurrentCamera.CFrame:ToWorldSpace(CFrame.new(0,0,-3) * CFrame.lookAt(Vector3.new(0, 0, 0), workspace.CurrentCamera.CFrame.LookVector))
    
    local Attachment = Instance.new("Attachment", seekAmmoClone)
    local LV = Instance.new("LinearVelocity", Attachment)
    LV.MaxForce = math.huge
    LV.VectorVelocity = mouse.Hit.LookVector * 0.5 * ((_G.launchForce or 20) * 10)
    LV.Attachment0 = Attachment

    seekAmmoClone.Parent = workspace
    seekAmmoClone.CFrame = spawnPos

    playSound("rbxassetid://9119460421")

    seekAmmoClone.Touched:Connect(function(hit)
        seekAmmoClone:Destroy()
        
        task.spawn(function()
            if not (game.Players:GetPlayerFromCharacter(hit.Parent)) and hit.Name ~= "Hidden" then
                local model = hit:FindFirstAncestorWhichIsA("Model")

                if model ~= nil and not (workspace.CurrentRooms:FindFirstChild(model.Name)) and model ~= workspace then
                    playSound("rbxassetid://344167846")

                    for _,instance in ipairs(model:GetDescendants()) do
                        if instance:IsA("BasePart") or instance:IsA("Part") or instance:IsA("MeshPart") then
                            instance.Anchored = false
                            instance.Material = "Salt"
                            instance.Color = Color3.fromRGB(163, 162, 165)
                        end

                        if instance:IsA("TextLabel") then
                            instance.TextColor3 = Color3.fromRGB(163, 162, 165)
                        end
                    end

                    if model.Name == "JeffTheKiller" then
                        local humanoid = model:FindFirstChildOfClass("Humanoid")

                        if humanoid.Health ~= 0 then
                            playPuddleAnimationOverModel(model)
                            playSound("rbxassetid://1196653896")
                        end
                        
                        humanoid.Health = 0
                    end
                end

                if hit.Name == "BananaPeel" and hit:IsDescendantOf(workspace) then
                    playSound("rbxassetid://344167846")
                    
                    hit.Color = Color3.fromRGB(163, 162, 165)
                    hit.Material = "Salt"

                    local mesh = hit:FindFirstChildOfClass("SpecialMesh")
                    mesh.TextureId = ""
                end
            end
        end)
    end)
end)
