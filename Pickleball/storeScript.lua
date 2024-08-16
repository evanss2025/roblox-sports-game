local moneyLabel = script.Parent.storeBackground.money.TextLabel
local money = game.Players.LocalPlayer:WaitForChild("leaderstats"):FindFirstChild("Money")
local paddleBtn = script.Parent.storeBackground.options:WaitForChild("paddleButton")
local coinBtn = script.Parent.storeBackground.options:WaitForChild("coinButton")

moneyLabel.Text = "$" .. money.Value

script.Parent.storeBackground.ShopFrame.Visible = true

money:GetPropertyChangedSignal("Value"):Connect(function()
	moneyLabel.Text = "$" .. money.Value
end)

paddleBtn.MouseButton1Click:Connect(function()
	script.Parent.storeBackground.ShopFrame.Visible = true
end)

coinBtn.MouseButton1Click:Connect(function()
	script.Parent.storeBackground.ShopFrame.Visible = false
end)

closeButton = script.Parent.storeBackground.closeButton

closeButton.MouseButton1Click:Connect(function()
	script.Parent.Enabled = false
end)
