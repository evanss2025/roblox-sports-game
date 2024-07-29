homeButton = script.Parent.Frame.homeButton
homeGUI = script.Parent
Games = script.Parent.Parent.starterGUI.Games
title = script.Parent.Parent.starterGUI.title

homeGUI.Enabled = false

homeButton.MouseButton1Click:Connect(function()
	homeGUI.Enabled = false
	Games.Visible = true
	title.Visible = true
	
end)
