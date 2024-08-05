closeButton = script.Parent.settingsBackground.closeButton
script.Parent.muteButton.Visible = false
music = game.Workspace.Sound["Life in an Elevator"]

music.Playing = true

closeButton.MouseButton1Click:Connect(function()
	script.Parent.Enabled = false
end)

script.Parent.musicButton.MouseButton1Click:Connect(function()
	music.Playing = false
	script.Parent.muteButton.Visible = true
	script.Parent.musicButton.Visible = false
end)

script.Parent.muteButton.MouseButton1Click:Connect(function()
	music.Playing = true
	script.Parent.muteButton.Visible = false
	script.Parent.musicButton.Visible = true
end)
