pointPart = script.Parent
pointValue = script.Parent.points
pointsGUItext = script.Parent.pointsGUI.TextLabel
Pins = script.Parent.Parent.Pins
pinsCopy = game.ServerStorage.Pins
scoreDisplay = script.Parent.Parent.scoreDisplay.SurfaceGui.TextLabel

pointsGUItext.Text = pointValue.Value

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
			local pinsCopy = pinsCopy:Clone()
			pinsCopy.Parent = pointPart.Parent.Pins
			pointValue.Value = 0
			scoreDisplay.Text = pointValue.Value

		end
		
	else
		print("not a bowlingpin")
	end
	
end)