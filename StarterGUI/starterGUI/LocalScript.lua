button = script.Parent.playButton
game1 = script.Parent.Games.game1
game2 = script.Parent.Games.game2
game3 = script.Parent.Games.game3
Games = script.Parent.Games
title = script.Parent.title
homeGUI = script.Parent.Parent.homeGui
Player = game.Players.LocalPlayer
Character = Player.Character or Player.CharacterAdded:Wait()


Games.Visible = false
script.Parent.Bowling.Visible = false

button.MouseButton1Click:Connect(function()
	button:Destroy()
	Games.Visible = true
	
	local TweenService = game:GetService("TweenService")
	local goal = {}
	
	goal.Position = UDim2.new(0, 0)
	
	local tweenInfo = TweenInfo.new(1)

	local tween = TweenService:Create(Games, tweenInfo, goal)

	tween:Play()
	
end)

game1.game1Play.MouseButton1Click:Connect(function()
	Games.Visible = false
	title.Visible = false
	homeGUI.Enabled = true
	print("Game 1 was selected")
	script.Parent.Bowling.Visible = true
	Character:MoveTo(workspace.bowling.bowlingSpawn.Position)

end)

game2.game2Play.MouseButton1Click:Connect(function()
	Games.Visible = false
	title.Visible = false
	homeGUI.Enabled = true
	print("Game 2 was selected")
	
	Character:MoveTo(workspace.soccer.soccerSpawn.Position)


end)

game3.game3Play.MouseButton1Click:Connect(function()
	Games.Visible = false
	title.Visible = false
	homeGUI.Enabled = true
	print("Game 3 was selected")
	
	Character:MoveTo(workspace.tennis.tennisSpawn.Position)


end)
