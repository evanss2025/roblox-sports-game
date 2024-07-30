pointPart = script.Parent
pointValue = script.Parent.points
pointsGUItext = script.Parent.pointsGUI.TextLabel

pointsGUItext.Text = pointValue.Value

pointPart.Touched:Connect(function(p)
	if p.Name == "bowlingPin" then
		print("bowling pin touched point part")
		pointValue.Value = pointValue.Value + 1
		p:Destroy()
		print(pointValue.Value)
		pointsGUItext.Text = pointValue.Value
		
	else
		print("not a bowlingpin")
	end
	
end)