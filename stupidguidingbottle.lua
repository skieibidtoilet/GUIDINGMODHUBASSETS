local tool = game:GetObjects(rbxassetid//75078116163466)[1]
local player = game.Players.LocalPlayer
local animations = tool:WaitForChild("Animations")

local function stupedremove()
	for _, descendant in ipairs(game.Workspace:GetDescendants()) do
		if descendant:IsA("Highlight") then
			descendant:Destroy()
		end
	end
end

local animator
local animationTrack
local animationTrack2

if tool then
	tool.Equipped:Connect(function()
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			animator = humanoid:FindFirstChild("Animator")
			if animator then
				animationTrack = animator:LoadAnimation(animations:WaitForChild("tempidle"))
				animationTrack.Looped = true
				animationTrack:Play()
			end
		end
		tool.Unequipped:Connect(function()
			if animationTrack then
				animationTrack:Stop()
			end
		end)
		tool.Activated:Connect(function()
			if animator then
				animationTrack2 = animator:LoadAnimation(animations:WaitForChild("tempopen"))
				animationTrack2.Looped = false
				animationTrack2:Play()
				task.wait(0.9)
				if animationTrack then
					animationTrack:Stop()
				end
				tool:Destroy()
				local uithing = player.PlayerGui:WaitForChild("MainUI")
				local mainFrame = uithing:WaitForChild("MainFrame")
				local whitevignette = mainFrame:WaitForChild("WhiteVignette")
				local heartbar = mainFrame:WaitForChild("Healthbar")
				local effect = heartbar:WaitForChild("Effects")
				local thatthing = effect:WaitForChild("HerbGreenEffect")
				local neweffect = thatthing:Clone()
				local newshit = whitevignette:Clone()
				newshit.Transparency = 0
				newshit.Name = "GuidingVignetteInsertContent"
				newshit.Parent = mainFrame
				newshit.ImageColor3 = Color3.fromRGB(33, 188, 255)
				newshit.BackgroundTransparency = 1
				newshit.Visible = true
				neweffect.Transparency = 0
				neweffect.Name = "GuidingEffectInsertContent"
				neweffect.Parent = effect
				neweffect.ImageColor3 = Color3.fromRGB(33, 188, 255)
				neweffect.BackgroundTransparency = 1
				neweffect.Visible = true
				local descendants = game.Workspace:GetDescendants()
				for _, descendant in ipairs(descendants) do
					if descendant.Name == "Door" then
						local highlig = Instance.new("Highlight")
						highlig.Parent = descendant
						highlig.FillColor = Color3.fromRGB(0, 255, 255)
					end
				end
				local function adddoorhighlights(descendant)
					if descendant.Name == "Door" then
						local highlig = Instance.new("Highlight")
						highlig.Parent = descendant
						highlig.FillColor = Color3.fromRGB(0, 255, 255)
					end
				end
				for _, descendant in ipairs(workspace:GetDescendants()) do
					adddoorhighlights(descendant)
				end
				task.wait(1)
				newshit.Transparency = 0.01
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.02
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.03
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.04
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.05
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.06
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.07
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.08
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.09
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.1
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.2
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.3
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.4
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.5
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.6
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.7
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.8
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 0.9
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Transparency = 1
				newshit.BackgroundTransparency = 1
				task.wait(1)
				newshit.Visible = false
				neweffect.Transparency = 1
				neweffect.Visible = false
				task.wait(1)
				newshit:Destroy()
				neweffect:Destroy()
				stupedremove()
			end
		end)
	end)
end
