sound = script.Parent.Parent.Sound.hit

script.Parent.Touched:Connect(function(touched)
	if touched.Parent:FindFirstChild("Humanoid") then
		if not sound.IsPlaying then
			sound:Play()
		end
	end
end)