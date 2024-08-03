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

	script.Parent.Bowling.game1Button.MouseButton1Click:Connect(function()
		Character:MoveTo(workspace.bowling.game1.bowlingSpawn.Position)
		script.Parent.Bowling.Visible = false
	end)
	
	script.Parent.Bowling.game2Button.MouseButton1Click:Connect(function()
		Character:MoveTo(workspace.bowling.game2.bowlingSpawn2.Position)
		script.Parent.Bowling.Visible = false
	end)

	script.Parent.Bowling.game3Button.MouseButton1Click:Connect(function()
		Character:MoveTo(workspace.bowling.game3.bowlingSpawn3.Position)
		script.Parent.Bowling.Visible = false

	end)
	
	script.Parent.Bowling.game4Button.MouseButton1Click:Connect(function()
		Character:MoveTo(workspace.bowling.game4.bowlingSpawn4.Position)
		script.Parent.Bowling.Visible = false

	end)

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
