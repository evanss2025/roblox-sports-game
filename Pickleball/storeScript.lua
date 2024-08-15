local moneyLabel = script.Parent.storeBackground.money.TextLabel
local money = game.Players.LocalPlayer:WaitForChild("leaderstats"):FindFirstChild("Money")
local paddleBtn = script.Parent.storeBackground.options:WaitForChild("paddleButton")
local coinBtn = script.Parent.storeBackground.options:WaitForChild("coinButton")

moneyLabel.Text = "$" .. money.Value

money:GetPropertyChangedSignal("Value"):Connect(function()
	moneyLabel.Text = "$" .. money.Value
end)

paddleBtn.MouseButton1Click:Connect(function()
	script.Parent.storeBackground.items.TextLabel.Text = "Pickleball Paddle Shop"
end)

coinBtn.MouseButton1Click:Connect(function()
	script.Parent.storeBackground.items.TextLabel.Text = "Coin Shop"
end)

closeButton = script.Parent.storeBackground.closeButton

closeButton.MouseButton1Click:Connect(function()
	script.Parent.Enabled = false
end)
