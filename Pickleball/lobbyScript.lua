closeButton = script.Parent.lobbyBackground.closeButton
reactPart = game.Workspace.reactPart
position = script.Parent.lobbyBackground.Position

script.Parent.Enabled = false

reactPart.Touched:Connect(function(p)
	if p.Parent:FindFirstChild("Humanoid") then
		script.Parent.Enabled = true
		
		local TweenService = game:GetService("TweenService")
		local goal = {}

		goal.Position = UDim2.new(0.146,0)

		local tweenInfo = TweenInfo.new(1)

		local tween = TweenService:Create(script.Parent.lobbyBackground, tweenInfo, goal)

		tween:Play()
		
	end
end)

closeButton.MouseButton1Click:Connect(function()
		local TweenService = game:GetService("TweenService")
		local goal = {}

		goal.Position = position

		local tweenInfo = TweenInfo.new(1)

		local tween = TweenService:Create(script.Parent.lobbyBackground, tweenInfo, goal)

		tween:Play()
		
		wait(1)
		
		script.Parent.Enabled = false

end)
