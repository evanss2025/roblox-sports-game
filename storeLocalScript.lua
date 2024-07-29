storeButton = script.Parent.Parent.homeGui.Frame.storeButton
testLabel = script.Parent.Frame.test
tennisStore = script.Parent.Frame.storeTabs.tennisStore
soccerStore = script.Parent.Frame.storeTabs.soccerStore
bowlingStore = script.Parent.Frame.storeTabs.bowlingStore
coinStore = script.Parent.Frame.storeTabs
items = script.Parent.Frame.items

tennisItems = {"tennisitem1", "tennisitem2",  "tennisitem3", "tennisitem4", "tennisitem5", "tennisitem6"}
soccerItems = {"socceritem1", "socceritem2",  "socceritem3", "socceritem4", "socceritem5", "socceritem6"}
bowlingItems = {"bowlingitem1", "bowlingitem2",  "bowlingitem3", "bowlingitem4", "bowlingitem5", "bowlingitem6"}
coinItems = {"coinitem1", "coinitem2",  "coinitem3", "coinitem4", "coinitem5", "coinitem6"}

script.Parent.Enabled = false

storeButton.MouseButton1Click:Connect(function()
	script.Parent.Enabled = true
end)

script.Parent.Frame.exitButton.MouseButton1Click:Connect(function()
	script.Parent.Enabled = false
end)

tennisStore.MouseButton1Click:Connect(function()
	testLabel.Text = "Tennis"
	
	for index, Instance in pairs(items:GetChildren()) do -- Iterates through a List of Items
		if Instance:FindFirstChild("itemText") then
			print("item text found")
		else
			print("no itemtext found")
		end
	end
end)

soccerStore.MouseButton1Click:Connect(function()
	testLabel.Text = "Soccer"
end)

bowlingStore.MouseButton1Click:Connect(function()
	testLabel.Text = "Bowling"
end)

coinStore.MouseButton1Click:Connect(function()
	testLabel.Text = "Coin"
end)

