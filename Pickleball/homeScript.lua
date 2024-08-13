inventoryButton = script.Parent.inventoryButton
storeButton = script.Parent.storeButton
playButton = script.Parent.playButton
settingsButton = script.Parent.settingsButton

script.Parent.Parent.storeGUI.Enabled = false
script.Parent.Parent.inventoryGUI.Enabled = false
script.Parent.Parent.settingsGUI.Enabled = false

storeButton.MouseButton1Click:Connect(function()
	checkEnabled(script.Parent.Parent.inventoryGUI)
	checkEnabled(script.Parent.Parent.settingsGUI)
	script.Parent.Parent.storeGUI.Enabled = true
end)

inventoryButton.MouseButton1Click:Connect(function()
	checkEnabled(script.Parent.Parent.storeGUI)
	checkEnabled(script.Parent.Parent.settingsGUI)
	script.Parent.Parent.inventoryGUI.Enabled = true
end)

settingsButton.MouseButton1Click:Connect(function()
	checkEnabled(script.Parent.Parent.inventoryGUI)
	checkEnabled(script.Parent.Parent.storeGUI)
	script.Parent.Parent.settingsGUI.Enabled = true
end)

function checkEnabled(gui)
	if gui.Enabled == true then
		gui.Enabled = false
	end
end
