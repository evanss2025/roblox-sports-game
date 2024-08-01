pointPart = script.Parent
pointValue = script.Parent.points
Pins = script.Parent.Parent.Pins
pinsCopy = game.ServerStorage.Pins
scoreDisplay = script.Parent.Parent.scoreDisplay.SurfaceGui.TextLabel
overallScore = script.Parent.Parent.playerScore.Value
Round = script.Parent.Parent.Round.Value
roundLabel = script.Parent.Parent.scoreDisplay2.SurfaceGui.roundLabel

scoreDisplay.Text = pointValue.Value
Round = 1
roundLabel.Text = "Round: " .. Round


pointPart.Touched:Connect(function(p)
	if p.Name == "bowlingPin" then
		print("bowling pin touched point part")
		pointValue.Value = pointValue.Value + 1
		p:Destroy()
		print(pointValue.Value)
		scoreDisplay.Text = pointValue.Value
		
		if #Pins:GetChildren() > 0 then
			print("There are still pins")
		
		else
			print("There are no pins left")
			Pins:Destroy()
			local pinsCopy = pinsCopy:Clone()
			pinsCopy.Parent = pointPart.Parent
			
			overallScore = overallScore + pointValue.Value
			script.Parent.Parent.scoreDisplay2.SurfaceGui.overallScore.Text = overallScore

			pointValue.Value = 0
			Round = Round + 1
			roundLabel.Text = "Round: " .. Round
			scoreDisplay.Text = pointValue.Value

		end
		
	else
		print("not a bowlingpin")
	end
	
end)
