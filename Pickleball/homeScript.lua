inventoryButton = script.Parent.inventoryButton
storeButton = script.Parent.storeButton
settingsButton = script.Parent.settingsButton
storeGUI = script.Parent.Parent.storeGUI
settingsGUI = script.Parent.Parent.settingsGUI
invGUI = script.Parent.Parent.inventoryGUI
partyGUI = script.Parent.Parent.PartyGui.Main

storeGUI.Enabled = false
invGUI.Enabled = false
settingsGUI.Enabled = false

storeButton.MouseButton1Click:Connect(function()
	if storeGUI.Enabled == true then
		storeGUI.Enabled = false
	else
		checkEnabled(invGUI)
		checkEnabled(settingsGUI)
		checkParty()
		storeGUI.Enabled = true
	end
end)

inventoryButton.MouseButton1Click:Connect(function()
	if invGUI.Enabled == true then
		invGUI.Enabled = false
	else
		checkEnabled(storeGUI)
		checkEnabled(settingsGUI)
		checkParty()
		invGUI.Enabled = true
	end
end)

settingsButton.MouseButton1Click:Connect(function()
	if settingsGUI.Enabled == true then
		settingsGUI.Enabled = false
	else
		checkEnabled(invGUI)
		checkEnabled(storeGUI)
		checkParty()
		settingsGUI.Enabled = true
	end
end)

partyGUI.Parent.Open.MouseButton1Click:Connect(function()
	storeGUI.Enabled = false
	invGUI.Enabled = false
	settingsGUI.Enabled = false
end)

function checkEnabled(gui)
	if gui.Enabled == true then
		gui.Enabled = false
	end
end

function checkParty()
	if partyGUI.Visible == true then
		partyGUI.Visible = false
	end
end
